import { Controller, Get, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateRoleDto, QueryRoleDto, UpdateRoleDto } from '../dtos';

import { RoleService } from '../services';

@Crud({
    id: 'role',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateRoleDto,
        update: UpdateRoleDto,
        list: QueryRoleDto,
    },
    preAuth: 'org:role:',
})
@Controller('role')
@RequireLogin()
export class RoleController extends BaseController<RoleService> {
    constructor(protected service: RoleService) {
        super(service);
    }

    @Get('listRelate')
    @RequireAuthority('org:role:listRelate')
    listRelate(@Query() options: QueryRoleDto) {
        return this.service.listRelate(options);
    }
}
