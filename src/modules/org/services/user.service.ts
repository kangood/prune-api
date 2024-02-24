import { Injectable } from '@nestjs/common';
import { isEmpty, isNil, omit } from 'lodash';

import md5 from 'md5';
import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { paginate } from '@/modules/database/helpers';
import { PaginateReturn, QueryHook } from '@/modules/database/types';
import { DictionaryType, PublicOrderType } from '@/modules/system/constants';

import { QueryDictionaryDto } from '@/modules/system/dtos';
import { DictionaryService } from '@/modules/system/services';

import { CreateUserDto, QueryUserDto, UpdateUserDto, UserEchoDto } from '../dtos';
import { OrgEntity, RoleEntity, StationEntity, UserEntity } from '../entities';
import { UserRoleRelationEntity } from '../entities/user-role-relation.entity';
import { UserRepository } from '../repositories';

// 用户查询接口
type FindParams = {
    [key in keyof Omit<QueryUserDto, 'limit' | 'page'>]: QueryUserDto[key];
};

/**
 * 用户数据操作
 */
@Injectable()
export class UserService extends BaseService<UserEntity, UserRepository, FindParams> {
    constructor(
        protected repository: UserRepository,
        protected dictionaryService: DictionaryService,
    ) {
        super(repository);
    }

    /**
     * 新建用户
     * @param data
     */
    async create(data: CreateUserDto) {
        // 处理密码
        data.password = md5(data.password);
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新用户
     * @param data
     */
    async update(data: UpdateUserDto) {
        if (data.password) {
            data.password = md5(data.password);
        }
        await this.repository.update(data.id, omit(data, ['id', 'confirmPassword']));
        return this.detail(data.id);
    }

    /**
     * 调用关联角色查询并分页
     */
    async getUserAndRoles(options?: QueryUserDto) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(this.repository.buildBaseQB(), options);
        // 子类自我实现
        const { account } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(account)) {
            qb.andWhere(`${queryName}.account = '${account}'`);
        }
        // 关联角色查询
        qb.leftJoinAndMapMany(
            `user.userRoles`,
            UserRoleRelationEntity,
            'user_role',
            'user_role.user_id=user.id',
        ).leftJoinAndMapOne(`user_role.role`, RoleEntity, 'role', 'user_role.role_id=role.id');
        return qb.getMany();
    }

    /**
     * 调用关联查询并分页
     */
    async listRelate(
        options?: QueryUserDto,
        callback?: QueryHook<UserEntity>,
    ): Promise<PaginateReturn<UserEntity>> {
        // 加入关联[机构、岗位]查询
        const qb = await this.buildListRelateQB(this.repository.buildBaseQB(), options, callback);
        // 调用分页函数，得到返回的数据
        const userEntityPaginateReturn = await paginate(qb, options);
        const { items } = userEntityPaginateReturn;
        // 查询字典列表按类型筛选
        const queryDictionaryDto = new QueryDictionaryDto();
        queryDictionaryDto.type = `('${DictionaryType.NATION}','${DictionaryType.EDUCATION}','${DictionaryType.POSITION_STATUS}')`;
        queryDictionaryDto.trashed = options.trashed;
        const dictionaryEntities = await this.dictionaryService.listWhereType(queryDictionaryDto);
        // 查询完之后挨个参数替换翻译
        for (const item of items) {
            item.userEchoDto = new UserEchoDto();
            for (const dictionaryEntity of dictionaryEntities) {
                // 翻译民族
                if (dictionaryEntity.type === DictionaryType.NATION) {
                    if (dictionaryEntity.code === item.nation) {
                        item.userEchoDto.nation = dictionaryEntity.name;
                    }
                }
                // 翻译学历
                if (dictionaryEntity.type === DictionaryType.EDUCATION) {
                    if (dictionaryEntity.code === item.education) {
                        item.userEchoDto.education = dictionaryEntity.name;
                    }
                }
                // 翻译职位状态
                if (dictionaryEntity.type === DictionaryType.POSITION_STATUS) {
                    if (dictionaryEntity.code === item.positionStatus) {
                        item.userEchoDto.positionStatus = dictionaryEntity.name;
                    }
                }
            }
        }
        return userEntityPaginateReturn;
    }

    /**
     * 加入关联机构、岗位查询
     */
    protected async buildListRelateQB(
        queryBuilder: SelectQueryBuilder<UserEntity>,
        options: FindParams,
        callback?: QueryHook<UserEntity>,
    ) {
        // 调用buildListQB组装条件查询，再此基础上加入对org、station的关联
        return (await this.buildListQB(queryBuilder, options, callback))
            .leftJoinAndMapOne(`user.orgMap`, OrgEntity, 'org', 'user.org_id=org.id')
            .leftJoinAndMapOne(
                `user.stationMap`,
                StationEntity,
                'station',
                'user.station_id=station.id',
            );
    }

    /**
     * 构建岗位列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<UserEntity>,
        options: FindParams,
        callback?: QueryHook<UserEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, account, nation, orgId, timeRange } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(account)) {
            qb.andWhere(`${queryName}.account like '%${account}%'`);
        }
        if (!isNil(nation)) {
            qb.andWhere(`${queryName}.nation between ${nation[0]} and ${nation[1]}`);
        }
        if (!isEmpty(orgId)) {
            qb.andWhere({ orgId });
        }
        if (!isNil(timeRange)) {
            qb.andWhere(`${queryName}.created_at between ${timeRange[0]} and ${timeRange[1]}`);
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
    protected addOrderByQuery(qb: SelectQueryBuilder<UserEntity>, orderBy?: PublicOrderType) {
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
