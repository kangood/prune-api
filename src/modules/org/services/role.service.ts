import { Injectable } from '@nestjs/common';

import { isEmpty, isNil, omit } from 'lodash';
import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { paginate } from '@/modules/database/helpers';
import { PaginateReturn, QueryHook } from '@/modules/database/types';
import { DictionaryType, PublicOrderType } from '@/modules/system/constants';

import { QueryDictionaryDto } from '@/modules/system/dtos';

import { DictionaryService } from '@/modules/system/services';

import { CreateRoleDto, QueryRoleDto, RoleEchoDto, UpdateRoleDto } from '../dtos';
import { RoleEntity } from '../entities';
import { RoleRepository } from '../repositories';

/**
 * 角色数据操作
 */
@Injectable()
export class RoleService extends BaseService<RoleEntity, RoleRepository> {
    protected enableTrash = true;

    constructor(
        protected repository: RoleRepository,
        protected dictionaryService: DictionaryService,
    ) {
        super(repository);
    }

    /**
     * 新建
     * @param data
     */
    async create(data: CreateRoleDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新
     * @param data
     */
    async update(data: UpdateRoleDto) {
        await this.repository.update(data.id, omit(data, ['id', 'code']));
        return this.detail(data.id);
    }

    /**
     * 调用关联查询并分页
     */
    async listRelate(
        options?: QueryRoleDto,
        callback?: QueryHook<RoleEntity>,
    ): Promise<PaginateReturn<RoleEntity>> {
        // 调用重写的qb处理方法
        const qb = await this.buildListQB(this.repository.buildBaseQB(), options, callback);
        // 调用分页函数，得到返回的数据
        const roleEntityPaginateReturn = await paginate(qb, options);
        const { items } = roleEntityPaginateReturn;
        // 查询字典列表按类型筛选
        const queryDictionaryDto = new QueryDictionaryDto();
        queryDictionaryDto.type = `('${DictionaryType.ROLE_CATEGORY}')`;
        queryDictionaryDto.trashed = options.trashed;
        const dictionaryEntities = await this.dictionaryService.listWhereType(queryDictionaryDto);
        // 查询完之后挨个参数替换翻译
        for (const item of items) {
            item.roleEchoDto = new RoleEchoDto();
            for (const dictionaryEntity of dictionaryEntities) {
                // 翻译角色种类
                if (dictionaryEntity.type === DictionaryType.ROLE_CATEGORY) {
                    if (dictionaryEntity.code === item.category) {
                        item.roleEchoDto.category = dictionaryEntity.name;
                    }
                }
            }
        }
        return roleEntityPaginateReturn;
    }

    /**
     * 构建列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<RoleEntity>,
        options: QueryRoleDto,
        callback?: QueryHook<RoleEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, name, code, timeRange } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(name)) {
            qb.andWhere(`${queryName}.name like '%${name}%'`);
        }
        if (!isEmpty(code)) {
            qb.andWhere(`${queryName}.code like '%${code}%'`);
        }
        if (!isNil(timeRange)) {
            qb.andWhere(`${queryName}.created_at between ${timeRange[0]} and ${timeRange[1]}`);
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
    protected addOrderByQuery(qb: SelectQueryBuilder<RoleEntity>, orderBy?: PublicOrderType) {
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
