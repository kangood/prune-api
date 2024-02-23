import { Injectable, NotAcceptableException } from '@nestjs/common';
import { isEmpty, omit, groupBy } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { paginateType } from '@/modules/database/helpers';
import { QueryHook } from '@/modules/database/types';
import { PublicOrderType } from '@/modules/system/constants';

import { CreateDictionaryDto, QueryDictionaryDto, UpdateDictionaryDto } from '../dtos';
import { DictionaryEntity } from '../entities';
import { DictionaryRepository } from '../repositories';

// 字典查询接口
type FindParams = {
    [key in keyof Omit<QueryDictionaryDto, 'limit' | 'page'>]: QueryDictionaryDto[key];
};

/**
 * 字典数据操作
 */
@Injectable()
export class DictionaryService extends BaseService<
    DictionaryEntity,
    DictionaryRepository,
    FindParams
> {
    constructor(protected repository: DictionaryRepository) {
        super(repository);
    }

    /**
     * 新建字典值
     * @param data
     */
    async create(data: CreateDictionaryDto) {
        const createParams = await super.create(data);
        // 先判断字典编码是否重复
        const qb = await super.buildListQB(this.repository.buildBaseQB(), createParams);
        const count = await qb
            .where({ type: createParams.type, code: createParams.code })
            .getCount();
        if (count > 0) {
            throw new NotAcceptableException(`dictionary code [${createParams.code}] is repeated`);
        }
        // 判断后再执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新字典值
     * @param data
     */
    async update(data: UpdateDictionaryDto) {
        await this.repository.update(data.id, omit(data, ['id', 'type', 'code']));
        return this.detail(data.id);
    }

    /**
     * 获取分页数据
     * @param options 分页选项
     * @param callback 回调查询
     */
    async paginateType(options?: QueryDictionaryDto, callback?: QueryHook<DictionaryEntity>) {
        const qb = await this.buildListByTypeQB(this.repository.buildBaseQB(), options, callback);
        // 调用按类型分组的分页函数
        return paginateType(this.repository.manager, qb, options);
    }

    /**
     * 构建字典列表类型分组查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListByTypeQB(
        queryBuilder: SelectQueryBuilder<DictionaryEntity>,
        options: FindParams,
        callback?: QueryHook<DictionaryEntity>,
    ) {
        const { label } = options;
        const queryName = this.repository.qbName;
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 根据输入文字模糊查询
        if (!isEmpty(label)) {
            qb.where(
                `${queryName}.type like '%${label}%' or ${queryName}.label like '%${label}%' or ${queryName}.name like '%${label}%'`,
            );
        }
        // 分组
        qb.groupBy('type,label');
        // 排序
        // this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 构建字典列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<DictionaryEntity>,
        options: FindParams,
        callback?: QueryHook<DictionaryEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, type, code, name } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(type)) {
            qb.andWhere({ type });
        }
        if (!isEmpty(code)) {
            qb.andWhere(`${queryName}.code like '%${code}%'`);
        }
        if (!isEmpty(name)) {
            qb.andWhere(`${queryName}.name like '%${name}%'`);
        }
        qb.andWhere(`${queryName}.code <> '00'`);
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 根据类型查询字典列表
     */
    async listWhereType(options: FindParams, callback?: QueryHook<DictionaryEntity>) {
        const qb = await super.buildListQB(this.repository.buildBaseQB(), options, callback);
        const { type } = options;
        // 根据类型批量查询
        if (!isEmpty(type)) {
            qb.where(`${this.repository.qbName}.type in ${type}`);
        }
        // 排除 code='00' 的数据
        qb.andWhere(`${this.repository.qbName}.code <> '00'`);
        // 排除 state=0 的数据
        qb.andWhere(`${this.repository.qbName}.state <> 0`);
        return qb.getMany();
    }

    /**
     * 多类型字典列表查询
     */
    async listWhereTypes(options: FindParams, callback?: QueryHook<DictionaryEntity>) {
        if (options?.type) {
            options.type = `(${options.type})`;
        }
        const dictList = await this.listWhereType(options, callback);
        return groupBy(dictList, 'type');
    }

    /**
     * 对字典进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<DictionaryEntity>, orderBy?: PublicOrderType) {
        const queryName = this.repository.qbName;
        switch (orderBy) {
            // 按时间倒序
            case PublicOrderType.CREATED:
                return qb.orderBy(`${queryName}.created_at`, 'DESC');
            case PublicOrderType.UPDATED:
                return qb.orderBy(`${queryName}.updated_at`, 'DESC');
            // 默认按id正序
            default:
                return qb.orderBy(`${queryName}.id`, 'ASC');
        }
    }
}
