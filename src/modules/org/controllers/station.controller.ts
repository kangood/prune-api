import {
    Controller,
    Get,
    Post,
    Query,
    Req,
    Res,
    UploadedFile,
    UseInterceptors,
} from '@nestjs/common';
import { Request } from 'express';
import { FastifyReply } from 'fastify';

import { diskStorage } from 'multer';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { UPLOAD_FOLDER } from '@/modules/restful/constants';
import { Crud } from '@/modules/restful/decorators';
import { FastifyFileInterceptor } from '@/modules/restful/upload/fastify-file-interceptor';

import { fileMapper } from '@/modules/restful/upload/file-mappter';
import { editFileName } from '@/modules/restful/upload/file-upload-util';

import { CreateStationDto, QueryStationDto, UpdateStationDto } from '../dtos';

import { StationService } from '../services';

@Crud({
    id: 'station',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateStationDto,
        update: UpdateStationDto,
        list: QueryStationDto,
    },
    preAuth: 'org:station:',
})
@Controller('station')
@RequireLogin()
export class StationController extends BaseController<StationService> {
    constructor(protected service: StationService) {
        super(service);
    }

    @Get('listRelate')
    @RequireAuthority('org:station:listRelate')
    listRelate(@Query() options: QueryStationDto) {
        return this.service.listRelate(options);
    }

    @Get('exportExcel')
    @RequireAuthority('org:station:exportExcel')
    exportExcel(@Query() options: QueryStationDto, @Res() response: FastifyReply) {
        return this.service.exportExcel(options, response);
    }

    @Post('importExcel')
    @RequireAuthority('org:station:importExcel')
    @UseInterceptors(
        FastifyFileInterceptor('file', {
            storage: diskStorage({
                destination: UPLOAD_FOLDER,
                filename: editFileName,
            }),
        }),
    )
    importExcel(@UploadedFile() file: Express.Multer.File, @Req() req: Request) {
        this.service.importExcel(file);
        return { file: fileMapper({ file, req }) };
    }
}
