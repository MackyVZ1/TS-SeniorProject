import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { tbdentaluserrecord } from 'src/tbdentaluserrecord/entities/tbdentaluserrecord.entity';
import { TbdentaluserrecordService } from 'src/tbdentaluserrecord/tbdentaluserrecord.service';

@Module({
  imports: [
    ConfigModule,
    TypeOrmModule.forFeature([tbdentaluserrecord]),
    JwtModule.register({
      global: true,

      signOptions: { expiresIn: '24h' },
    }),
  ],
  controllers: [AuthController],
  providers: [AuthService, TbdentaluserrecordService],
})
export class AuthModule {}
