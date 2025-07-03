import {
  IsString,
  IsNotEmpty,
  IsOptional,
  IsNumber,
  MaxLength,
  IsDecimal,
} from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateTbdentaluserrecordDto {
  @ApiPropertyOptional({
    description: 'เลขใบประกอบวิชาชีพ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(100)
  license?: string;

  @ApiProperty({
    description: 'ชื่อจริง',
  })
  @IsNotEmpty({ message: 'Firstname required' })
  @IsString()
  @MaxLength(50)
  fName: string;

  @ApiPropertyOptional({
    description: 'นามสกุล',
  })
  @IsOptional()
  @IsString()
  @MaxLength(50)
  lName?: string;

  @ApiPropertyOptional({
    description: 'รหัสนิสิต',
  })
  @IsOptional()
  @IsString()
  @MaxLength(15)
  studentID?: string;

  @ApiProperty({
    description: 'ID ของบทบาท',
  })
  @IsNotEmpty({ message: 'RoleID required' })
  @IsNumber()
  roleID: number;

  @ApiProperty({
    description: 'สถานะผู้ใช้งาน',
  })
  @IsNotEmpty({ message: 'Status required' })
  @IsNumber()
  status: number;

  @ApiProperty({
    description: 'ชื่อผู้ใข้',
  })
  @IsNotEmpty({ message: 'Username required' })
  @IsString()
  @MaxLength(50)
  users: string;

  @ApiProperty({
    description: 'รหัสผ่าน',
  })
  @IsNotEmpty({ message: 'Password required' })
  @IsString()
  @MaxLength(32)
  passw: string;

  @ApiPropertyOptional({
    description: 'คำนำหน้าชื่อ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  tName?: string;

  @ApiPropertyOptional({
    description: 'สำหรับแล็ป',
  })
  @IsDecimal()
  @IsOptional()
  sort?: number;

  @ApiPropertyOptional({
    description: 'สำหรับแล็ป',
  })
  @IsOptional()
  @IsString()
  @MaxLength(10)
  type?: string;

  @ApiPropertyOptional({
    description: 'เฉพาะ ป.โท',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  clinicid?: string;
}
