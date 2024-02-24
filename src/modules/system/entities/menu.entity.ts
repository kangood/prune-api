import { Type } from 'class-transformer';
import { Column, DeleteDateColumn, Entity, Index, Tree, TreeChildren, TreeParent } from 'typeorm';

import { BoolBitTransformer } from '@/modules/core/helpers';
import { BaseEntity } from '@/modules/database/base';

@Tree('materialized-path')
@Index('uk_path', ['path'], { unique: true })
@Entity('c_menu', { schema: 'lamp_nestjs' })
export class MenuEntity extends BaseEntity {
    @Type(() => MenuEntity)
    @TreeParent({ onDelete: 'CASCADE' })
    parent: MenuEntity | null;

    @Type(() => MenuEntity)
    @TreeChildren({ cascade: true })
    children: MenuEntity[];

    depth = 0;

    @Column('varchar', { name: 'label', comment: '名称', length: 20 })
    label: string;

    @Column('char', {
        name: 'resource_type',
        nullable: true,
        comment:
            '[20-菜单 60-数据];\n@Echo(api = DICTIONARY_ITEM_FEIGN_CLASS,dictType = EchoDictType.RESOURCE_TYPE)',
        length: 2,
    })
    resourceType: string | null;

    @Column('int', { name: 'tree_grade', nullable: true, comment: '树层级' })
    treeGrade: number | null;

    @Column('varchar', {
        name: 'tree_path',
        nullable: true,
        comment: '树路径',
        length: 512,
    })
    treePath: string | null;

    @Column('varchar', {
        name: 'describe_',
        nullable: true,
        comment: '描述',
        length: 200,
    })
    describe: string | null;

    @Column('bit', {
        name: 'is_general',
        nullable: true,
        comment: '通用菜单 \nTrue表示无需分配所有人就可以访问的',
        default: () => "'b'0''",
        transformer: new BoolBitTransformer(),
    })
    isGeneral: boolean | null;

    @Column('varchar', {
        name: 'path',
        nullable: true,
        unique: true,
        comment: '路径',
        length: 255,
    })
    path: string | null;

    @Column('varchar', {
        name: 'component',
        nullable: true,
        comment: '组件',
        length: 255,
    })
    component: string | null;

    @Column('bit', {
        name: 'state',
        nullable: true,
        comment: '状态',
        default: () => "'b'1''",
        transformer: new BoolBitTransformer(),
    })
    state: boolean | null;

    @Column('int', {
        name: 'sort_value',
        nullable: true,
        comment: '排序',
        default: () => "'1'",
    })
    sortValue: number | null;

    @Column('varchar', {
        name: 'icon',
        nullable: true,
        comment: '菜单图标',
        length: 255,
    })
    icon: string | null;

    @Column('varchar', {
        name: 'group_',
        nullable: true,
        comment: '分组',
        length: 20,
    })
    group: string | null;

    @Column('char', {
        name: 'data_scope',
        nullable: true,
        comment:
            '数据范围;[01-全部 02-本单位及子级 03-本单位 04-本部门 05-本部门及子级 06-个人 07-自定义]',
        length: 2,
    })
    dataScope: string | null;

    @Column('varchar', {
        name: 'custom_class',
        nullable: true,
        comment: '实现类',
        length: 255,
    })
    customClass: string | null;

    @Column('bit', {
        name: 'is_def',
        nullable: true,
        comment: '是否默认',
        default: () => "'b'0''",
        transformer: new BoolBitTransformer(),
    })
    isDef: boolean | null;

    @Column('bigint', {
        name: 'parentId',
        nullable: true,
        comment: '父级菜单ID',
    })
    parentId: number | null;

    @Column('bit', {
        name: 'readonly_',
        nullable: true,
        comment: '内置',
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

    @Column('datetime', {
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;

    @Column('bigint', { name: 'updated_by', nullable: true, comment: '更新人id' })
    updatedBy: number | null;

    @Column('datetime', {
        name: 'updated_at',
        nullable: true,
        comment: '更新时间',
    })
    updatedAt: Date | null;
}
