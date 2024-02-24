import { BaseTreeRepository } from '@/modules/database/base/tree.repository';
import { OrderType, TreeChildrenResolve } from '@/modules/database/constants';
import { CustomRepository } from '@/modules/database/decorators';

import { OrgEntity } from '../entities';

@CustomRepository(OrgEntity)
export class OrgRepository extends BaseTreeRepository<OrgEntity> {
    protected _qbName = 'org';

    protected orderBy = { name: 'sortValue', order: OrderType.ASC };

    protected _childrenResolve = TreeChildrenResolve.UP;
}
