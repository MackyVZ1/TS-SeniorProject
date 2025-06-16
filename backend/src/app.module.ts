import { Module } from '@nestjs/common';
import { ThrottlerModule } from '@nestjs/throttler';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { TbdentaluserrecordModule } from './tbdentaluserrecord/tbdentaluserrecord.module';
import { TpatientModule } from './tpatient/tpatient.module';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [
    ThrottlerModule.forRoot([
      {
        ttl: 60000, // 1 minute
        limit: 100, // default limit
      },
    ]),
    ConfigModule.forRoot({
      isGlobal: true, // ให้ ConfigService ใช้ได้ทุก Module
    }),
    DatabaseModule,
    TbdentaluserrecordModule,
    TpatientModule,
    AuthModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
