import { BaseTreeRepository } from '@/modules/database/base/tree.repository';
import { OrderType, TreeChildrenResolve } from '@/modules/database/constants';
import { CustomRepository } from '@/modules/database/decorators';

import { MenuEntity } from '../entities/menu.entity';

@CustomRepository(MenuEntity)
export class MenuRepository extends BaseTreeRepository<MenuEntity> {
    protected _qbName = 'org';

    protected orderBy = { name: 'sortValue', order: OrderType.ASC };

    protected _childrenResolve = TreeChildrenResolve.UP;
}
