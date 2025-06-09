import { Test, TestingModule } from '@nestjs/testing';
import { TbdentaluserrecordService } from './tbdentaluserrecord.service';

describe('TbdentaluserrecordService', () => {
  let service: TbdentaluserrecordService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TbdentaluserrecordService],
    }).compile();

    service = module.get<TbdentaluserrecordService>(TbdentaluserrecordService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
