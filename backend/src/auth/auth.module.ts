import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { tbdentaluserecord } from 'src/tbdentaluserrecord/entities/tbdentaluserrecord.entity';

@Module({
  imports: [
    ConfigModule,
    TypeOrmModule.forFeature([tbdentaluserecord]),
    JwtModule.register({
      global: true,

      signOptions: { expiresIn: '24h' },
    }),
  ],
  controllers: [AuthController],
  providers: [AuthService],
})
export class AuthModule {}
