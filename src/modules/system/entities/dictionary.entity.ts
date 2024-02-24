import { Exclude, Expose } from 'class-transformer';
import {
    Column,
    CreateDateColumn,
    Entity,
    UpdateDateColumn,
    Index,
    DeleteDateColumn,
} from 'typeorm';

import { BoolBitTransformer } from '@/modules/core/helpers/utils';
import { BaseEntity } from '@/modules/database/base';

@Exclude()
@Index('uk_type_code', ['type', 'code'], { unique: true })
@Entity('c_dictionary', { schema: 'lamp_generator' })
export class DictionaryEntity extends BaseEntity {
    @Expose()
    @Column('varchar', { name: 'type', comment: '类型', length: 255 })
    type: string;

    @Expose()
    @Column('varchar', { name: 'label', comment: '类型标签', length: 255 })
    label: string;

    @Expose()
    @Column('varchar', { name: 'code', comment: '编码', length: 64 })
    code: string;

    @Expose()
    @Column('varchar', { name: 'name', comment: '名称', length: 64 })
    name: string;

    @Expose()
    @Column('bit', {
        name: 'state',
        nullable: true,
        comment: '状态',
        default: () => "'b'1''",
        transformer: new BoolBitTransformer(),
    })
    state: boolean | null;

    @Expose()
    @Column('varchar', {
        name: 'describe_',
        nullable: true,
        comment: '描述',
        length: 255,
    })
    describe: string | null;

    @Expose({ groups: ['dict-list'] })
    @Column('int', {
        name: 'sort_value',
        nullable: true,
        comment: '排序',
        default: () => "'1'",
    })
    sortValue: number | null;

    @Expose()
    @Column('varchar', {
        name: 'icon',
        nullable: true,
        comment: '图标',
        length: 255,
    })
    icon: string | null;

    @Expose()
    @Column('varchar', {
        name: 'css_style',
        nullable: true,
        comment: 'css样式',
        length: 255,
    })
    cssStyle: string | null;

    @Expose()
    @Column('varchar', {
        name: 'css_class',
        nullable: true,
        comment: 'css class',
        length: 255,
    })
    cssClass: string | null;

    @Expose()
    @Column('bit', {
        name: 'readonly_',
        nullable: true,
        comment: '内置',
        default: () => "'b'0''",
        transformer: new BoolBitTransformer(),
    })
    readonly: boolean | null;

    @Expose()
    @Column('bigint', { name: 'created_by', nullable: true, comment: '创建人id' })
    createdBy: number | null;

    @Expose()
    @Column('bigint', { name: 'updated_by', nullable: true, comment: '更新人id' })
    updatedBy: number | null;

    @Expose()
    @CreateDateColumn({
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;

    @Expose()
    @UpdateDateColumn({
        name: 'updated_at',
        nullable: true,
        comment: '更新时间',
    })
    updatedAt: Date | null;

    @Expose()
    @DeleteDateColumn({ name: 'deleted_at', comment: '删除时间', nullable: true })
    deletedAt: Date | null;
}
