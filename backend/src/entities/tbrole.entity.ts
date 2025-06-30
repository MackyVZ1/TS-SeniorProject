import { ApiProperty } from '@nestjs/swagger';
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tbrole')
export class TbRole {
  @ApiProperty()
  @PrimaryGeneratedColumn()
  roleId: number;
  @ApiProperty()
  @Column()
  roleName: string;
}
