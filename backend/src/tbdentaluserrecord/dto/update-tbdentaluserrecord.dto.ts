import { PartialType } from '@nestjs/mapped-types';
import { CreateTbdentaluserrecordDto } from './create-tbdentaluserrecord.dto';
import {
  IsString,
  IsOptional,
  IsNumber,
  MaxLength,
  IsDecimal,
} from 'class-validator';
import { ApiPropertyOptional } from '@nestjs/swagger';

export class UpdateTbdentaluserrecordDto extends PartialType(
  CreateTbdentaluserrecordDto,
) {
  @ApiPropertyOptional({
    description: 'เลขใบประกอบวิชาชีพ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(100)
  license?: string;

  @ApiPropertyOptional({
    description: 'ชื่อจริง',
  })
  @IsString()
  @MaxLength(50)
  fName?: string;

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

  @ApiPropertyOptional({
    description: 'ID ของบทบาท',
  })
  @IsNumber()
  roleID?: number;

  @ApiPropertyOptional({
    description: 'สถานะผู้ใช้งาน',
  })
  @IsNumber()
  status?: number;

  @ApiPropertyOptional({
    description: 'ชื่อผู้ใข้',
  })
  @IsString()
  @MaxLength(50)
  users?: string;

  @ApiPropertyOptional({
    description: 'รหัสผ่าน',
  })
  @IsString()
  @MaxLength(32)
  passw?: string;

  @ApiPropertyOptional({
    description: 'อะไรวะเนี้ย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  tName?: string;

  @ApiPropertyOptional({
    description: 'สำหรับแล็ป',
  })
  @IsOptional()
  @IsDecimal()
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
