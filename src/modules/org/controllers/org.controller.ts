import { Controller, Get, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateOrgDto, QueryOrgTreeDto, UpdateOrgDto } from '../dtos';
import { OrgService } from '../services';

@Crud({
    id: 'org',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateOrgDto,
        update: UpdateOrgDto,
        list: QueryOrgTreeDto,
    },
    preAuth: 'org:org:',
})
@Controller('org')
@RequireLogin()
export class OrgController extends BaseController<OrgService> {
    constructor(protected service: OrgService) {
        super(service);
    }

    @Get('tree')
    @RequireAuthority('org:org:tree')
    tree(@Query() options: QueryOrgTreeDto) {
        return this.service.findTrees(options);
    }
}
