import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { RoleAuthorityEntity } from '../entities/role-authority.entity';

@CustomRepository(RoleAuthorityEntity)
export class RoleAuthorityRepository extends BaseRepository<RoleAuthorityEntity> {
    protected _qbName = 'role_authority';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
