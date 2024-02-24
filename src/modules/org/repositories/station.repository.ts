import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { StationEntity } from '../entities';

@CustomRepository(StationEntity)
export class StationRepository extends BaseRepository<StationEntity> {
    protected _qbName = 'station';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
