import { Injectable } from '@nestjs/common';

import { isEmpty, isNil } from 'lodash';
import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { PublicOrderType } from '@/modules/system/constants';

import { CreateUserRoleDto, QueryUserRoleDto } from '../dtos';
import { UserRoleEntity } from '../entities';
import { UserRoleRepository } from '../repositories';

/**
 * 用户角色关联数据操作
 */
@Injectable()
export class UserRoleService extends BaseService<UserRoleEntity, UserRoleRepository> {
    protected enableTrash = false;

    constructor(protected repository: UserRoleRepository) {
        super(repository);
    }

    /**
     * 删除并新建
     */
    async saveListAfterDelete(data: CreateUserRoleDto) {
        // 先删除角色数据
        if (!isNil(data.roleId)) {
            await this.repository.delete({ roleId: data.roleId });
        }
        // 再处理成插入的对象集合
        const saveList: UserRoleEntity[] = [];
        if (!isEmpty(data.userIdList)) {
            for (const userId of data.userIdList) {
                data.userId = userId;
                saveList.push(await super.create(data));
            }
        }
        // 执行插入
        return this.repository.save(saveList);
    }

    /**
     * 根据角色ID查询用户角色关联
     */
    async listUserRoleByRoleId(options: QueryUserRoleDto): Promise<UserRoleEntity[]> {
        const qb = await super.buildListQB(this.repository.buildBaseQB(), options);
        if (!isEmpty(options.roleId)) {
            qb.where(`${this.repository.qbName}.role_id = ${options.roleId}`);
        }
        return qb.getMany();
    }

    /**
     * 对机构进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<UserRoleEntity>, orderBy?: PublicOrderType) {
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
