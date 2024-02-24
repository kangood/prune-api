import { Entity } from 'typeorm';

import { BaseEntity } from '@/modules/database/base';

import { RoleEntity } from './role.entity';

@Entity('c_user_role')
export class UserRoleRelationEntity extends BaseEntity {
    role: RoleEntity;
}
