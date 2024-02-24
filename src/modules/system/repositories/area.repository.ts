import { BaseTreeRepository } from '@/modules/database/base/tree.repository';
import { OrderType, TreeChildrenResolve } from '@/modules/database/constants';
import { CustomRepository } from '@/modules/database/decorators';

import { AreaEntity } from '../entities';

@CustomRepository(AreaEntity)
export class AreaRepository extends BaseTreeRepository<AreaEntity> {
    protected _qbName = 'area';

    protected orderBy = { name: 'sortValue', order: OrderType.ASC };

    protected _childrenResolve = TreeChildrenResolve.DELETE;
}
