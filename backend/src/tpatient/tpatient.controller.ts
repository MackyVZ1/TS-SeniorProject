import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { TpatientService } from './tpatient.service';
import { CreateTpatientDto } from './dto/create-tpatient.dto';
import { UpdateTpatientDto } from './dto/update-tpatient.dto';
import {
  ApiBadRequestResponse,
  ApiBody,
  ApiExtraModels,
  ApiInternalServerErrorResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import { t_patient } from './entities/tpatient.entity';

@ApiTags('tpatient')
@ApiExtraModels(t_patient)
@Controller('patient')
export class TpatientController {
  constructor(private readonly tpatientService: TpatientService) {}

  @ApiOperation({ summary: 'ADMIN', description: 'สร้างคนไข้' })
  @ApiBody({
    type: CreateTpatientDto,
  })
  @ApiOkResponse({
    description: 'Create a patient success.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @ApiBadRequestResponse({
    description: 'Validation errors',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 400 },
        message: {
          type: 'array',
          items: { type: 'string' },
          example: [
            'DN required.',
            'EN title required.',
            'EN name required.',
            'EN surname required.',
            'Sex required.',
            'Marital Status required.',
            'Age required.',
            'Occupation required.',
            'Phone Office required.',
            'Emergency Contact required.',
            'Emergency Address required.',
            'Parent required.',
            'Parent phone required.',
            'Physician required.',
            'Phhysician phone required.',
            'Other Address required.',
          ],
        },
        error: { type: 'string', example: 'Bad Request' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to create a patient.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @Post()
  create(@Body() dto: CreateTpatientDto) {
    return this.tpatientService.create(dto);
  }

  @ApiOperation({
    summary: 'ADMIN',
    description: 'ดึงข้อมูลคนไข้ทั้งหมด',
  })
  @ApiQuery({
    name: 'page',
    required: true,
    type: Number,
    description: 'Page number (min: 1)',
    example: 1,
  })
  @ApiQuery({
    name: 'limit',
    required: true,
    type: Number,
    description: 'Number of records per page (min: 1, max: 100)',
    example: 10,
  })
  @ApiOkResponse({
    description: 'ข้อมูลคนไข้ทั้งหมด',
    schema: {
      oneOf: [
        {
          type: 'object',
          properties: {
            data: {
              type: 'array',
              items: { $ref: '#/components/schemas/t_patient' },
            },
          },
        },
        {
          type: 'object',
          properties: {
            message: { type: 'string' },
          },
        },
      ],
    },
  })
  @Get()
  findAll() {
    return this.tpatientService.findAll();
  }

  @ApiOperation({
    summary: 'ADMIN',
    description: 'ดึงข้อมูลคนไข้ด้วย ID',
  })
  @ApiParam({
    name: 'dn',
    type: 'string',
    description: 'DN คนไข้',
    example: '000001',
  })
  @ApiOkResponse({
    description: 'ข้อมูลคนไข้',
    schema: {
      oneOf: [
        {
          type: 'object',
          properties: {
            data: {
              type: 'array',
              items: { $ref: '#/components/schemas/t_patient' },
            },
          },
        },
        {
          type: 'object',
          properties: {
            message: { type: 'string' },
          },
        },
      ],
    },
  })
  @ApiBadRequestResponse({
    description: 'DN required.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'A patient not found.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to fetch a patient.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @Get(':dn')
  findOne(@Param('dn') dn: string) {
    return this.tpatientService.findOne(dn);
  }

  @ApiOperation({
    summary: 'ADMIN',
    description: 'อัพเดทข้อมูลคนไข้ด้วย DN',
  })
  @ApiParam({
    name: 'dn',
    type: 'string',
    description: 'DN คนไข้',
    example: '000001',
  })
  @ApiBody({
    type: UpdateTpatientDto,
  })
  @ApiOkResponse({
    type: t_patient,
  })
  @ApiBadRequestResponse({
    description: 'DN required.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'A patient not found.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to update a patient.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @Patch(':dn')
  update(
    @Param('dn') dn: string,
    @Body() updateTpatientDto: UpdateTpatientDto,
  ) {
    return this.tpatientService.update(dn, updateTpatientDto);
  }

  @ApiOperation({
    summary: 'ADMIN',
    description: 'ลบคนไข้ด้วย DN',
  })
  @ApiParam({
    name: 'dn',
    type: 'string',
    description: 'DN คนไข้',
    example: '000001',
  })
  @ApiOkResponse({
    description: 'A patient is deleted.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'A patient not found.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to delete a patient.',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
        },
      },
    },
  })
  @Delete(':dn')
  remove(@Param('dn') dn: string) {
    return this.tpatientService.remove(dn);
  }
}
