import { Controller, Get, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateOsscDto, QueryOsscDto, UpdateOsscDto } from '../dtos';

import { OsscService } from '../services';

@Crud({
    id: 'ossc',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateOsscDto,
        update: UpdateOsscDto,
        list: QueryOsscDto,
    },
    preAuth: 'resource:ossc:',
})
@Controller('ossc')
@RequireLogin()
export class OsscController extends BaseController<OsscService> {
    constructor(protected service: OsscService) {
        super(service);
    }

    @Get('listRelate')
    @RequireAuthority('resource:ossc:listRelate')
    async listRelate(@Query() options: QueryOsscDto) {
        return this.service.listRelate(options);
    }
}
