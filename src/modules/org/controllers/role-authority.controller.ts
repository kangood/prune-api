import { Body, Controller, Get, Post, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { AUTHORITY_TYPE_MENU } from '../constants';
import { CreateRoleAuthorityDto, QueryRoleAuthorityDto } from '../dtos';

import { RoleAuthorityService } from '../services';

@Crud({
    id: 'role',
    enabled: ['list', 'detail', 'store', 'delete', 'restore'],
    dtos: {
        store: CreateRoleAuthorityDto,
        list: QueryRoleAuthorityDto,
    },
    preAuth: 'org:roleAuthority:',
})
@Controller('role-authority')
@RequireLogin()
export class RoleAuthorityController extends BaseController<RoleAuthorityService> {
    constructor(protected service: RoleAuthorityService) {
        super(service);
    }

    @Get('listRoleAuthorityIdByRoleId')
    @RequireAuthority('org:roleAuthority:listRoleAuthorityIdByRoleId')
    listRoleAuthorityIdByRoleId(@Query() options: QueryRoleAuthorityDto) {
        return this.service.listRoleAuthorityIdByRoleId(options);
    }

    @Post('listRoleMenuByRoleIds')
    @RequireAuthority('org:roleAuthority:listRoleMenuByRoleIds')
    listRoleMenuByRoleIds(@Body() options: QueryRoleAuthorityDto) {
        options.authorityType = AUTHORITY_TYPE_MENU;
        return this.service.listRoleAuthorityByRoleIds(options);
    }

    @Post('saveBatchRoleAutority')
    @RequireAuthority('org:roleAuthority:saveBatchRoleAutority')
    saveBatchRoleAutority(@Body() options: CreateRoleAuthorityDto) {
        return this.service.saveBatchRoleAutority(options);
    }
}
