import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { OssEntity } from '../entities';

@CustomRepository(OssEntity)
export class OssRepository extends BaseRepository<OssEntity> {
    protected _qbName = 'oss';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
