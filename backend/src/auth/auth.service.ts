import {
  Injectable,
  BadRequestException,
  Logger,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { tbdentaluserrecord } from 'src/tbdentaluserrecord/entities/tbdentaluserrecord.entity';
import { LoginDto } from './dto/create-auth.dto';
import { hashPassword } from 'src/utils/hash/hash';
import * as jwt from 'jsonwebtoken';

@Injectable()
export class AuthService {
  private readonly logger = new Logger(AuthService.name);
  constructor(
    @InjectRepository(tbdentaluserrecord)
    private readonly tbdentalRepository: Repository<tbdentaluserrecord>,
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {}

  private getJwtKeyByRole(roleID: number): string {
    const roleKeys = {
      1: this.configService.get<string>('JWT_ADMIN_KEY'),
      2: this.configService.get<string>('JWT_APPOINTMENT_KEY'),
      3: this.configService.get<string>('JWT_PAYMENT_KEY'),
      4: this.configService.get<string>('JWT_MEDICALRECORD_KEY'),
      5: this.configService.get<string>('JWT_TEACHER_KEY'),
      6: this.configService.get<string>('JWT_BACHELOR_KEY'),
      7: this.configService.get<string>('JWT_DRUG_KEY'),
      8: this.configService.get<string>('JWT_GENERAL_KEY'),
      9: this.configService.get<string>('JWT_MASTER_KEY'),
      10: this.configService.get<string>('JWT_REQUIREMENTDIAG_KEY'),
      11: this.configService.get<string>('JWT_HEADASSISTANTDENTIST_KEY'),
      12: this.configService.get<string>('JWT_ASSISTANTDENTIST_KEY'),
    };

    return (
      roleKeys[roleID] || this.configService.get<string>('JWT_GENERAL_KEY')
    );
  }

  async login(loginDto: LoginDto) {
    this.logger.log('POST api/auth/login');

    const { users, passw } = loginDto;

    if (!users && !passw) {
      throw new BadRequestException(
        'Username and password should not be empty.',
      );
    } else if (!users)
      throw new BadRequestException('Username should not be empty.');
    else if (!passw)
      throw new BadRequestException('Password should not be empty.');

    // Convert password to MD5
    const hashedPassword = hashPassword(passw);

    // Find user by username
    const user = await this.tbdentalRepository.findOne({
      where: { users },
      relations: ['role'],
    });

    if (!user) {
      throw new NotFoundException('User not found.');
    }

    // Check password
    if (user.passw !== hashedPassword) {
      throw new BadRequestException('Password invalid.');
    }

    // Update status from 0 to 1 if needed (login activation)
    if (user.status === 0) {
      await this.tbdentalRepository.update(user.userId, { status: 1 });
      user.status = 1;
    }

    // Get JWT key based on role
    const jwtKey = this.getJwtKeyByRole(user.roleID);

    // Create JWT payload
    const payload = {
      userId: user.userId,
      users: user.users,
      roleID: user.roleID,
      fName: user.fName,
      lName: user.lName,
      iat: Math.floor(Date.now() / 1000),
    };

    // Generate JWT token
    const token = this.jwtService.sign(payload, {
      secret: jwtKey,
      expiresIn: '3h', // Token expires in 24 hours
    });

    // Return user data and token (exclude password)
    const { passw: _ } = user;

    return {
      token,
      user: {
        roleName: user.role?.roleName ?? '',
        users: user.users,
      },
    };
  }

  async logout(token: string) {
    this.logger.log('POST api/auth/logout');

    if (!token) throw new NotFoundException('Token not found.');

    try {
      // 1. decode เพื่อเอา userId และ roleID
      const decoded: any = jwt.decode(token);
      if (!decoded || !decoded.userId || !decoded.roleID) {
        throw new UnauthorizedException('Invalid token payload');
      }

      // 2. เลือก secret key ตาม roleID
      const jwtKey = this.getJwtKeyByRole(decoded.roleID);

      // 3. verify token ด้วย key ที่ถูกต้อง
      this.jwtService.verify(token, { secret: jwtKey });

      // 4. update status ในฐานข้อมูล
      await this.tbdentalRepository.update(decoded.userId, { status: 0 });

      return {
        success: true,
        message: 'Logout successful',
      };
    } catch (error) {
      throw new UnauthorizedException('Invalid or expired token');
    }
  }
}
