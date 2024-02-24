import {
    Injectable,
    CanActivate,
    ExecutionContext,
    Inject,
    ForbiddenException,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Request } from 'express';

import { AUTHORITY_TYPE_RESOURCE } from '../org/constants';
import { RoleAuthorityService } from '../org/services';

@Injectable()
export class AuthorityGuard implements CanActivate {
    @Inject(RoleAuthorityService)
    private roleAuthorityService: RoleAuthorityService;

    @Inject(Reflector)
    private reflector: Reflector;

    async canActivate(context: ExecutionContext): Promise<boolean> {
        const request: Request = context.switchToHttp().getRequest();
        if (!request.user) {
            return true;
        }
        // 查询访问API注解上的资源编码
        const requiredResources = this.reflector.getAllAndOverride<string[]>('require-resource', [
            context.getClass(),
            context.getHandler(),
        ]);
        if (!requiredResources) {
            return true;
        }
        // 查询用户的角色对应的资源
        const roleAuthorities = await this.roleAuthorityService.listRoleAuthorityByRoleIds({
            roleIds: request.user.userRoles.map((item) => item.role.id),
            authorityType: AUTHORITY_TYPE_RESOURCE,
            page: 1,
            limit: 10000,
        });
        const resources = roleAuthorities.map((item) => item.resource);
        if (!resources) {
            throw new ForbiddenException('您没有访问该接口的权限');
        }
        // 循环对比是否对应
        for (const curResource of requiredResources) {
            const found = resources.find((item) => item.code.includes(curResource));
            if (!found) {
                throw new ForbiddenException('您没有访问该接口的权限');
            }
        }
        return true;
    }
}
