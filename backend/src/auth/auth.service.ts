import {
  Injectable,
  UnauthorizedException,
  BadRequestException,
  InternalServerErrorException,
  Logger,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Throttle, ThrottlerGuard } from '@nestjs/throttler';
import { UseGuards } from '@nestjs/common';
import { tbdentaluserecord } from '../tbdentaluserrecord/entities/tbdentaluserrecord.entity';
import { hashPassword } from '../utils/hash/hash';
import * as crypto from 'crypto';

export interface LoginDto {
  users: string; // ใช้ users แทน username ตาม entity
  passw: string; // ใช้ passw แทน password ตาม entity
}

export interface LoginResponse {
  message: string;
  access_token: string;
  user: {
    userId: number;
    users: string;
  };
}

type UserRole =
  | 'Administrator'
  | 'ระบบนัดหมาย'
  | 'การเงิน'
  | 'เวชระเบียน'
  | 'อาจารย์'
  | 'ปริญญาตรี'
  | 'ระบบยา'
  | 'ผู้ใช้งานทั่วไป'
  | 'ปริญญาโท'
  | 'RequirementDiag'
  | 'หัวหน้าผู้ช่วยทันตแพทย์'
  | 'ผู้ช่วยทันตแแพทย์';

@Injectable()
@UseGuards(ThrottlerGuard)
export class AuthService {
  private readonly logger = new Logger(AuthService.name);

  constructor(
    @InjectRepository(tbdentaluserecord)
    private readonly tbdentaluserRepo: Repository<tbdentaluserecord>,
    private jwtService: JwtService,
    private configService: ConfigService,
  ) {}

  private getRoleFromRoleID(roleID: number): UserRole {
    const roleMap: { [key: number]: UserRole } = {
      1: 'Administrator',
      2: 'ระบบนัดหมาย',
      3: 'การเงิน',
      4: 'เวชระเบียน',
      5: 'อาจารย์',
      6: 'ปริญญาตรี',
      7: 'ระบบยา',
      8: 'ผู้ใช้งานทั่วไป',
      9: 'ปริญญาโท',
      10: 'RequirementDiag',
      11: 'หัวหน้าผู้ช่วยทันตแพทย์',
      12: 'ผู้ช่วยทันตแแพทย์',
    };

    return roleMap[roleID];
  }

  private getJwtSecret(role: UserRole): string | undefined {
    const keyMap = {
      ADMIN: 'JWT_ADMIN_KEY',
      APPOINTMENT: 'JWT_APPOINTMENT_KEY',
      PAYMENT: 'JWT_PAYMENT_KEY',
      MEDICALRECORD: 'JWT_MEDICALRECORD_KEY',
      TEACHER: 'JWT_TEACHER_KEY',
      BACHELOR: 'JWT_BACHELOR_KEY',
      DRUG: 'JWT_DRUG_KEY',
      GENERAL: 'JWT_GENERAL_KEY',
      MASTER: 'JWT_MASTER_KEY',
      REQUIREMENTDIAG: 'JWT_REQUIREMENTDIAG_KEY',
      HEADASSISTANTDENTIST: 'JWT_HEADASSISTANTDENTIST_KEY',
      ASSISTANTDENTIST: 'JWT_ASSISTANTDENTIST_KEY',
    };

    const envKey = keyMap[role];
    return (
      this.configService.get<string>(envKey) ||
      this.configService.get<string>('JWT_GENERAL_KEY')
    );
  }

  @Throttle({ default: { limit: 5, ttl: 60000 } })
  async validateUser(users: string, passw: string): Promise<any> {
    try {
      const user = await this.tbdentaluserRepo.findOne({
        where: { users: users },
        select: [
          'userId',
          'users',
          'passw',
          'fName',
          'lName',
          'roleID',
          'tName',
          'license',
          'studentID',
          'status',
        ],
      });

      if (!user) {
        this.logger.warn(`Login attempt with invalid username: ${users}`);
        return null;
      }

      // ตรวจสอบสถานะ user
      if (user.status !== 0) {
        this.logger.warn(`Login attempt with inactive user: ${users}`);
        return null;
      }

      const hashedPassword = hashPassword(passw);

      if (user.passw === hashedPassword) {
        const { passw, ...result } = user;
        this.logger.log(`User ${users} validated successfully`);
        return result;
      }

      this.logger.warn(
        `Login attempt with invalid password for user: ${users}`,
      );
      return null;
    } catch (error) {
      this.logger.error(`Error validating user ${users}: ${error}`);
      throw new InternalServerErrorException('Failed to validate user.');
    }
  }

  @Throttle({ default: { limit: 5, ttl: 60000 } })
  async login(loginDto: LoginDto): Promise<LoginResponse> {
    this.logger.log('POST api/auth/login');

    if (!loginDto.users) {
      throw new BadRequestException('Username required.');
    }
    if (!loginDto.passw) {
      throw new BadRequestException('Password required.');
    }

    try {
      const { users, passw } = loginDto;

      const user = await this.validateUser(users, passw);

      if (!user) {
        throw new UnauthorizedException('Invalid username or password');
      }

      const role = this.getRoleFromRoleID(user.roleID);

      const payload = {
        users: user.users,
        sub: user.userId,
        roleID: user.roleID,
        role: role,
      };

      const jwtSecret = this.getJwtSecret(role);

      const token = this.jwtService.sign(payload, {
        secret: jwtSecret,
        expiresIn: '24h',
      });

      this.logger.log(`User ${users} logged in successfully`);

      return {
        message: 'Login successful.',
        access_token: token,
        user: {
          userId: user.userId,
          users: user.users,
        },
      };
    } catch (error) {
      if (
        error instanceof UnauthorizedException ||
        error instanceof BadRequestException
      ) {
        throw error;
      }
      this.logger.error(`Error during login: ${error}`);
      throw new InternalServerErrorException('Failed to login.');
    }
  }

  async verifyToken(token: string, role?: UserRole): Promise<any> {
    try {
      const jwtSecret = role
        ? this.getJwtSecret(role)
        : this.configService.get<string>('JWT_GENERAL_KEY');
      return this.jwtService.verify(token, { secret: jwtSecret });
    } catch (error) {
      this.logger.warn(`Token verification failed: ${error.message}`);
      throw new UnauthorizedException('Invalid token');
    }
  }

  async verifyTokenAnyRole(token: string): Promise<any> {
    const roles: UserRole[] = [
      'Administrator',
      'ระบบนัดหมาย',
      'การเงิน',
      'เวชระเบียน',
      'อาจารย์',
      'ปริญญาตรี',
      'ระบบยา',
      'ผู้ใช้งานทั่วไป',
      'ปริญญาโท',
      'RequirementDiag',
      'หัวหน้าผู้ช่วยทันตแพทย์',
      'ผู้ช่วยทันตแแพทย์',
    ];

    for (const role of roles) {
      try {
        const jwtSecret = this.getJwtSecret(role);
        const decoded = this.jwtService.verify(token, { secret: jwtSecret });
        return decoded;
      } catch (error) {
        continue;
      }
    }

    this.logger.warn('Token verification failed for all roles');
    throw new UnauthorizedException('Invalid token');
  }
  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async findUserById(userId: number): Promise<tbdentaluserecord> {
    try {
      const user = await this.tbdentaluserRepo.findOne({
        where: { userId: userId },
        select: [
          'userId',
          'license',
          'fName',
          'lName',
          'studentID',
          'roleID',
          'users',
          'tName',
          'sort',
          'type',
          'clinicid',
        ],
      });

      if (!user) {
        throw new UnauthorizedException(`User ID:${userId} not found.`);
      }

      return user;
    } catch (error) {
      this.logger.error(`Error fetching User ID:${userId} :: ${error}`);
      throw new InternalServerErrorException('Failed to fetch user.');
    }
  }
}
