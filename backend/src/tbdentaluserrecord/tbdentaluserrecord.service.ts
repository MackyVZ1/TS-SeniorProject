import {
  Injectable,
  NotFoundException,
  ConflictException,
  InternalServerErrorException,
  Logger,
  BadRequestException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Throttle, ThrottlerGuard } from '@nestjs/throttler';
import { UseGuards } from '@nestjs/common';
import { CreateTbdentaluserrecordDto } from './dto/create-tbdentaluserrecord.dto';
import { UpdateTbdentaluserrecordDto } from './dto/update-tbdentaluserrecord.dto';
import { tbdentaluserecord } from './entities/tbdentaluserrecord.entity';
import { hashPassword } from 'src/utils/hash/hash';

@Injectable()
@UseGuards(ThrottlerGuard)
export class TbdentaluserrecordService {
  private readonly logger = new Logger(TbdentaluserrecordService.name);
  constructor(
    @InjectRepository(tbdentaluserecord)
    private readonly tbdentaluserRepo: Repository<tbdentaluserecord>,
  ) {}

  @Throttle({ default: { limit: 10, ttl: 60000 } })
  async create(dto: CreateTbdentaluserrecordDto): Promise<{ message: string }> {
    this.logger.log('POST api/tbdentalrecorduser');

    if (!dto.fName) throw new BadRequestException('Firstname required.');
    if (!dto.roleID) throw new BadRequestException('Role ID required.');
    if (!dto.users) throw new BadRequestException('Username required.');
    if (!dto.passw) throw new BadRequestException('Password required.');

    try {
      const existingUser = await this.tbdentaluserRepo.findOne({
        where: { users: dto.users },
      });

      if (existingUser) {
        throw new ConflictException('Username already exists.');
      }

      if (dto.passw) {
        dto.passw = hashPassword(dto.passw);
      }

      const user = this.tbdentaluserRepo.create({
        license: dto.license,
        fName: dto.fName,
        lName: dto.lName,
        studentID: dto.studentID,
        roleID: dto.roleID,
        status: 0,
        users: dto.users,
        passw: dto.passw,
        tName: dto.tName,
        sort: dto.sort,
        type: dto.type,
        clinicid: dto.clinicid,
      });

      await this.tbdentaluserRepo.save(user);

      this.logger.log('User created successfully.');
      return { message: 'Create a user success.' };
    } catch (e: any) {
      this.logger.error(`Error creating user: ${e}`);
      throw new InternalServerErrorException('Failed to create a user.');
    }
  }

  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async findAll(): Promise<
    | {
        data: tbdentaluserecord[];
      }
    | { message: string }
  > {
    this.logger.log('GET api/tbdentalrecorduser');
    try {
      const data = await this.tbdentaluserRepo.find({
        select: [
          'userId',
          'license',
          'fName',
          'lName',
          'studentID',
          'roleID',
          'users',
          'tName',
          'sort',
          'type',
          'clinicid',
        ],
      });

      if (data.length == 0) return { message: 'No users.' };
      return {
        data,
      };
    } catch (e: any) {
      this.logger.error(`Error fetching users: ${e}`);
      throw new InternalServerErrorException('Failed to fetch users.');
    }
  }

  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async findฺById(userId: number): Promise<tbdentaluserecord> {
    const existingUser = await this.tbdentaluserRepo.findOne({
      where: { userId: userId },
    });

    if (!existingUser)
      throw new NotFoundException(`User ID:${userId} not found.`);

    try {
      this.logger.log(`GET api/tbdentalrecorduser/${userId}`);

      const user = await this.tbdentaluserRepo.findOne({
        where: { userId: +userId },
        select: [
          'userId',
          'license',
          'fName',
          'lName',
          'studentID',
          'roleID',
          'users',
          'tName',
          'sort',
          'type',
          'clinicid',
        ],
      });

      if (!user) throw new NotFoundException(`User not found.`);

      return user;
    } catch (e: any) {
      this.logger.error(`Error fetching User ID:${userId} :: ${e}`);
      throw new InternalServerErrorException('Failed to fetch a user.');
    }
  }

  @Throttle({ default: { limit: 20, ttl: 60000 } })
  async update(
    userId: number,
    dto: UpdateTbdentaluserrecordDto,
  ): Promise<tbdentaluserecord> {
    this.logger.log(`PATCH api/tbdentalrecorduser/${userId}`);

    const existingUser = await this.findฺById(userId);

    try {
      if (dto.passw) {
        dto.passw = hashPassword(dto.passw);
      }

      Object.assign(existingUser, dto);
      const updatedUser = await this.tbdentaluserRepo.save(existingUser);

      this.logger.log(`User ID:${userId} is updated.`);
      return updatedUser;
    } catch (e: any) {
      this.logger.error(`Error updating User ID:${userId} :: ${e}`);
      throw new InternalServerErrorException('Failed to update a user.');
    }
  }

  @Throttle({ default: { limit: 10, ttl: 60000 } })
  async remove(userId: number) {
    this.logger.log(`DELETE api/tbdentalrecorduser/${userId}`);

    const existingUser = await this.findฺById(userId);

    if (!existingUser)
      throw new NotFoundException(`User ID:${userId} not found.`);

    try {
      const result = await this.tbdentaluserRepo.delete(+userId);

      if (result.affected === 0) {
        throw new NotFoundException(`User ID:${userId} not found`);
      }

      this.logger.log(`User ID:${userId} is deleted.`);
      return {
        message: `User ID:${userId} is deleted successfully`,
        deletedId: userId,
      };
    } catch (e: any) {
      this.logger.error(`Error deleting User ID:${userId} :: ${e}`);
      throw new InternalServerErrorException('Failed to delete a user');
    }
  }
}
