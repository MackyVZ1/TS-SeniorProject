import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, MinLength, MaxLength } from 'class-validator';

export class LoginDto {
  @ApiProperty({
    description: 'ชื่อผู้ใช้งาน',
    example: 'inwza007',
    minLength: 1,
    maxLength: 50,
  })
  @IsString()
  @IsNotEmpty({ message: 'Username is required' })
  @MaxLength(50, { message: 'Username must not exceed 50 characters' })
  users: string;

  @ApiProperty({
    description: 'รหัสผ่าน (จะถูกแปลงเป็น MD5 เพื่อเปรียบเทียบ)',
    example: 'password123',
    minLength: 1,
  })
  @IsString()
  @IsNotEmpty({ message: 'Password is required' })
  passw: string;
}
