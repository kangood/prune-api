import { Controller, Get, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateOssDto, QueryOssDto, UpdateOssDto } from '../dtos';

import { OssService } from '../services';

@Crud({
    id: 'oss',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateOssDto,
        update: UpdateOssDto,
        list: QueryOssDto,
    },
    preAuth: 'resource:oss:',
})
@Controller('oss')
@RequireLogin()
export class OssController extends BaseController<OssService> {
    constructor(protected service: OssService) {
        super(service);
    }

    @Get('listRelate')
    @RequireAuthority('resource:oss:listRelate')
    async listRelate(@Query() options: QueryOssDto) {
        return this.service.listRelate(options);
    }
}
