import { Injectable } from '@nestjs/common';
import { isEmpty, isNil, omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { QueryHook } from '@/modules/database/types';
import { PublicOrderType } from '@/modules/system/constants';

import { CreateResourceDto, QueryResourceDto, UpdateResourceDto } from '../dtos';
import { ResourceEntity } from '../entities';
import { ResourceRepository } from '../repositories';

/**
 * 系统参数数据操作
 */
@Injectable()
export class ResourceService extends BaseService<ResourceEntity, ResourceRepository> {
    constructor(protected repository: ResourceRepository) {
        super(repository);
    }

    /**
     * 新建系统参数
     * @param data
     */
    async create(data: CreateResourceDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新系统参数
     * @param data
     */
    async update(data: UpdateResourceDto) {
        await this.repository.update(data.id, omit(data, ['id', 'code']));
        return this.detail(data.id);
    }

    /**
     * 构建参数列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<ResourceEntity>,
        options: QueryResourceDto,
        callback?: QueryHook<ResourceEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, menuId, code, name, timeRange } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(menuId)) {
            qb.andWhere(`${queryName}.menu_id = ${menuId}`);
        }
        if (!isEmpty(code)) {
            qb.andWhere(`${queryName}.code like '%${code}%'`);
        }
        if (!isEmpty(name)) {
            qb.andWhere(`${queryName}.name like '%${name}%'`);
        }
        if (!isNil(timeRange)) {
            qb.andWhere(`${queryName}.created_at between ${timeRange[0]} and ${timeRange[1]}`);
        }
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 对系统参数进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<ResourceEntity>, orderBy?: PublicOrderType) {
        const queryName = this.repository.qbName;
        switch (orderBy) {
            case PublicOrderType.CREATED:
                return qb.orderBy(`${queryName}.created_at`, 'DESC');
            case PublicOrderType.UPDATED:
                return qb.orderBy(`${queryName}.updated_at`, 'DESC');
            default:
                return qb.orderBy(`${queryName}.id`, 'ASC');
        }
    }
}
