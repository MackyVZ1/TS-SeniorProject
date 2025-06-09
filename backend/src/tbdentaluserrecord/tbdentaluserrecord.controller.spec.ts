import { Test, TestingModule } from '@nestjs/testing';
import { TbdentaluserrecordController } from './tbdentaluserrecord.controller';
import { TbdentaluserrecordService } from './tbdentaluserrecord.service';

describe('TbdentaluserrecordController', () => {
  let controller: TbdentaluserrecordController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TbdentaluserrecordController],
      providers: [TbdentaluserrecordService],
    }).compile();

    controller = module.get<TbdentaluserrecordController>(
      TbdentaluserrecordController,
    );
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
