import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TbdentaluserrecordService } from './tbdentaluserrecord.service';
import { TbdentaluserrecordController } from './tbdentaluserrecord.controller';
import { tbdentaluserecord } from './entities/tbdentaluserrecord.entity';
import { ThrottlerModule } from '@nestjs/throttler';

@Module({
  imports: [
    TypeOrmModule.forFeature([tbdentaluserecord]),
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
