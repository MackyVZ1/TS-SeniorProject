import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
  Logger,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Throttle, ThrottlerGuard } from '@nestjs/throttler';
import { UseGuards } from '@nestjs/common';
import { CreateTpatientDto } from './dto/create-tpatient.dto';
import { UpdateTpatientDto } from './dto/update-tpatient.dto';
import { t_patient } from './entities/tpatient.entity';

@Injectable()
@UseGuards(ThrottlerGuard)
export class TpatientService {
  private readonly logger = new Logger(TpatientService.name);
  constructor(
    @InjectRepository(t_patient)
    private readonly tpatientRepo: Repository<t_patient>,
  ) {}

  @Throttle({ default: { limit: 10, ttl: 60000 } })
  async create(dto: CreateTpatientDto): Promise<{ message: string }> {
    if (!dto.dn) throw new BadRequestException('DN required.');
    if (!dto.titleEn) throw new BadRequestException('EN title required.');
    if (!dto.nameEn) throw new BadRequestException('EN name required.');
    if (!dto.surnameEn) throw new BadRequestException('EN surname required.');
    if (!dto.sex) throw new BadRequestException('Sex required.');
    if (!dto.maritalStatus)
      throw new BadRequestException('Marital Status required.');
    if (!dto.age) throw new BadRequestException('Age required.');
    if (!dto.occupation) throw new BadRequestException('Occupation required.');
    if (!dto.phoneOffice)
      throw new BadRequestException('Phone Office required.');
    if (!dto.emerNotify)
      throw new BadRequestException('Emergency Contact required.');
    if (!dto.emerAddress)
      throw new BadRequestException('Emergency Address required.');
    if (!dto.parent) throw new BadRequestException('Parent required.');
    if (!dto.parentPhone)
      throw new BadRequestException('Parent phone required.');
    if (!dto.physician) throw new BadRequestException('Physician required.');
    if (!dto.physicianPhone)
      throw new BadRequestException('Phhysician phone required.');
    if (!dto.otherAddress)
      throw new BadRequestException('Other Address required.');

    try {
      const newPatient = this.tpatientRepo.create(dto);
      await this.tpatientRepo.save(newPatient);

      return { message: 'Create a patient success.' };
    } catch (e) {
      this.logger.error(e);
      throw new InternalServerErrorException('Failed to create a patient.');
    }
  }
  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async findAll(): Promise<{ data: t_patient[] } | { message: string }> {
    try {
      const data = await this.tpatientRepo.find();

      if (data.length == 0) return { message: 'No patients' };

      return { data };
    } catch (e) {
      this.logger.error(e);
      throw new InternalServerErrorException('Failed to fetch patients.');
    }
  }

  @Throttle({ default: { limit: 100, ttl: 60000 } })
  async findOne(dn: string): Promise<t_patient> {
    if (!dn) throw new BadRequestException('DN required.');
    try {
      const existingPatient = await this.tpatientRepo.findOne({
        where: { dn: dn },
      });

      if (!existingPatient) throw new NotFoundException('A patient not found.');

      return existingPatient;
    } catch (e) {
      this.logger.error(e);
      throw new InternalServerErrorException('Failed to fetch a patient');
    }
  }

  @Throttle({ default: { limit: 20, ttl: 60000 } })
  async update(dn: string, dto: UpdateTpatientDto): Promise<t_patient> {
    if (!dn) throw new BadRequestException('DN required.');

    const existingPatient = await this.findOne(dn);
    if (!existingPatient) throw new NotFoundException('A patient not found');

    try {
      Object.assign(existingPatient, dto);
      const updatePatient = await this.tpatientRepo.save(existingPatient);
      return updatePatient;
    } catch (e) {
      this.logger.error(e);
      throw new InternalServerErrorException('Failed to update the patient');
    }
  }

  @Throttle({ default: { limit: 10, ttl: 60000 } })
  async remove(dn: string) {
    if (!dn) throw new BadRequestException('DN required');

    const patient = await this.findOne(dn);
    if (!patient) throw new NotFoundException('A patient not found.');

    try {
      const result = await this.tpatientRepo.delete(dn);

      if (result.affected === 0) {
        throw new NotFoundException(`DN:${dn} not found`);
      }

      return {
        message: 'A patient is deleted.',
        DN: `${dn}`,
      };
    } catch (e) {
      this.logger.error(e);
      throw new InternalServerErrorException('Failed to delete a paient');
    }
  }
}
