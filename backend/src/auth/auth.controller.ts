import {
  Controller,
  Post,
  Body,
  HttpCode,
  HttpStatus,
  Get,
  UseGuards,
  Request,
} from '@nestjs/common';
import { Throttle, ThrottlerGuard } from '@nestjs/throttler';
import { AuthService, LoginDto, LoginResponse } from './auth.service';
import { JwtAuthGuard } from '../utils/auth/jwt-auth.guard';

@Controller('auth')
@UseGuards(ThrottlerGuard)
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('login')
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 5, ttl: 60000 } })
  async login(@Body() loginDto: LoginDto): Promise<LoginResponse> {
    return this.authService.login(loginDto);
  }

  @Get('profile')
  @UseGuards(JwtAuthGuard)
  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async getProfile(@Request() req) {
    const user = await this.authService.findUserById(req.user.userId);
    return {
      message: 'Profile retrieved successfully.',
      user: user,
    };
  }
}
