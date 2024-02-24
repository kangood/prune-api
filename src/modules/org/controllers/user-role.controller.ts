import { Body, Controller, Get, Post, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateUserRoleDto, QueryUserRoleDto, UpdateUserRoleDto } from '../dtos';

import { UserRoleService } from '../services';

@Crud({
    id: 'user-role',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateUserRoleDto,
        update: UpdateUserRoleDto,
        list: QueryUserRoleDto,
    },
    preAuth: 'org:userRole:',
})
@Controller('user-role')
@RequireLogin()
export class UserRoleController extends BaseController<UserRoleService> {
    constructor(protected service: UserRoleService) {
        super(service);
    }

    @Get('listUserRoleByRoleId')
    @RequireAuthority('org:userRole:listUserRoleByRoleId')
    listUserRoleByRoleId(@Query() options: QueryUserRoleDto) {
        return this.service.listUserRoleByRoleId(options);
    }

    @Post('saveListAfterDelete')
    @RequireAuthority('org:userRole:saveListAfterDelete')
    saveListAfterDelete(@Body() options: CreateUserRoleDto) {
        return this.service.saveListAfterDelete(options);
    }
}
