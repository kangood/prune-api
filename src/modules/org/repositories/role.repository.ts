import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { RoleEntity } from '../entities';

@CustomRepository(RoleEntity)
export class RoleRepository extends BaseRepository<RoleEntity> {
    protected _qbName = 'role';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
