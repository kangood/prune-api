import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { UserRoleEntity } from '../entities/user-role.entity';

@CustomRepository(UserRoleEntity)
export class UserRoleRepository extends BaseRepository<UserRoleEntity> {
    protected _qbName = 'user_role';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
