import { Body, Param, Query } from '@nestjs/common';

import { DeleteWithTrashDto, ListWithTrashedQueryDto, RestoreDto } from '../dtos';

/**
 * 基础控制器
 */
export abstract class BaseController<S> {
    protected service: S;

    constructor(service: S) {
        this.setService(service);
    }

    private setService(service: S) {
        this.service = service;
    }

    async list(@Query() options: ListWithTrashedQueryDto, ...args: any[]) {
        return (this.service as any).paginate(options);
    }

    async detail(
        @Param('id')
        id: number,
        ...args: any[]
    ) {
        return (this.service as any).detail(id);
    }

    async store(
        @Body()
        data: any,
        ...args: any[]
    ) {
        return (this.service as any).create(data);
    }

    async update(
        @Body()
        data: any,
        ...args: any[]
    ) {
        return (this.service as any).update(data);
    }

    async delete(
        @Body()
        { ids, trash }: DeleteWithTrashDto,
        ...args: any[]
    ) {
        return (this.service as any).delete(ids, trash);
    }

    async restore(
        @Body()
        { ids }: RestoreDto,
        ...args: any[]
    ) {
        return (this.service as any).restore(ids);
    }
}
