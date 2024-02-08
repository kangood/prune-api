import { Type } from 'class-transformer';
import {
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    Index,
    UpdateDateColumn,
} from 'typeorm';

import { BoolBitTransformer } from '@/modules/core/helpers/utils';
import { BaseEntity } from '@/modules/database/base';
import { UserEchoDto } from '@/modules/org/dtos';
import { OrgEntity } from '@/modules/org/entities/org.entity';
import { StationEntity } from '@/modules/org/entities/station.entity';

import { RoleEntity } from './role.entity';
import { UserRoleEntity } from './user-role.entity';

@Index('uk_account', ['account'], { unique: true })
@Entity('c_user', { schema: 'lamp_generator' })
export class UserEntity extends BaseEntity {
    @Type()
    orgMap: OrgEntity;

    @Type()
    stationMap: StationEntity;

    @Type()
    userEchoDto: UserEchoDto;

    @Type()
    userRoles: UserRoleEntity[];

    @Type()
    roles: RoleEntity[];

    @Type()
    permissions: any;

    @Column('varchar', {
        name: 'account',
        unique: true,
        comment: '账号',
        length: 30,
    })
    account: string;

    @Column('varchar', { name: 'name', comment: '姓名', length: 50 })
    name: string;

    @Column('varchar', { name: 'org_id', nullable: true, comment: '机构', length: 20 })
    orgId: string | null;

    @Column('varchar', { name: 'station_id', nullable: true, comment: '岗位', length: 20 })
    stationId: string | null;

    @Column('bit', {
        name: 'readonly',
        comment: '内置',
        default: () => "'b'0''",
        transformer: new BoolBitTransformer(),
    })
    readonly: boolean;

    @Column('varchar', {
        name: 'email',
        nullable: true,
        comment: '邮箱',
        length: 255,
    })
    email: string | null;

    @Column('varchar', {
        name: 'mobile',
        nullable: true,
        comment: '手机',
        length: 20,
    })
    mobile: string | null;

    @Column('varchar', {
        name: 'sex',
        nullable: true,
        comment: '性别 \n#Sex{W:女;M:男;N:未知}',
        length: 1,
        default: () => "'M'",
    })
    sex: string | null;

    @Column('bit', {
        name: 'state',
        nullable: true,
        comment: '状态',
        default: () => "'b'1''",
        transformer: new BoolBitTransformer(),
    })
    state: boolean | null;

    @Column('varchar', {
        name: 'avatar',
        nullable: true,
        comment: '头像',
        length: 255,
    })
    avatar: string | null;

    @Column('char', {
        name: 'nation',
        nullable: true,
        comment: '民族: dictType = NATION',
        length: 2,
    })
    nation: string | null;

    @Column('char', {
        name: 'education',
        nullable: true,
        comment: '学历: dictType = EDUCATION',
        length: 2,
    })
    education: string | null;

    @Column('char', {
        name: 'position_status',
        nullable: true,
        comment: '职位状态: dictType = POSITION_STATUS',
        length: 2,
    })
    positionStatus: string | null;

    @Column('varchar', {
        name: 'work_describe',
        nullable: true,
        comment: '工作描述',
        length: 255,
    })
    workDescribe: string | null;

    @Column('datetime', {
        name: 'password_error_last_time',
        nullable: true,
        comment: '最后一次输错密码时间',
    })
    passwordErrorLastTime: Date | null;

    @Column('int', {
        name: 'password_error_num',
        nullable: true,
        comment: '密码错误次数',
        default: () => "'0'",
    })
    passwordErrorNum: number | null;

    @Column('datetime', {
        name: 'password_expire_time',
        nullable: true,
        comment: '密码过期时间',
    })
    passwordExpireTime: Date | null;

    @Column('varchar', { name: 'password', comment: '密码', length: 64 })
    password: string;

    @Column('varchar', { name: 'salt', comment: '密码盐', length: 20 })
    salt: string;

    @Column('datetime', {
        name: 'last_login_time',
        nullable: true,
        comment: '最后登录时间',
    })
    lastLoginTime: Date | null;

    @DeleteDateColumn({
        name: 'deleted_at',
        nullable: true,
        comment: '删除时间',
    })
    deletedAt: Date | null;

    @Column('bigint', { name: 'created_by', nullable: true, comment: '创建人id' })
    createdBy: number | null;

    @CreateDateColumn({
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;

    @Column('bigint', { name: 'updated_by', nullable: true, comment: '更新人id' })
    updatedBy: number | null;

    @UpdateDateColumn({
        name: 'updated_at',
        nullable: true,
        comment: '更新时间',
    })
    updatedAt: Date | null;

    @Column('bigint', {
        name: 'created_org_id',
        nullable: true,
        comment: '创建者所属机构',
    })
    createdOrgId: number | null;
}
