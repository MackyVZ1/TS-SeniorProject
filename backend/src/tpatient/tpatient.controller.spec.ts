import { Test, TestingModule } from '@nestjs/testing';
import { TpatientController } from './tpatient.controller';
import { TpatientService } from './tpatient.service';

describe('TpatientController', () => {
  let controller: TpatientController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TpatientController],
      providers: [TpatientService],
    }).compile();

    controller = module.get<TpatientController>(TpatientController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
