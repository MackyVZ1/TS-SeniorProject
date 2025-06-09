import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

@Entity('tbdentalrecorduser')
export class tbdentaluserecord {
  @ApiProperty({
    description: 'ID ผู้ใช้งานระบบทันตกรรม',
    example: 1,
  })
  @PrimaryGeneratedColumn()
  userId: number;

  @ApiPropertyOptional({
    description: 'เลขใบประกอบวิชาชีพ',
  })
  @Column({ type: 'varchar', length: 100, nullable: true, default: null })
  license?: string;

  @ApiProperty({
    description: 'ชื่อจริง',
    example: 'สมชาย',
  })
  @Column({ type: 'varchar', length: 50 })
  fName: string;

  @ApiPropertyOptional({
    description: 'นามสกุล',
    example: 'ไว้จอน',
  })
  @Column({ type: 'varchar', length: 50, nullable: true, default: null })
  lName?: string;

  @ApiPropertyOptional({
    description: 'รหัสนิสิต',
    example: '65000000',
  })
  @Column({ type: 'varchar', length: 15, nullable: true, default: null })
  studentID?: string;

  @ApiProperty({
    description: 'ID ของบทบาท',
    example: 1,
  })
  @Column({ type: 'int', default: 0 })
  roleID: number;

  @ApiProperty({
    description: 'สถานะผู้ใช้งาน',
    example: 0,
  })
  @Column({ type: 'int', default: 1 })
  status: number;

  @ApiProperty({
    description: 'ชื่อผู้ใข้',
    example: 'inwza007',
  })
  @Column({ type: 'varchar', length: 50, nullable: true, default: null })
  users: string;

  @ApiProperty({
    description: 'รหัสผ่าน',
    example: '$4Avb68....',
  })
  @Column({ type: 'char', length: 32, nullable: true, default: null })
  passw: string;

  @ApiPropertyOptional({
    description: 'อะไรวะเนี้ย',
    example: 'อะไรวะ',
  })
  @Column({ type: 'varchar', length: 45, nullable: true, default: null })
  tName?: string;

  @ApiPropertyOptional({
    description: 'สำหรับแล็ป',
    example: 0,
  })
  @Column({
    type: 'decimal',
    precision: 3,
    scale: 0,
    nullable: true,
    default: null,
  })
  sort?: number;

  @ApiPropertyOptional({
    description: 'สำหรับแล็ป',
    example: 'อะไรวะ',
  })
  @Column({ type: 'varchar', length: 10, nullable: true, default: null })
  type?: string;

  @ApiPropertyOptional({
    description: 'เฉพาะ ป.โท',
    example: 'อะไรวะ',
  })
  @Column({ type: 'varchar', nullable: true, default: null })
  clinicid?: string;
}
