import { PartialType } from '@nestjs/swagger';
import { IsDefined, IsEnum, IsNotEmpty, IsNumberString, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

/**
 * 分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryUserRoleDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    roleId?: string;
}

/**
 * 创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateUserRoleDto {
    @IsOptional()
    id?: string;

    @IsNotEmpty({ groups: ['create', 'update'], message: '角色ID不能为空' })
    roleId!: string;

    @IsOptional()
    userId?: string;

    @IsOptional()
    userIdList?: string[];
}

/**
 * 更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateUserRoleDto extends PartialType(CreateUserRoleDto) {
    @IsNumberString(undefined, { groups: ['update'], message: '用户角色关联ID格式错误' })
    @IsDefined({ groups: ['update'], message: '用户角色关联ID必须指定' })
    id!: string;
}
