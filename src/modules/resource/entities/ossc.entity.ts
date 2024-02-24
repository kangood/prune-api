import { Type } from 'class-transformer';
import { Column, CreateDateColumn, DeleteDateColumn, Entity, UpdateDateColumn } from 'typeorm';

import { BoolBitTransformer } from '@/modules/core/helpers/utils';
import { BaseEntity } from '@/modules/database/base';

import { OsscEchoDto } from '../dtos';

@Entity('c_ossc', { schema: 'lamp' })
export class OsscEntity extends BaseEntity {
    @Type()
    osscEchoDto: OsscEchoDto;

    @Column('varchar', {
        name: 'code',
        nullable: true,
        comment: '资源编码',
        length: 32,
    })
    code: string | null;

    @Column('varchar', { name: 'category', nullable: true, comment: '种类', length: 2 })
    category: string | null;

    @Column('varchar', { name: 'bucket_name', nullable: true, comment: '空间名', length: 64 })
    bucketName: string | null;

    @Column('varchar', {
        name: 'access_key',
        nullable: true,
        comment: 'ak',
        length: 128,
    })
    accessKey: string | null;

    @Column('varchar', {
        name: 'secret_key',
        nullable: true,
        comment: 'sk',
        length: 255,
    })
    secretKey: string | null;

    @Column('varchar', {
        name: 'endpoint',
        nullable: true,
        comment: '资源地址',
        length: 128,
    })
    endpoint: string | null;

    @Column('varchar', {
        name: 'describe',
        nullable: true,
        comment: '描述',
        length: 128,
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
