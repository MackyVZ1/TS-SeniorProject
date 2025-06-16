import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { createHash } from 'crypto';
import { tbdentaluserecord } from 'src/tbdentaluserrecord/entities/tbdentaluserrecord.entity';
import { LoginDto } from './dto/create-auth.dto';
import { hashPassword } from 'src/utils/hash/hash';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(tbdentaluserecord)
    private readonly tbdentalRepository: Repository<tbdentaluserecord>,
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
    const { users, passw } = loginDto;

    // Convert password to MD5
    const hashedPassword = hashPassword(passw);

    // Find user by username
    const user = await this.tbdentalRepository.findOne({
      where: { users },
    });

    if (!user) {
      throw new HttpException(
        {
          success: false,
          message: 'Invalid username or password',
        },
        HttpStatus.UNAUTHORIZED,
      );
    }

    // Check password
    if (user.passw !== hashedPassword) {
      throw new HttpException(
        {
          success: false,
          message: 'Invalid username or password',
        },
        HttpStatus.UNAUTHORIZED,
      );
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
      expiresIn: '24h', // Token expires in 24 hours
    });

    // Return user data and token (exclude password)
    const { passw: _, ...userWithoutPassword } = user;

    return {
      token,
      user: userWithoutPassword,
    };
  }
}
