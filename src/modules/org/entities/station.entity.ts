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
import { OrgEntity } from '@/modules/org/entities/org.entity';

@Index('uk_name', ['name'], { unique: true })
@Entity('c_station')
export class StationEntity extends BaseEntity {
    @Column('varchar', {
        name: 'name',
        unique: true,
        comment: '名称',
        length: 255,
    })
    name: string;

    @Column('varchar', {
        name: 'org_id',
        nullable: true,
        comment: '机构',
        length: 20,
    })
    orgId: string | null;

    @Type()
    orgMap: OrgEntity;

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

    @Column('bigint', {
        name: 'created_org_id',
        nullable: true,
        comment: '创建者所属机构',
    })
    createdOrgId: number | null;
}
