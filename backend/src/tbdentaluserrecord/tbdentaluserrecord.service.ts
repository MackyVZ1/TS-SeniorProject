import {
  Injectable,
  NotFoundException,
  ConflictException,
  InternalServerErrorException,
  Logger,
  BadRequestException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { And, FindOptionsWhere, Like, Or, Repository } from 'typeorm';
import { Throttle, ThrottlerGuard } from '@nestjs/throttler';
import { UseGuards } from '@nestjs/common';
import { CreateTbdentaluserrecordDto } from './dto/create-tbdentaluserrecord.dto';
import { UpdateTbdentaluserrecordDto } from './dto/update-tbdentaluserrecord.dto';
import { tbdentaluserrecord } from './entities/tbdentaluserrecord.entity';
import { hashPassword } from 'src/utils/hash/hash';

@Injectable()
@UseGuards(ThrottlerGuard)
export class TbdentaluserrecordService {
  private readonly logger = new Logger(TbdentaluserrecordService.name);
  constructor(
    @InjectRepository(tbdentaluserrecord)
    private readonly tbdentaluserRepo: Repository<tbdentaluserrecord>,
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
      this.logger.error(`Error creating user: ${e.response?.data?.message}`);
      throw new InternalServerErrorException('Failed to create a user.');
    }
  }

  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async findAll(
    page: number,
    limit: number,
    keyword?: string,
    roleId?: number,
    clinicId?: string,
  ): Promise<
    | {
        data: any[];
        total: number;
        page: number;
        pageCount: number;
      }
    | { message: string }
  > {
    this.logger.log('GET api/tbdentalrecorduser');
    try {
      const whereConditions: FindOptionsWhere<tbdentaluserrecord>[] = [];
      const commonConditions: FindOptionsWhere<tbdentaluserrecord> = {};

      if (roleId && roleId !== 0) {
        commonConditions.roleID = roleId;
      }

      if (clinicId && clinicId !== '0') {
        commonConditions.clinicid = clinicId;
      }

      if (keyword) {
        // Apply keyword search with OR for fName and lName, ANDed with common conditions
        whereConditions.push({
          fName: Like(`%${keyword}%`),
          ...commonConditions,
        });
        whereConditions.push({
          lName: Like(`%${keyword}%`),
          ...commonConditions,
        });
      } else {
        // If no keyword, just use common conditions
        if (Object.keys(commonConditions).length > 0) {
          whereConditions.push(commonConditions);
        }
      }

      const [data, total] = await this.tbdentaluserRepo.findAndCount({
        select: [
          'userId',
          'license',
          'tName',
          'fName',
          'lName',
          'studentID',
          'clinicid',
          'roleID',
          'users',
          'passw',
        ],
        relations: ['role', 'clinic'],
        order: { userId: 'ASC' },
        skip: (page - 1) * limit,
        take: limit,
        where: whereConditions.length > 0 ? whereConditions : {},
      });

      const result = data.map((user) => ({
        license: user.license,
        tName: user.tName,
        fName: user.fName,
        lName: user.lName,
        userId: user.userId,
        users: user.users,
        passw: user.passw,
        sort: user.sort,
        type: user.type,
        clinicid: user.clinicid,
        clinicName: user.clinic?.clinicName || null,
        roleID: user.roleID,
        roleName: user.role?.roleName || null,
      }));

      if (data.length === 0) return { message: 'No users.' };
      return {
        data: result,
        total,
        page,
        pageCount: Math.ceil(total / limit),
      };
    } catch (e: any) {
      this.logger.error(`Error fetching users: ${e.message}`);
      throw new InternalServerErrorException('Failed to fetch users.');
    }
  }

  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async findById(userId: number): Promise<tbdentaluserrecord> {
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
  ): Promise<tbdentaluserrecord> {
    this.logger.log(`PATCH api/tbdentalrecorduser/${userId}`);

    const existingUser = await this.findById(userId);

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

    const existingUser = await this.findById(userId);

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
