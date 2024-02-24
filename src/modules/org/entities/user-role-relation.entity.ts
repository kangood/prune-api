import { Entity } from 'typeorm';

import { BaseEntity } from '@/modules/database/base';

import { RoleEntity } from './role.entity';

@Entity('c_user_role', { schema: 'lamp_nestjs' })
export class UserRoleRelationEntity extends BaseEntity {
    role: RoleEntity;
}
