import { Controller, Get, Query, SerializeOptions } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateDictionaryDto, QueryDictionaryDto, UpdateDictionaryDto } from '../dtos';

import { DictionaryService } from '../services';

@Crud({
    id: 'dict',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateDictionaryDto,
        update: UpdateDictionaryDto,
        list: QueryDictionaryDto,
    },
    preAuth: 'system:dict:',
})
@Controller('dict')
@RequireLogin()
export class DictionaryController extends BaseController<DictionaryService> {
    constructor(protected service: DictionaryService) {
        super(service);
    }

    @Get('listType')
    @RequireAuthority('system:dict:listType')
    @SerializeOptions({ groups: ['dict-list'] })
    listType(@Query() dto: QueryDictionaryDto) {
        return this.service.paginateType(dto);
    }

    @Get('listMultiType')
    @RequireAuthority('system:dict:listMultiType')
    @SerializeOptions({ groups: ['dict-list'] })
    listMultiType(@Query() dto: QueryDictionaryDto) {
        return this.service.listWhereTypes(dto);
    }
}
