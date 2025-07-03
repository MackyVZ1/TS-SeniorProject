import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  ParseIntPipe,
  UseGuards,
  Query,
} from '@nestjs/common';
import { TbdentaluserrecordService } from './tbdentaluserrecord.service';
import { CreateTbdentaluserrecordDto } from './dto/create-tbdentaluserrecord.dto';
import { UpdateTbdentaluserrecordDto } from './dto/update-tbdentaluserrecord.dto';
import { tbdentaluserrecord } from './entities/tbdentaluserrecord.entity';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiQuery,
  ApiBody,
  ApiBadRequestResponse,
  ApiNotFoundResponse,
  ApiConflictResponse,
  ApiInternalServerErrorResponse,
  ApiOkResponse,
  ApiExtraModels,
  ApiBearerAuth,
  ApiUnauthorizedResponse,
  ApiForbiddenResponse,
  ApiCreatedResponse,
} from '@nestjs/swagger';
import { Roles, ROLES } from 'src/utils/auth/role.decorator';
import { RolesGuard } from 'src/utils/auth/role.guard';

@ApiTags('tbdentalrecorduser')
@ApiBearerAuth()
@ApiExtraModels(tbdentaluserrecord)
@Controller('tbdentalrecorduser')
@UseGuards(RolesGuard)
@Roles(ROLES.ADMIN)
export class TbdentaluserrecordController {
  constructor(
    private readonly tbdentaluserrecordService: TbdentaluserrecordService,
  ) {}

  //POST /api/tbdentalrecorduser ADMIN
  @ApiOperation({
    summary: 'ADMIN',
    description: 'สร้างผู้ใช้งานระบบทันตกรรม',
  })
  @ApiBody({
    type: CreateTbdentaluserrecordDto,
  })
  @ApiCreatedResponse({
    description: 'Create a user success',
    schema: {
      type: 'object',
      properties: {
        message: { type: 'string', example: 'Create a user success' },
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
        message: { type: 'string', example: 'Access denied.' },
        error: { type: 'string', example: 'Forbidden' },
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
            'Firstname required',
            'Lastname required',
            'Username required',
            'Password required',
          ],
        },
        error: { type: 'string', example: 'Bad Request' },
      },
    },
  })
  @ApiConflictResponse({
    description: 'Username already exists',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 409 },
        message: { type: 'string', example: 'Username already exists' },
        error: { type: 'string', example: 'Conflict' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to create a user',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to create a user' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Post()
  create(@Body() createTbdentaluserrecordDto: CreateTbdentaluserrecordDto) {
    return this.tbdentaluserrecordService.create(createTbdentaluserrecordDto);
  }

  //GET /api/tbdentalrecorduser ADMIN
  @ApiOperation({
    summary: 'ADMIN',
    description: 'ดึงข้อมูลผู้ใช้งานทั้งหมดในระบบทันตกรรม',
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
  @ApiQuery({
    name: 'keyword',
    required: false,
    type: String,
    description: 'Search keyword for first name or last name',
    example: 'John',
  })
  @ApiQuery({
    name: 'roleId',
    required: false,
    type: Number,
    description: 'Filter by role ID',
    example: 1,
  })
  @ApiQuery({
    name: 'clinicId',
    required: false,
    type: String,
    description: 'Filter by clinic ID',
    example: '1',
  })
  @ApiOkResponse({
    description: 'Return all dental user records',
    schema: {
      type: 'object',
      properties: {
        data: {
          type: 'array',
          items: {
            type: 'object',
            properties: {
              license: { type: 'string', example: 'DEN12345' },
              fName: { type: 'string', example: 'John' },
              lName: { type: 'string', example: 'Smith' },
              studentID: { type: 'string', example: 'STU001' },
              roleID: { type: 'number', example: 1 },
              tName: { type: 'string', example: 'Dr.' },
            },
          },
        },
        total: { type: 'number', example: 100 },
        page: { type: 'number', example: 1 },
        pageCount: { type: 'number', example: 10 },
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
        message: { type: 'string', example: 'Access denied.' },
        error: { type: 'string', example: 'Forbidden' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to fetch dental user records',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: {
          type: 'string',
          example: 'Failed to fetch dental user records',
        },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Get()
  findAll(
    @Query('page', ParseIntPipe) page: number,
    @Query('limit', ParseIntPipe) limit: number,
    @Query('keyword') keyword?: string,
    @Query('roleId') roleId?: number,
    @Query('clinicId') clinicId?: string,
  ) {
    return this.tbdentaluserrecordService.findAll(
      page,
      limit,
      keyword,
      roleId,
      clinicId,
    );
  }

  //GET /api/tbdentalrecorduser/{userId} ADMIN
  @ApiOperation({
    summary: 'ADMIN',
    description: 'ดึงข้อมูลผู้ใช้งานในระบบทันตกรรมด้วย ID',
  })
  @ApiParam({
    name: 'userId',
    type: 'number',
    description: 'ID ผู้ใช้งาน',
    example: 1,
  })
  @ApiOkResponse({
    description: 'Return all dental user records',
    schema: {
      type: 'object',
      properties: {
        data: {
          type: 'array',
          items: {
            type: 'object',
            properties: {
              userId: { type: 'number', example: 1 },
              license: { type: 'string', example: 'DEN12345' },
              fName: { type: 'string', example: 'John' },
              lName: { type: 'string', example: 'Smith' },
              studentID: { type: 'string', example: 'STU001' },
              roleID: { type: 'number', example: 1 },
              users: { type: 'string', example: 'john_dentist' },
              tName: { type: 'string', example: 'Dr.' },
              sort: { type: 'number', example: 1 },
              type: { type: 'string', example: 'dentist' },
              clinicid: { type: 'string', example: '101' },
            },
          },
        },
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
        message: { type: 'string', example: 'Access denied.' },
        error: { type: 'string', example: 'Forbidden' },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'Dental user record not found',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 404 },
        message: { type: 'string', example: 'Dental user record not found' },
        error: { type: 'string', example: 'Not Found' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to fetch a user',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to fetch a user' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Get(':userId')
  findOne(@Param('userId', ParseIntPipe) userId: number) {
    return this.tbdentaluserrecordService.findById(userId);
  }

  //PATCH /api/tbdentalrecorduser/{userId} ADMIN
  @ApiOperation({
    summary: 'ADMIN',
    description: 'อัพเดทข้อมูลผู้ใข้งานในระบบทันตกรรมด้วย ID',
  })
  @ApiParam({
    name: 'userId',
    type: 'number',
    description: 'ID ผู้ใช้งาน',
    example: '1',
  })
  @ApiBody({
    type: UpdateTbdentaluserrecordDto,
  })
  @ApiOkResponse({
    description: 'The dental user record has been successfully updated',
    type: tbdentaluserrecord,
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
        message: { type: 'string', example: 'Access denied.' },
        error: { type: 'string', example: 'Forbidden' },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'Dental user record not found',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 404 },
        message: { type: 'string', example: 'Dental user record not found' },
        error: { type: 'string', example: 'Not Found' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to update dental user',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to update dental user' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Patch(':userId')
  update(
    @Param('userId', ParseIntPipe) userId: number,
    @Body() updateTbdentaluserrecordDto: UpdateTbdentaluserrecordDto,
  ) {
    return this.tbdentaluserrecordService.update(
      userId,
      updateTbdentaluserrecordDto,
    );
  }

  //DELETE /api/tbdentalrecorduser/{userId} ADMIN
  @ApiOperation({
    summary: 'ADMIN',
    description: 'ลบผู้ใข้งานในระบบทันตกรรมด้วย ID',
  })
  @ApiParam({
    name: 'userId',
    type: 'number',
    description: 'ID ผู้ใช้งาน',
    example: 1,
  })
  @ApiOkResponse({
    description: 'User ID:{ID} is deleted successfully',
    schema: {
      type: 'object',
      properties: {
        message: {
          type: 'string',
          example: 'Dental user deleted successfully',
        },
        deletedId: { type: 'string', example: 1 },
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
        message: { type: 'string', example: 'Access denied.' },
        error: { type: 'string', example: 'Forbidden' },
      },
    },
  })
  @ApiNotFoundResponse({
    description: 'Dental user not found',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 404 },
        message: { type: 'string', example: 'Dental user not found' },
        error: { type: 'string', example: 'Not Found' },
      },
    },
  })
  @ApiInternalServerErrorResponse({
    description: 'Failed to delete dental user',
    schema: {
      type: 'object',
      properties: {
        statusCode: { type: 'number', example: 500 },
        message: { type: 'string', example: 'Failed to delete dental user' },
        error: { type: 'string', example: 'Internal Server Error' },
      },
    },
  })
  @Delete(':userId')
  remove(@Param('userId', ParseIntPipe) userId: number) {
    return this.tbdentaluserrecordService.remove(userId);
  }
}
