import { Controller } from '@nestjs/common';

import { RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateParameterDto, QueryParameterDto, UpdateParameterDto } from '../dtos';

import { ParameterService } from '../services';

@Crud({
    id: 'param',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateParameterDto,
        update: UpdateParameterDto,
        list: QueryParameterDto,
    },
    preAuth: 'system:param:',
})
@Controller('param')
@RequireLogin()
export class ParameterController extends BaseController<ParameterService> {
    constructor(protected service: ParameterService) {
        super(service);
    }
}
