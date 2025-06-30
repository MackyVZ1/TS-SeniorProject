import {
  Controller,
  Post,
  Body,
  HttpException,
  HttpStatus,
  Headers,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/create-auth.dto';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';

@ApiTags('Authentication')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('login')
  @ApiOperation({ summary: 'User login' })
  @ApiResponse({
    status: 200,
    description: 'Login successful',
    schema: {
      type: 'object',
      properties: {
        success: { type: 'boolean', example: true },
        message: { type: 'string', example: 'Login successful' },
        data: {
          type: 'object',
          properties: {
            token: {
              type: 'string',
              description: 'JWT authentication token',
              example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
            },
            user: {
              type: 'object',
              properties: {
                roleID: {
                  type: 'number',
                  description: 'User role ID',
                  example: 1,
                },
                users: {
                  type: 'string',
                  description: 'Username',
                  example: 'admin',
                },
              },
            },
          },
        },
      },
    },
  })
  @ApiResponse({
    status: 400,
    description:
      'Username and password should not be empty., Username should not be empty., Password should not be empty.',
  })
  @ApiResponse({
    status: 404,
    description: 'User not found.',
  })
  @ApiResponse({
    status: 500,
    description: 'Internal Server Error',
  })
  async login(@Body() loginDto: LoginDto) {
    try {
      const result = await this.authService.login(loginDto);
      return {
        success: true,
        message: 'Login successful',
        data: result,
      };
    } catch (error) {
      if (error instanceof HttpException) {
        throw error;
      }
      throw new HttpException(
        {
          success: false,
          message: 'Internal server error',
        },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Post('logout')
  @ApiOperation({ summary: 'User logout' })
  @ApiResponse({
    status: 200,
    description: 'Logout successful',
    schema: {
      type: 'object',
      properties: {
        success: { type: 'boolean', example: true },
        message: { type: 'string', example: 'Logout successful' },
      },
    },
  })
  @ApiResponse({
    status: 401,
    description: 'Invalid or expired token',
  })
  @ApiResponse({
    status: 404,
    description: 'Token not found.',
  })
  async logout(@Headers('authorization') authHeader: string) {
    const token = authHeader?.split(' ')[1];
    if (!token) {
      throw new HttpException(
        { success: false, message: 'No token provided' },
        HttpStatus.UNAUTHORIZED,
      );
    }
    return await this.authService.logout(token);
  }
}
