import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException, Logger } from '@nestjs/common';
import { AuthService } from '../../auth/auth.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  private readonly logger = new Logger(JwtStrategy.name);

  constructor(private authService: AuthService) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKeyProvider: async (request, rawJwtToken, done) => {
        try {
          const decoded =
            await this.authService.verifyTokenAnyRole(rawJwtToken);
          const jwtSecret = this.getJwtSecretByRole(decoded.role);
          done(null, jwtSecret);
        } catch (error) {
          this.logger.warn(`JWT verification failed: ${error.message}`);
          done(new UnauthorizedException('Invalid token'));
        }
      },
    });
  }

  private getJwtSecretByRole(role: string): string {
    const keyMap = {
      ADMIN: process.env.JWT_ADMIN_KEY,
      APPOINTMENT: process.env.JWT_APPOINTMENT_KEY,
      PAYMENT: process.env.JWT_PAYMENT_KEY,
      MEDICALRECORD: process.env.JWT_MEDICALRECORD_KEY,
      TEACHER: process.env.JWT_TEACHER_KEY,
      BACHELOR: process.env.JWT_BACHELOR_KEY,
      DRUG: process.env.JWT_DRUG_KEY,
      GENERAL: process.env.JWT_GENERAL_KEY,
      MASTER: process.env.JWT_MASTER_KEY,
      REQUIREMENTDIAG: process.env.JWT_REQUIREMENTDIAG_KEY,
      HEADASSISTANTDENTIST: process.env.JWT_HEADASSISTANTDENTIST_KEY,
      ASSISTANTDENTIST: process.env.JWT_ASSISTANTDENTIST_KEY,
    };

    return keyMap[role] || process.env.JWT_GENERAL_KEY;
  }

  async validate(payload: any) {
    return {
      userId: payload.sub,
      users: payload.users,
      roleID: payload.roleID,
      role: payload.role,
      fName: payload.fName,
      lName: payload.lName,
    };
  }
}
