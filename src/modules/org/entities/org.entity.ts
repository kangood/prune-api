import { Type } from 'class-transformer';
import {
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    Index,
    Tree,
    TreeChildren,
    TreeParent,
    UpdateDateColumn,
} from 'typeorm';

import { BoolBitTransformer } from '@/modules/core/helpers/utils';
import { BaseEntity } from '@/modules/database/base';

@Tree('materialized-path')
@Index('uk_name', ['label'], { unique: true })
@Index('fu_path', ['mpath'], { fulltext: true })
@Entity('c_org', { schema: 'lamp_generator' })
export class OrgEntity extends BaseEntity {
    @Type(() => OrgEntity)
    @TreeParent({ onDelete: 'CASCADE' })
    parent: OrgEntity | null;

    @Type(() => OrgEntity)
    @TreeChildren({ cascade: true })
    children: OrgEntity[];

    depth = 0;

    @Column('varchar', {
        name: 'label',
        unique: true,
        comment: '名称',
        length: 255,
    })
    label: string;

    @Column('char', {
        name: 'type_',
        nullable: true,
        comment: '类型: dictType = ORG_TYPE',
        length: 2,
    })
    type: string | null;

    @Column('varchar', {
        name: 'abbreviation',
        nullable: true,
        comment: '简称',
        length: 255,
    })
    abbreviation: string | null;

    @Column('bigint', {
        name: 'parentId',
        nullable: true,
        comment: '父ID',
    })
    parentId: number | null;

    @Column('int', {
        name: 'sort_value',
        nullable: true,
        comment: '排序',
        default: () => "'1'",
    })
    sortValue: number | null;

    @Column('bit', {
        name: 'state',
        nullable: true,
        comment: '状态',
        default: () => "'b'1''",
        transformer: new BoolBitTransformer(),
    })
    state: boolean | null;

    @Column('varchar', {
        name: 'describe_',
        nullable: true,
        comment: '描述',
        length: 255,
    })
    describe: string | null;

    @DeleteDateColumn({
        name: 'deleted_at',
        nullable: true,
        comment: '删除时间',
    })
    deletedAt: Date | null;

    @CreateDateColumn({
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;

    @Column('bigint', {
        name: 'created_by',
        nullable: true,
        comment: '创建人',
    })
    createdBy: number | null;

    @UpdateDateColumn({
        name: 'updated_at',
        nullable: true,
        comment: '修改时间',
    })
    updatedAt: Date | null;

    @Column('bigint', {
        name: 'updated_by',
        nullable: true,
        comment: '修改人',
    })
    updatedBy: number | null;
}
