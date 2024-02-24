import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { OsscEntity } from '../entities';

@CustomRepository(OsscEntity)
export class OsscRepository extends BaseRepository<OsscEntity> {
    protected _qbName = 'ossc';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
