import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TpatientService } from './tpatient.service';
import { TpatientController } from './tpatient.controller';
import { ThrottlerModule } from '@nestjs/throttler';
import { t_patient } from './entities/tpatient.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([t_patient]),
    ThrottlerModule.forRoot([
      {
        ttl: 60000,
        limit: 1000,
      },
    ]),
  ],
  controllers: [TpatientController],
  providers: [TpatientService],
})
export class TpatientModule {}
