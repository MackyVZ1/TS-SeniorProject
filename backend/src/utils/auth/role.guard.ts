import {
  Injectable,
  CanActivate,
  ExecutionContext,
  UnauthorizedException,
  ForbiddenException,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { ROLES_KEY, Role, ROLE_ID_TO_NAME } from './role.decorator';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(
    private reflector: Reflector,
    private jwtService: JwtService,
    private configService: ConfigService,
  ) {}

  private getJwtKeyByRoleId(roleID: number): string {
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

  async canActivate(context: ExecutionContext): Promise<boolean> {
    // Get required roles from decorator
    const requiredRoles = this.reflector.getAllAndOverride<Role[]>(ROLES_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);

    // If no roles specified, allow access
    if (!requiredRoles || requiredRoles.length === 0) {
      return true;
    }

    const request = context.switchToHttp().getRequest();
    const authHeader = request.headers.authorization;

    if (!authHeader) {
      throw new UnauthorizedException('Authorization header is missing');
    }

    const token = authHeader.replace('Bearer ', '');
    if (!token) {
      throw new UnauthorizedException('Bearer token is missing');
    }

    try {
      // First, try to decode without verification to get roleID
      const decodedToken = this.jwtService.decode(token) as any;

      if (!decodedToken || !decodedToken.roleID) {
        throw new UnauthorizedException('Invalid token structure');
      }

      // Get the correct JWT secret for this role
      const jwtSecret = this.getJwtKeyByRoleId(decodedToken.roleID);

      // Verify token with role-specific secret
      const payload = this.jwtService.verify(token, { secret: jwtSecret });

      if (!payload || !payload.roleID) {
        throw new UnauthorizedException('Invalid token payload');
      }

      // Convert roleID to role name
      const userRole = ROLE_ID_TO_NAME[payload.roleID];

      if (!userRole) {
        throw new UnauthorizedException('Invalid user role');
      }

      // Check if user has required role
      const hasRequiredRole = requiredRoles.includes(userRole);

      if (!hasRequiredRole) {
        throw new ForbiddenException(
          `Access denied. Required roles: ${requiredRoles.join(', ')}. User role: ${userRole}`,
        );
      }

      // Add user info to request object for later use
      request.user = payload;

      return true;
    } catch (error) {
      if (
        error instanceof UnauthorizedException ||
        error instanceof ForbiddenException
      ) {
        throw error;
      }
      throw new UnauthorizedException('Invalid or expired token');
    }
  }
}
