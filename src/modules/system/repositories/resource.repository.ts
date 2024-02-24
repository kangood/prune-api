import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { ResourceEntity } from '../entities';

@CustomRepository(ResourceEntity)
export class ResourceRepository extends BaseRepository<ResourceEntity> {
    protected _qbName = 'resource';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
