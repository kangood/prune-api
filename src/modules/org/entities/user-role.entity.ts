import { Type } from 'class-transformer';
import { Column, CreateDateColumn, DeleteDateColumn, Entity, Index } from 'typeorm';

import { BaseEntity } from '@/modules/database/base';

import { RoleEntity } from './role.entity';

@Index('uk_user_role', ['roleId', 'userId'], { unique: true })
@Entity('c_user_role', { schema: 'lamp_nestjs' })
export class UserRoleEntity extends BaseEntity {
    @Type()
    role: RoleEntity;

    @Column('bigint', { name: 'role_id', comment: '角色\n#c_role' })
    roleId: number;

    @Column('bigint', { name: 'user_id', comment: '用户\n#c_user' })
    userId: number;

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
