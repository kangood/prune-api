import { Injectable } from '@nestjs/common';

import { isNil, omit } from 'lodash';
import { SelectQueryBuilder, EntityNotFoundError } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { SelectTrashMode } from '@/modules/database/constants';
import { PublicOrderType } from '@/modules/system/constants';

import { QueryOrgTreeDto, CreateOrgDto, UpdateOrgDto } from '../dtos';
import { OrgEntity } from '../entities';
import { OrgRepository } from '../repositories';

/**
 * 机构数据操作
 */
@Injectable()
export class OrgService extends BaseService<OrgEntity, OrgRepository> {
    protected enableTrash = false;

    constructor(protected repository: OrgRepository) {
        super(repository);
    }

    /**
     * 查询机构树
     */
    async findTrees(options: QueryOrgTreeDto) {
        const { trashed = SelectTrashMode.NONE } = options;
        return this.repository.findTrees({
            withTrashed: trashed === SelectTrashMode.ALL || trashed === SelectTrashMode.ONLY,
            onlyTrashed: trashed === SelectTrashMode.ONLY,
        });
    }

    /**
     * 新建机构
     * @param data
     */
    async create(data: CreateOrgDto) {
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save({
            ...createParams,
            // 传入父机构
            parent: await this.getParent(undefined, data.parent),
        });
    }

    /**
     * 更新机构
     * @param data
     */
    async update(data: UpdateOrgDto) {
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
     * 获取请求传入的父机构
     * @param current 当前机构的ID
     * @param id
     */
    protected async getParent(current?: number, id?: number) {
        if (current === id) return undefined;
        let parent: OrgEntity | undefined;
        if (id !== undefined) {
            if (id === null) return null;
            parent = await this.repository.findOne({ where: { id } });
            if (!parent)
                throw new EntityNotFoundError(OrgEntity, `Parent category ${id} not exists!`);
        }
        return parent;
    }

    /**
     * 对机构进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<OrgEntity>, orderBy?: PublicOrderType) {
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
