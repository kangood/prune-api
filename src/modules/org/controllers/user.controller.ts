import { Controller, Get, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateUserDto, LoginUserDto, QueryUserDto, UpdateUserDto } from '../dtos';

import { UserService } from '../services';

@Crud({
    id: 'user',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateUserDto,
        update: UpdateUserDto,
        list: QueryUserDto,
    },
    preAuth: 'org:user:',
})
@Controller('user')
@RequireLogin()
export class UserController extends BaseController<UserService> {
    constructor(protected service: UserService) {
        super(service);
    }

    @Get('listRelate')
    @RequireAuthority('org:user:listRelate')
    async listRelate(@Query() options: QueryUserDto) {
        return this.service.listRelate(options);
    }

    @Get('getUserSigninAfterInfo')
    @RequireAuthority('org:user:getUserSigninAfterInfo')
    async getUserSigninAfterInfo(@Query() options: LoginUserDto) {
        return this.service.getUserSigninAfterInfo(options);
    }
}
