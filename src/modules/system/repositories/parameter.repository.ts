import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { ParameterEntity } from '../entities';

@CustomRepository(ParameterEntity)
export class ParameterRepository extends BaseRepository<ParameterEntity> {
    protected _qbName = 'param';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
