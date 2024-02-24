import { Type } from 'class-transformer';
import { Column, CreateDateColumn, Entity, Index } from 'typeorm';

import { BaseEntity } from '@/modules/database/base';
import { ResourceEntity } from '@/modules/system/entities';

@Index('uk_role_authority', ['authorityId', 'authorityType', 'roleId'], {
    unique: true,
})
@Entity('c_role_authority')
export class RoleAuthorityEntity extends BaseEntity {
    @Type()
    resource: ResourceEntity;

    @Column('varchar', {
        name: 'authority_id',
        comment: '资源id \n#c_resource #c_menu',
        length: 20,
    })
    authorityId: string;

    @Column('varchar', {
        name: 'authority_type',
        comment: '权限类型 \n#AuthorizeType{MENU:菜单;RESOURCE:资源;}',
        length: 10,
    })
    authorityType: string;

    @Column('varchar', { name: 'role_id', comment: '角色id \n#c_role', length: 20 })
    roleId: string;

    @CreateDateColumn({
        name: 'created_at',
        nullable: true,
        comment: '创建时间',
    })
    createdAt: Date | null;

    @Column('bigint', { name: 'created_by', nullable: true, comment: '创建人' })
    createdBy: number | null;
}
