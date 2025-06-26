import { ApiProperty } from '@nestjs/swagger';
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tbclinic')
export class TbClinic {
  @ApiProperty()
  @PrimaryGeneratedColumn()
  clinicID: number;
  @ApiProperty()
  @Column()
  clinicName: string;
}
