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

@Index('uk_code', ['code'], { unique: true })
@Entity('c_resource')
export class ResourceEntity extends BaseEntity {
    @Column('varchar', {
        name: 'code',
        nullable: true,
        unique: true,
        comment: '编码',
        length: 500,
    })
    code: string | null;

    @Column('varchar', { name: 'name', comment: '名称', length: 255 })
    name: string;

    @Column('varchar', {
        name: 'menu_id',
        nullable: true,
        comment: '菜单\n#c_menu',
        length: 20,
    })
    menuId: string | null;

    @Column('varchar', {
        name: 'describe_',
        nullable: true,
        comment: '描述',
        length: 255,
    })
    describe: string | null;

    @Column('bit', {
        name: 'readonly_',
        nullable: true,
        comment: '内置',
        default: () => "'b'1''",
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
    createTime: Date | null;

    @Column('bigint', { name: 'updated_by', nullable: true, comment: '更新人id' })
    updatedBy: number | null;

    @UpdateDateColumn({
        name: 'updated_at',
        nullable: true,
        comment: '更新时间',
    })
    updateTime: Date | null;
}
