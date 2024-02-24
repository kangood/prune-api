import { Type } from 'class-transformer';
import {
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    Index,
    UpdateDateColumn,
} from 'typeorm';

import { BoolBitTransformer } from '@/modules/core/helpers';
import { BaseEntity } from '@/modules/database/base';

import { RoleEchoDto } from '../dtos';

@Index('uk_code', ['code'], { unique: true })
@Entity('c_role')
export class RoleEntity extends BaseEntity {
    @Type()
    roleEchoDto: RoleEchoDto;

    @Column('char', {
        name: 'category',
        nullable: true,
        comment: '角色类别;[10-功能角色 20-桌面角色 30-数据角色]',
        length: 2,
    })
    category: string | null;

    @Column('varchar', { name: 'name', comment: '名称', length: 30 })
    name: string;

    @Column('varchar', {
        name: 'code',
        nullable: true,
        unique: true,
        comment: '编码',
        length: 20,
    })
    code: string | null;

    @Column('varchar', {
        name: 'describe_',
        nullable: true,
        comment: '描述',
        length: 100,
    })
    describe: string | null;

    @Column('bit', {
        name: 'state',
        nullable: true,
        comment: '状态',
        default: () => "'b'1''",
        transformer: new BoolBitTransformer(),
    })
    state: boolean | null;

    @Column('bit', {
        name: 'readonly_',
        nullable: true,
        comment: '内置角色',
        default: () => "'b'0''",
        transformer: new BoolBitTransformer(),
    })
    readonly: boolean | null;

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
}
