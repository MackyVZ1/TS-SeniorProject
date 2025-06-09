import { PartialType } from '@nestjs/swagger';
import { CreateTpatientDto } from './create-tpatient.dto';
import { ApiPropertyOptional, ApiProperty } from '@nestjs/swagger';
import {
  IsOptional,
  IsString,
  MaxLength,
  IsNotEmpty,
  IsNumber,
  IsDate,
} from 'class-validator';

export class UpdateTpatientDto extends PartialType(CreateTpatientDto) {
  @ApiPropertyOptional({
    description: 'คำนำหน้าภาษาไทย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(100)
  titleTh?: string;

  @ApiPropertyOptional({
    description: 'ชื่อภาษาไทย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(100)
  nameTh?: string;

  @ApiPropertyOptional({
    description: 'นามสกุลภาษาไทย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(100)
  surnameTh?: string;

  @ApiPropertyOptional({
    description: 'คำนำหน้าภาษาอังกฤษ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  titleEn?: string;

  @ApiPropertyOptional({
    description: 'ชื่อภาษาอังกฤษ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  nameEn?: string;

  @ApiPropertyOptional({
    description: 'นามสกุลภาษาอังกฤษ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  surnameEn?: string;

  @ApiPropertyOptional({
    description: 'เพศ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  sex?: string;

  @ApiPropertyOptional({
    description: 'สถานะ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  maritalStatus?: string;

  @ApiPropertyOptional({
    description: 'เลขประจำประชาขน',
  })
  @IsOptional()
  @IsString()
  @MaxLength(13)
  idNo?: string;

  @ApiPropertyOptional({
    description: 'อายุ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  age?: string;

  @ApiPropertyOptional({
    description: 'อาชีพ',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  occupation?: string;

  @ApiPropertyOptional({
    description: 'ที่อยู่',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  address?: string;

  @ApiPropertyOptional({
    description: 'เบอร์โทรศัพท์',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  phoneHome?: string;

  @ApiPropertyOptional({
    description: 'เบอร์โทรศัพท์ที่ทำงาน',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  phoneOffice?: string;

  @ApiPropertyOptional({
    description: 'ติดต่อกรณีฉุกเฉิน',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  emerNotify?: string;

  @ApiPropertyOptional({
    description: 'ที่อยู่ติดต่อกรณีฉุกเฉิน',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  emerAddress?: string;

  @ApiPropertyOptional({
    description: 'เกี่ยวข้องเป็นอย่างไรกับผู้ป่วย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  parent?: string;

  @ApiPropertyOptional({
    description: 'เบอร์โทรศัพท์ของผู้ปกครอง',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  parentPhone?: string;

  @ApiPropertyOptional({
    description: 'แพทย์ที่ดูแลผู้ป่วย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  physician?: string;

  @ApiPropertyOptional({
    description: 'ที่อยู่ของแพทย์ที่ดูแลผู้ป่วย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  physicianOffice?: string;

  @ApiPropertyOptional({
    description: 'เบอร์โทรศัพท์ของแพทย์ที่ดูแลผู้ป่วย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  physicianPhone?: string;

  @ApiPropertyOptional({
    description: 'วันที่ถูกบันทึกข้อมูล',
  })
  @IsOptional()
  @IsString()
  @MaxLength(50)
  regDate?: string;

  @ApiPropertyOptional({
    description: 'วันเกิดของผู้ป่วย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(50)
  birthDate?: string;

  @ApiPropertyOptional({
    description: 'สิทธิรักษาพยาบาล',
  })
  @IsOptional()
  @IsString()
  @MaxLength(45)
  priv?: string;

  @ApiPropertyOptional({
    description: 'หอพักของผู้ป่วย',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  otherAddress: string;

  @ApiPropertyOptional({
    description: 'วันที่ถูกบันทึกข้อมูล',
  })
  @IsOptional()
  @IsDate()
  rDate?: Date;

  @ApiPropertyOptional({
    description: 'วันเกิดของผู้ป่วย',
  })
  @IsOptional()
  @IsDate()
  bDate?: Date;

  @ApiPropertyOptional({
    description: 'โรงพยาบาลที่ส่งต่อผู้ป่วยมา',
  })
  @IsOptional()
  @IsString()
  @MaxLength(50)
  fromHospital?: string;

  @ApiPropertyOptional({
    description: 'userId ของผู้ที่บันทึกข้อมูล',
    example: 1,
  })
  @IsOptional()
  @IsNumber()
  updateByUserId?: number;

  @ApiProperty({
    description: 'เวลาที่อัปเดตข้อมูลล่าสุด',
  })
  @IsNotEmpty({ message: 'Update time required' })
  @IsDate()
  updateTime: Date;
}
