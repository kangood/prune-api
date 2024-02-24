import { Controller, Get, Query } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateMenuDto, QueryMenuTreeDto, UpdateMenuDto } from '../dtos';
import { MenuService } from '../services';

@Crud({
    id: 'menu',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateMenuDto,
        update: UpdateMenuDto,
        list: QueryMenuTreeDto,
    },
    preAuth: 'system:menu:',
})
@Controller('menu')
@RequireLogin()
export class MenuController extends BaseController<MenuService> {
    constructor(protected service: MenuService) {
        super(service);
    }

    @Get('tree')
    @RequireAuthority('system:menu:tree')
    tree(@Query() options: QueryMenuTreeDto) {
        return this.service.findTrees(options);
    }
}
