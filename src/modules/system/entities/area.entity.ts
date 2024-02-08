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
@Index('uk_code', ['code'], { unique: true })
@Entity('c_area', { schema: 'lamp_generator' })
export class AreaEntity extends BaseEntity {
    @Type(() => AreaEntity)
    @TreeParent({ onDelete: 'CASCADE' })
    parent: AreaEntity | null;

    @Type(() => AreaEntity)
    @TreeChildren({ cascade: true })
    children: AreaEntity[];

    depth = 0;

    @Column('varchar', {
        name: 'code',
        unique: true,
        comment: '编码',
        length: 64,
    })
    code: string;

    @Column('varchar', { name: 'label', comment: '名称', length: 255 })
    label: string;

    @Column('varchar', {
        name: 'full_name',
        nullable: true,
        comment: '全名',
        length: 255,
    })
    fullName: string | null;

    @Column('int', {
        name: 'sort_value',
        nullable: true,
        comment: '排序',
        default: () => "'1'",
    })
    sortValue: number | null;

    @Column('varchar', {
        name: 'longitude',
        nullable: true,
        comment: '经度',
        length: 255,
    })
    longitude: string | null;

    @Column('varchar', {
        name: 'latitude',
        nullable: true,
        comment: '维度',
        length: 255,
    })
    latitude: string | null;

    @Column('varchar', {
        name: 'level_',
        nullable: true,
        comment: '行政区级: dictType = AREA_LEVEL',
        length: 10,
    })
    level: string | null;

    @Column('varchar', {
        name: 'source_',
        nullable: true,
        comment: '数据来源',
        length: 255,
    })
    source: string | null;

    @Column('bit', {
        name: 'state',
        nullable: true,
        comment: '状态',
        default: () => "'b'0''",
        transformer: new BoolBitTransformer(),
    })
    state: boolean | null;

    @Column('varchar', {
        name: 'parentId',
        nullable: true,
        comment: '父ID',
        length: 20,
    })
    parentId: string | null;

    @DeleteDateColumn({
        name: 'deleted_at',
        nullable: true,
        comment: '删除时间',
    })
    deletedAt: Date | null;

    @Column('bigint', { name: 'created_by', nullable: true, comment: '创建人' })
    createdBy: number | null;

    @CreateDateColumn({
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;

    @Column('bigint', { name: 'updated_by', nullable: true, comment: '更新人' })
    updatedBy: number | null;

    @UpdateDateColumn({
        name: 'updated_at',
        nullable: true,
        comment: '更新时间',
    })
    updatedAt: Date | null;
}
