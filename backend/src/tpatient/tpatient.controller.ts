import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
} from '@nestjs/common';
import { TpatientService } from './tpatient.service';
import { CreateTpatientDto } from './dto/create-tpatient.dto';
import { UpdateTpatientDto } from './dto/update-tpatient.dto';
import {
  ApiBadRequestResponse,
  ApiBody,
  ApiCreatedResponse,
  ApiExtraModels,
  ApiInternalServerErrorResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiQuery,
  ApiTags,
  ApiBearerAuth,
  ApiUnauthorizedResponse,
  ApiForbiddenResponse,
  ApiConflictResponse,
} from '@nestjs/swagger';
import { t_patient } from './entities/tpatient.entity';
import { RolesGuard } from 'src/utils/auth/role.guard';
import { ROLES, Roles } from 'src/utils/auth/role.decorator';

@ApiTags('tpatient')
@ApiBearerAuth()
@ApiExtraModels(t_patient)
@Controller('patient')
@UseGuards(RolesGuard)
@Roles(ROLES.ADMIN)
@Roles(ROLES.MEDICALRECORD)
export class TpatientController {
  constructor(private readonly tpatientService: TpatientService) {}

  //POST /api/patient ADMIN
  @ApiOperation({ 
    summary: 'ADMIN', 
    description: 'สร้างคนไข้' 
  })
  @ApiBody({
    type: CreateTpatientDto,
  })
  @ApiCreatedResponse({
    description: 'Create a patient success',
    schema: {
      type: 'object',
      properties: {
        message: { type: 'string', example: 'Create a patient success' },
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
            'DN required',
            'EN title required',
            'EN name required',
            'EN surname required',
            'Sex required',
            'Marital Status required',
            'Age required',
            'Occupation required',
            'Phone Office required',
            'Emergency Contact required',
            'Emergency Address required',
            'Parent required',
            'Parent phone required',
            'Physician required',
            'Phhysician phone required',
            'Other Address required',
          ],
        },
        error: { type: 'string', example: 'Bad Request' },
      },
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Unauthorized - Bearer token is missing or invalid',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 401 },
        message: { type: 'string', example: 'Authorization header is missing' },
        error: { type: 'string', example: 'Unauthorized' },
      },
    },
  })
  @ApiForbiddenResponse({
      description: 'Forbidden - Admin role required',
      schema: {
        type: 'object',
        properties: {
          statusCode: { type: 'number', example: 403 },
          message: { type: 'string', example: 'Access denied. Required roles: admin. User role: teacher' },
          error: { type: 'string', example: 'Forbidden' },
        },
      },
    })
  @ApiConflictResponse({
      description: 'Patient name already exists',
      schema: {
        type: 'object',
        properties: {
          statusCode: { type: 'number', example: 409 },
          message: { type: 'string', example: 'Patient name already exists' },
          error: { type: 'string', example: 'Conflict' },
        },
      },
    })
  @ApiInternalServerErrorResponse({
    description: 'Failed to create a patient',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to create a patient' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Post()
  create(@Body() dto: CreateTpatientDto) {
    return this.tpatientService.create(dto);
  }

  //GET /api/patient ADMIN
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
  @ApiUnauthorizedResponse({
    description: 'Unauthorized - Bearer token is missing or invalid',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 401 },
        message: { type: 'string', example: 'Authorization header is missing' },
        error: { type: 'string', example: 'Unauthorized' },
      },
    },
  })
  @ApiForbiddenResponse({
    description: 'Forbidden - Admin role required',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 403 },
        message: { type: 'string', example: 'Access denied. Required roles: admin. User role: teacher' },
        error: { type: 'string', example: 'Forbidden' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to fetch patient data',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to fetch patient data' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Get()
  findAll() {
    return this.tpatientService.findAll();
  }

  //GET /api/patient/{dn} ADMIN
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
    description: 'Validation errors',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 400 },
        message: { type: 'string', example: 'DN required' },
        error: { type: 'string', example: 'Bad Request' },
      },
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Unauthorized - Bearer token is missing or invalid',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 401 },
        message: { type: 'string', example: 'Authorization header is missing' },
        error: { type: 'string', example: 'Unauthorized' },
      },
    },
  })
  @ApiForbiddenResponse({
    description: 'Forbidden - Admin role required',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 403 },
        message: { type: 'string', example: 'Access denied. Required roles: admin. User role: teacher' },
        error: { type: 'string', example: 'Forbidden' },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'A patient not found',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 404 },
        message: { type: 'string', example: 'A patient not found' },
        error: { type: 'string', example: 'Not Found' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to fetch patient data',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to fetch patient data' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Get(':dn')
  findOne(@Param('dn') dn: string) {
    return this.tpatientService.findOne(dn);
  }

  //PATCH /api/patient/{dn} ADMIN
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
    description: 'Patient information update successful',
    type: t_patient,
  })
  @ApiBadRequestResponse({
    description: 'Validation errors',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 400 },
        message: { type: 'string', example: 'DN required' },
        error: { type: 'string', example: 'Bad Request' },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'A patient not found',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 404 },
        message: { type: 'string', example: 'A patient not found' },
        error: { type: 'string', example: 'Not Found' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to update a patient',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to update a patient' },
        error: { type: 'string', example: 'Internal Server Error' },
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

  //DELETE /api/patient/{dn} ADMIN
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
    description: 'Patient DN:{DN} is deleted successfully',
    schema: {
      type: 'object',
      properties: {
        message: { type: 'string', example: 'Dental user deleted successfully', },
        deletedDN: { type: 'string', example: '000001', },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'A patient not found',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 404 },
        message: { type: 'string', example: 'A patient not found' },
        error: { type: 'string', example: 'Not Found' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to delete a patient',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to delete a patient' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Delete(':dn')
  remove(@Param('dn') dn: string) {
    return this.tpatientService.remove(dn);
  }
}
