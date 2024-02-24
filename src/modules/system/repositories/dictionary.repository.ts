import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { DictionaryEntity } from '../entities';

@CustomRepository(DictionaryEntity)
export class DictionaryRepository extends BaseRepository<DictionaryEntity> {
    protected _qbName = 'dict';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
