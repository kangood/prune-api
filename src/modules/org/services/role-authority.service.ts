import { Injectable } from '@nestjs/common';

import { isEmpty, isNil } from 'lodash';
import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { QueryHook } from '@/modules/database/types';
import { PublicOrderType } from '@/modules/system/constants';

import { ResourceEntity } from '@/modules/system/entities';

import { AUTHORITY_TYPE_MENU, AUTHORITY_TYPE_RESOURCE } from '../constants';
import { CreateRoleAuthorityDto, QueryRoleAuthorityDto } from '../dtos/role-authority.dto';
import { RoleAuthorityEntity } from '../entities';
import { RoleAuthorityRepository } from '../repositories';

/**
 * 角色授权数据操作
 */
@Injectable()
export class RoleAuthorityService extends BaseService<
    RoleAuthorityEntity,
    RoleAuthorityRepository
> {
    constructor(protected repository: RoleAuthorityRepository) {
        super(repository);
    }

    /**
     * 新建
     */
    async create(data: CreateRoleAuthorityDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 保存角色授权数据，删除再批量插入
     */
    async saveBatchRoleAutority(data: CreateRoleAuthorityDto) {
        // 先删除角色授权数据
        if (!isNil(data.roleId)) {
            await this.repository.delete({ roleId: data.roleId });
        }
        // 再处理成插入的对象集合
        const saveList: RoleAuthorityEntity[] = [];
        if (!isEmpty(data.menuIdList)) {
            for (const menuId of data.menuIdList) {
                data.authorityId = menuId;
                data.authorityType = AUTHORITY_TYPE_MENU;
                saveList.push(await super.create(data));
            }
        }
        if (!isEmpty(data.resourceIdList)) {
            for (const resourceId of data.resourceIdList) {
                data.authorityId = resourceId;
                data.authorityType = AUTHORITY_TYPE_RESOURCE;
                saveList.push(await super.create(data));
            }
        }
        // 执行插入
        return this.repository.save(saveList);
    }

    /**
     * 根据角色ID查询角色授权ID集合
     */
    async listRoleAuthorityIdByRoleId(
        options?: QueryRoleAuthorityDto,
        callback?: QueryHook<RoleAuthorityEntity>,
    ) {
        // 调用重写的qb处理方法
        const qb = await this.buildListQB(this.repository.buildBaseQB(), options, callback);
        const originList = await qb.getMany();
        // const idList = originList.map((item) => item.authorityId);
        // 过滤菜单、资源集合并返回ID
        const menuIdList = originList
            .filter((item) => item.authorityType === AUTHORITY_TYPE_MENU)
            .map((item) => item.authorityId);
        const resourceIdList = originList
            .filter((item) => item.authorityType === AUTHORITY_TYPE_RESOURCE)
            .map((item) => item.authorityId);
        return { menuIdList, resourceIdList };
    }

    /**
     * 根据角色ID查询角色授权数据集合
     */
    async listRoleAuthorityByRoleIds(
        options?: QueryRoleAuthorityDto,
        callback?: QueryHook<RoleAuthorityEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(this.repository.buildBaseQB(), options, callback);
        // 子类自我实现
        const { roleIds, authorityType } = options;
        // queryName=role_authority
        const queryName = this.repository.qbName;
        // 参数的where判断
        qb.where(`${queryName}.authority_type = '${authorityType}'`);
        if (!isEmpty(roleIds)) {
            qb.andWhere(`${queryName}.role_id in (${roleIds})`);
            qb.leftJoinAndMapOne(
                `${queryName}.resource`,
                ResourceEntity,
                'resource',
                `${queryName}.authority_id=resource.id`,
            );
        }
        return qb.getMany();
    }

    /**
     * 构建列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<RoleAuthorityEntity>,
        options: QueryRoleAuthorityDto,
        callback?: QueryHook<RoleAuthorityEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, roleId } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(roleId)) {
            qb.andWhere(`${queryName}.role_id = ${roleId}`);
        }
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(
        qb: SelectQueryBuilder<RoleAuthorityEntity>,
        orderBy?: PublicOrderType,
    ) {
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
