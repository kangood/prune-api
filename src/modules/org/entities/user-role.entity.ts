import { Type } from 'class-transformer';
import { Column, CreateDateColumn, DeleteDateColumn, Entity, Index } from 'typeorm';

import { BaseEntity } from '@/modules/database/base';

import { RoleEntity } from './role.entity';

@Index('uk_user_role', ['roleId', 'userId'], { unique: true })
@Entity('c_user_role')
export class UserRoleEntity extends BaseEntity {
    @Type()
    role: RoleEntity;

    @Column('varchar', { name: 'role_id', comment: '角色\n#c_role', length: 20 })
    roleId: string;

    @Column('varchar', { name: 'user_id', comment: '用户\n#c_user', length: 20 })
    userId: string;

    @DeleteDateColumn({
        name: 'deleted_at',
        nullable: true,
        comment: '删除时间',
    })
    deletedAt: Date | null;

    @Column('bigint', { name: 'created_by', nullable: true, comment: '创建人ID' })
    createdBy: number | null;

    @CreateDateColumn({
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;
}
