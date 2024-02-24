import { Injectable } from '@nestjs/common';
import { isEmpty, omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { paginate } from '@/modules/database/helpers';
import { PaginateReturn, QueryHook } from '@/modules/database/types';
import { DictionaryType, PublicOrderType } from '@/modules/system/constants';

import { QueryDictionaryDto } from '@/modules/system/dtos';

import { DictionaryService } from '@/modules/system/services';

import { CreateOssDto, OssEchoDto, QueryOssDto, UpdateOssDto } from '../dtos';
import { OssEntity } from '../entities';
import { OssRepository } from '../repositories';

// 用户查询接口
type FindParams = {
    [key in keyof Omit<QueryOssDto, 'limit' | 'page'>]: QueryOssDto[key];
};

/**
 * 用户数据操作
 */
@Injectable()
export class OssService extends BaseService<OssEntity, OssRepository, FindParams> {
    constructor(
        protected repository: OssRepository,
        protected dictionaryService: DictionaryService,
    ) {
        super(repository);
    }

    /**
     * 新建用户
     * @param data
     */
    async create(data: CreateOssDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新用户
     * @param data
     */
    async update(data: UpdateOssDto) {
        await this.repository.update(data.id, omit(data, ['id']));
        return this.detail(data.id);
    }

    /**
     * 调用关联查询并分页
     */
    async listRelate(
        options?: QueryOssDto,
        callback?: QueryHook<OssEntity>,
    ): Promise<PaginateReturn<OssEntity>> {
        // 调用 buildListQB
        const qb = await this.buildListQB(this.repository.buildBaseQB(), options, callback);
        // 调用分页函数，得到返回的数据
        const ossEntityPaginateReturn = await paginate(qb, options);
        const { items } = ossEntityPaginateReturn;
        // 查询字典列表按类型筛选
        const queryDictionaryDto = new QueryDictionaryDto();
        queryDictionaryDto.type = `('${DictionaryType.OSSC_CATEGORY}')`;
        queryDictionaryDto.trashed = options.trashed;
        const dictionaryEntities = await this.dictionaryService.listWhereType(queryDictionaryDto);
        // 查询完之后挨个参数替换翻译
        for (const item of items) {
            item.ossEchoDto = new OssEchoDto();
            for (const dictionaryEntity of dictionaryEntities) {
                // 翻译种类
                if (dictionaryEntity.type === DictionaryType.OSSC_CATEGORY) {
                    if (dictionaryEntity.code === item.category) {
                        item.ossEchoDto.category = dictionaryEntity.name;
                    }
                }
            }
        }
        return ossEntityPaginateReturn;
    }

    /**
     * 构建岗位列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<OssEntity>,
        options: FindParams,
        callback?: QueryHook<OssEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { category, code, accessKey, orderBy } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(category)) {
            qb.andWhere(`${queryName}.category = ${category}`);
        }
        if (!isEmpty(code)) {
            qb.andWhere(`${queryName}.code like '%${code}%'`);
        }
        if (!isEmpty(accessKey)) {
            qb.andWhere(`${queryName}.access_key like '%${accessKey}%'`);
        }
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 对用户进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<OssEntity>, orderBy?: PublicOrderType) {
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
