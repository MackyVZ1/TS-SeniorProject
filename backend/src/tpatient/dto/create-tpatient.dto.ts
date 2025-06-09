import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsDate,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
  MaxLength,
} from 'class-validator';
export class CreateTpatientDto {
  @ApiProperty({
    description: 'DN ผู้ป่วย',
  })
  @IsNotEmpty({ message: 'DN required.' })
  @IsString()
  @MaxLength(10)
  dn: string;

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

  @ApiProperty({
    description: 'คำนำหน้าภาษาอังกฤษ',
  })
  @IsNotEmpty({ message: 'TitleEn required' })
  @IsString()
  @MaxLength(45)
  titleEn: string;

  @ApiProperty({
    description: 'ชื่อภาษาอังกฤษ',
  })
  @IsNotEmpty({ message: 'NameEn required' })
  @IsString()
  @MaxLength(45)
  nameEn: string;

  @ApiProperty({
    description: 'นามสกุลภาษาอังกฤษ',
  })
  @IsNotEmpty({ message: 'SurnameEn required' })
  @IsString()
  @MaxLength(45)
  surnameEn: string;

  @ApiProperty({
    description: 'เพศ',
  })
  @IsNotEmpty({ message: 'Sex required' })
  @IsString()
  @MaxLength(45)
  sex: string;

  @ApiProperty({
    description: 'สถานะ',
  })
  @IsNotEmpty({ message: 'Marital status required' })
  @IsString()
  @MaxLength(45)
  maritalStatus: string;

  @ApiPropertyOptional({
    description: 'เลขประจำประชาขน',
  })
  @IsOptional()
  @IsString()
  @MaxLength(13)
  idNo?: string;

  @ApiProperty({
    description: 'อายุ',
  })
  @IsNotEmpty({ message: 'Age required' })
  @IsString()
  @MaxLength(45)
  age: string;

  @ApiProperty({
    description: 'อาชีพ',
  })
  @IsNotEmpty({ message: 'Occupation required' })
  @IsString()
  @MaxLength(45)
  occupation: string;

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

  @ApiProperty({
    description: 'เบอร์โทรศัพท์ที่ทำงาน',
  })
  @IsNotEmpty({ message: 'Phone office required' })
  @IsString()
  @MaxLength(45)
  phoneOffice: string;

  @ApiProperty({
    description: 'ติดต่อกรณีฉุกเฉิน',
  })
  @IsNotEmpty({ message: 'EmerNotify required' })
  @IsString()
  @MaxLength(255)
  emerNotify: string;

  @ApiProperty({
    description: 'ที่อยู่ติดต่อกรณีฉุกเฉิน',
  })
  @IsNotEmpty({ message: 'EmerAdress required' })
  @IsString()
  @MaxLength(255)
  emerAddress: string;

  @ApiProperty({
    description: 'เกี่ยวข้องเป็นอย่างไรกับผู้ป่วย',
  })
  @IsNotEmpty({ message: 'Parent required' })
  @IsString()
  @MaxLength(45)
  parent: string;

  @ApiProperty({
    description: 'เบอร์โทรศัพท์ของผู้ปกครอง',
  })
  @IsNotEmpty({ message: 'Parent phone required' })
  @IsString()
  @MaxLength(45)
  parentPhone: string;

  @ApiProperty({
    description: 'แพทย์ที่ดูแลผู้ป่วย',
  })
  @IsNotEmpty({ message: 'Physician required' })
  @IsString()
  @MaxLength(45)
  physician: string;

  @ApiProperty({
    description: 'ที่อยู่ของแพทย์ที่ดูแลผู้ป่วย',
  })
  @IsNotEmpty({ message: 'Physician office required' })
  @IsString()
  @MaxLength(45)
  physicianOffice: string;

  @ApiProperty({
    description: 'เบอร์โทรศัพท์ของแพทย์ที่ดูแลผู้ป่วย',
  })
  @IsNotEmpty({ message: 'Physician phone required' })
  @IsString()
  @MaxLength(45)
  physicianPhone: string;

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

  @ApiProperty({
    description: 'หอพักของผู้ป่วย',
  })
  @IsNotEmpty({ message: 'Dormitory required' })
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
