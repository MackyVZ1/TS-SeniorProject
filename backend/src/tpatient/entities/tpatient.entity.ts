import {
  Entity,
  Column,
  PrimaryColumn,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

@Entity('t_patient')
export class t_patient {
  @ApiProperty({
    description: 'DN ผู้ป่วย',
    example: '601589',
  })
  @PrimaryColumn({ type: 'varchar', length: 10 })
  dn: string;

  @ApiPropertyOptional({
    description: 'คำนำหน้าภาษาไทย',
    example: 'นาย',
  })
  @Column({ type: 'varchar', length: 100, nullable: true, default: null })
  titleTh?: string;

  @ApiPropertyOptional({
    description: 'ชื่อภาษาไทย',
    example: 'สมชาย',
  })
  @Column({ type: 'varchar', length: 100, nullable: true, default: null })
  nameTh?: string;

  @ApiPropertyOptional({
    description: 'นามสกุลภาษาไทย',
    example: 'ไว้จอน',
  })
  @Column({ type: 'varchar', length: 100, nullable: true, default: null })
  surnameTh?: string;

  @ApiProperty({
    description: 'คำนำหน้าภาษาอังกฤษ',
    example: 'Mr.',
  })
  @Column({ type: 'varchar', length: 45 })
  titleEn: string;

  @ApiProperty({
    description: 'ชื่อภาษาอังกฤษ',
    example: 'Somchai',
  })
  @Column({ type: 'varchar', length: 45 })
  nameEn: string;

  @ApiProperty({
    description: 'นามสกุลภาษาอังกฤษ',
    example: 'Waijohn',
  })
  @Column({ type: 'varchar', length: 45 })
  surnameEn: string;

  @ApiProperty({
    description: 'เพศ',
    example: 'ชาย',
  })
  @Column({ type: 'varchar', length: 45 })
  sex: string;

  @ApiProperty({
    description: 'สถานะ',
    example: 'โสด',
  })
  @Column({ type: 'varchar', length: 45 })
  maritalStatus: string;

  @ApiPropertyOptional({
    description: 'เลขประจำประชาขน',
    example: '2248506178384',
  })
  @Column({ type: 'varchar', length: 50, nullable: true, default: null })
  idNo?: string;

  @ApiProperty({
    description: 'อายุ',
    example: '99',
  })
  @Column({ type: 'varchar', length: 45 })
  age: string;

  @ApiProperty({
    description: 'อาชีพ',
    example: 'นักเรียน',
  })
  @Column({ type: 'varchar', length: 45 })
  occupation: string;

  @ApiPropertyOptional({
    description: 'ที่อยู่',
    example: 'บ้านพี่อยู่ฝั่งทางนู่น บ้านน้องอยู่ฝั่งทางนี้',
  })
  @Column({ type: 'varchar', length: 255, nullable: true, default: null })
  address?: string;

  @ApiPropertyOptional({
    description: 'เบอร์โทรศัพท์',
    example: '081-2345678',
  })
  @Column({ type: 'varchar', length: 255, nullable: true, default: null })
  phoneHome?: string;

  @ApiProperty({
    description: 'เบอร์โทรศัพท์ที่ทำงาน',
    example: '081-2345678',
  })
  @Column({ type: 'varchar', length: 45 })
  phoneOffice: string;

  @ApiProperty({
    description: 'ติดต่อกรณีฉุกเฉิน',
    example: 'นายเอ บีซี',
  })
  @Column({ type: 'varchar', length: 45 })
  emerNotify: string;

  @ApiProperty({
    description: 'ที่อยู่ติดต่อกรณีฉุกเฉิน',
    example: 'บ้านนายเอ บีซี',
  })
  @Column({ type: 'varchar', length: 255 })
  emerAddress: string;

  @ApiProperty({
    description: 'เกี่ยวข้องเป็นอย่างไรกับผู้ป่วย',
    example: 'พ่อ',
  })
  @Column({ type: 'varchar', length: 45 })
  parent: string;

  @ApiProperty({
    description: 'เบอร์โทรศัพท์ของผู้ปกครอง',
    example: '081-2345678',
  })
  @Column({ type: 'varchar', length: 45 })
  parentPhone: string;

  @ApiProperty({
    description: 'แพทย์ที่ดูแลผู้ป่วย',
    example: 'นายแพทย์สมชาย',
  })
  @Column({ type: 'varchar', length: 45 })
  physician: string;

  @ApiProperty({
    description: 'ที่อยู่ของแพทย์ที่ดูแลผู้ป่วย',
    example: 'โรงพยาบาลมหาวิทยาลัยนเรศวร',
  })
  @Column({ type: 'varchar', length: 45 })
  physicianOffice: string;

  @ApiProperty({
    description: 'เบอร์โทรศัพท์ของแพทย์ที่ดูแลผู้ป่วย',
    example: '081-2345678',
  })
  @Column({ type: 'varchar', length: 45 })
  physicianPhone: string;

  @ApiPropertyOptional({
    description: 'วันที่ถูกบันทึกข้อมูล',
    example: '2023-10-01',
  })
  @Column({ type: 'varchar', length: 50, nullable: true, default: null })
  regDate?: string;

  @ApiPropertyOptional({
    description: 'วันเกิดของผู้ป่วย',
    example: '2023-10-01',
  })
  @Column({ type: 'varchar', length: 50, nullable: true, default: null })
  birthDate?: string;

  @ApiPropertyOptional({
    description: 'สิทธิรักษาพยาบาล',
    example: 'บัตรทองโรงพยาบาลมหาวิทยาลัยนเรศวร',
  })
  @Column({ type: 'varchar', length: 45, nullable: true, default: null })
  priv?: string;

  @ApiProperty({
    description: 'หอพักของผู้ป่วย',
    example: 'หอพักนักศึกษา 1',
  })
  @Column({ type: 'varchar', length: 255 })
  otherAddress: string;

  @ApiPropertyOptional({
    description: 'วันที่ถูกบันทึกข้อมูล',
    example: '2023-10-01',
  })
  @CreateDateColumn({ type: 'date', default: () => 'CURRENT_DATE' })
  rDate?: Date;

  @ApiPropertyOptional({
    description: 'วันเกิดของผู้ป่วย',
    example: '2023-10-01',
  })
  @Column({ type: 'date', nullable: true, default: null })
  bDate?: Date;

  @ApiPropertyOptional({
    description: 'โรงพยาบาลที่ส่งต่อผู้ป่วยมา',
    example: 'โรงพยาบาลมหาวิทยาลัยนเรศวร',
  })
  @Column({ type: 'varchar', length: 50, nullable: true, default: null })
  fromHospital?: string;

  @ApiPropertyOptional({
    description: 'userId ของผู้ที่บันทึกข้อมูล',
    example: 1,
  })
  @Column({ type: 'int', nullable: true, default: null })
  updateByUserId?: number;

  @ApiProperty({
    description: 'เวลาที่อัปเดตข้อมูลล่าสุด',
    example: '2023-10-01 12:00:00',
  })
  @UpdateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updateTime: Date;
}
