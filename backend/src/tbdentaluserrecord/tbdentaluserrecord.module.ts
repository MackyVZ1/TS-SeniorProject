import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TbdentaluserrecordService } from './tbdentaluserrecord.service';
import { TbdentaluserrecordController } from './tbdentaluserrecord.controller';
import { tbdentaluserrecord } from './entities/tbdentaluserrecord.entity';
import { ThrottlerModule } from '@nestjs/throttler';
import { TbRole } from 'src/entities/tbrole.entity';
import { TbClinic } from 'src/entities/tbclinic.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([tbdentaluserrecord, TbRole, TbClinic]),
    ThrottlerModule.forRoot([
      {
        ttl: 60000,
        limit: 1000,
      },
    ]),
  ],
  controllers: [TbdentaluserrecordController],
  providers: [TbdentaluserrecordService],
})
export class TbdentaluserrecordModule {}
