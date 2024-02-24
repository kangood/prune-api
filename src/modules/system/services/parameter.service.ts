import { Injectable, NotAcceptableException } from '@nestjs/common';
import { isEmpty, isNil, omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { QueryHook } from '@/modules/database/types';
import { PublicOrderType } from '@/modules/system/constants';

import { QueryParameterDto, CreateParameterDto, UpdateParameterDto } from '../dtos';
import { ParameterEntity } from '../entities';
import { ParameterRepository } from '../repositories';

// 系统参数查询接口
type FindParams = {
    [key in keyof Omit<QueryParameterDto, 'limit' | 'page'>]: QueryParameterDto[key];
};

/**
 * 系统参数数据操作
 */
@Injectable()
export class ParameterService extends BaseService<
    ParameterEntity,
    ParameterRepository,
    FindParams
> {
    constructor(protected repository: ParameterRepository) {
        super(repository);
    }

    /**
     * 新建系统参数
     * @param data
     */
    async create(data: CreateParameterDto) {
        const createParams = await super.create(data);
        // 先判断参数键是否重复
        const qb = await super.buildListQB(this.repository.buildBaseQB(), createParams);
        const count = await qb.where({ key: createParams.key }).getCount();
        if (count > 0) {
            throw new NotAcceptableException(`parameter key [${createParams.key}] is repeated`);
        }
        // 判断后再执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新系统参数
     * @param data
     */
    async update(data: UpdateParameterDto) {
        await this.repository.update(data.id, omit(data, ['id', 'key']));
        return this.detail(data.id);
    }

    /**
     * 构建参数列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<ParameterEntity>,
        options: FindParams,
        callback?: QueryHook<ParameterEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, key, value, name, timeRange } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(key)) {
            qb.andWhere(`${queryName}.key like '%${key}%'`);
        }
        if (!isEmpty(value)) {
            qb.andWhere(`${queryName}.value like '%${value}%'`);
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
    protected addOrderByQuery(qb: SelectQueryBuilder<ParameterEntity>, orderBy?: PublicOrderType) {
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
