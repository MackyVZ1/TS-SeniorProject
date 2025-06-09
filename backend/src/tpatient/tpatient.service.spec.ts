import { Test, TestingModule } from '@nestjs/testing';
import { TpatientService } from './tpatient.service';

describe('TpatientService', () => {
  let service: TpatientService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TpatientService],
    }).compile();

    service = module.get<TpatientService>(TpatientService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
