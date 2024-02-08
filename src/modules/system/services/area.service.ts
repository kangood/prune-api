import { Injectable } from '@nestjs/common';

import { isNil, omit } from 'lodash';
import { SelectQueryBuilder, EntityNotFoundError } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { SelectTrashMode } from '@/modules/database/constants';
import { PublicOrderType } from '@/modules/system/constants';

import { QueryAreaTreeDto, CreateAreaDto, UpdateAreaDto } from '../dtos';
import { AreaEntity } from '../entities';
import { AreaRepository } from '../repositories';

/**
 * 地区数据操作
 */
@Injectable()
export class AreaService extends BaseService<AreaEntity, AreaRepository> {
    protected enableTrash = false;

    constructor(protected repository: AreaRepository) {
        super(repository);
    }

    /**
     * 查询地区树
     */
    async findTrees(options: QueryAreaTreeDto) {
        const { trashed = SelectTrashMode.NONE } = options;
        return this.repository.findTrees({
            withTrashed: trashed === SelectTrashMode.ALL || trashed === SelectTrashMode.ONLY,
            onlyTrashed: trashed === SelectTrashMode.ONLY,
        });
    }

    /**
     * 新建地区
     * @param data
     */
    async create(data: CreateAreaDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save({
            ...createParams,
            // 传入父地区
            parent: await this.getParent(undefined, data.parent),
        });
    }

    /**
     * 更新地区
     * @param data
     */
    async update(data: UpdateAreaDto) {
        const parent = await this.getParent(data.id, data.parent);
        const querySet = omit(data, ['id', 'parent']);
        if (Object.keys(querySet).length > 0) {
            await this.repository.update(data.id, querySet);
        }
        const cat = await this.detail(data.id);
        const shouldUpdateParent =
            (!isNil(cat.parent) && !isNil(parent) && cat.parent.id !== parent.id) ||
            (isNil(cat.parent) && !isNil(parent)) ||
            (!isNil(cat.parent) && isNil(parent));
        // 父分类单独更新
        if (parent !== undefined && shouldUpdateParent) {
            cat.parent = parent;
            await this.repository.save(cat);
        }
        return cat;
    }

    /**
     * 获取请求传入的父地区
     * @param current 当前地区的ID
     * @param id
     */
    protected async getParent(current?: string, id?: string) {
        if (current === id) return undefined;
        let parent: AreaEntity | undefined;
        if (id !== undefined) {
            if (id === null) return null;
            parent = await this.repository.findOne({ where: { id } });
            if (!parent)
                throw new EntityNotFoundError(AreaEntity, `Parent category ${id} not exists!`);
        }
        return parent;
    }

    /**
     * 对地区进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<AreaEntity>, orderBy?: PublicOrderType) {
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
