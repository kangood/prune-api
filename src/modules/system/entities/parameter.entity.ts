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

@Index('uk_key', ['key'], { unique: true })
@Entity('c_parameter')
export class ParameterEntity extends BaseEntity {
    @Column('varchar', {
        name: 'key_',
        unique: true,
        comment: '参数键',
        length: 255,
    })
    key: string;

    @Column('varchar', { name: 'value', comment: '参数值', length: 255 })
    value: string;

    @Column('varchar', { name: 'name', comment: '参数名称', length: 255 })
    name: string;

    @Column('varchar', {
        name: 'describe_',
        nullable: true,
        comment: '描述',
        length: 255,
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
        comment: '内置',
        default: () => "'b'0''",
        transformer: new BoolBitTransformer(),
    })
    readonly: boolean | null;

    @Column('bigint', { name: 'created_by', nullable: true, comment: '创建人id' })
    createdBy: number | null;

    @Column('bigint', { name: 'updated_by', nullable: true, comment: '更新人id' })
    updatedBy: number | null;

    @CreateDateColumn({
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;

    @UpdateDateColumn({
        name: 'updated_at',
        nullable: true,
        comment: '更新时间',
    })
    updatedAt: Date | null;

    @DeleteDateColumn({ name: 'deleted_at', comment: '删除时间', nullable: true })
    deletedAt: Date | null;
}
