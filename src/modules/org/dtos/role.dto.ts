import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsDefined, IsEnum, IsNotEmpty, IsNumber, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { IsUnique, IsUniqueExist } from '@/modules/database/constraints';
import { RoleEntity } from '@/modules/org/entities';
import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

/**
 * 角色分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryRoleDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    name?: string;

    @IsOptional()
    code?: string;

    @Transform(({ value }) => value.split(','))
    @IsOptional()
    timeRange?: string[];
}

/**
 * 角色创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateRoleDto {
    @IsUnique(RoleEntity, {
        groups: ['create'],
        message: '角色编码重复',
    })
    @IsUniqueExist(RoleEntity, {
        groups: ['update'],
        message: '角色编码重复',
    })
    @IsNotEmpty({ groups: ['create', 'update'], message: '角色编码不能为空' })
    code!: string;

    @IsNotEmpty({ groups: ['create', 'update'], message: '角色名称不能为空' })
    name!: string;
}

/**
 * 角色更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateRoleDto extends PartialType(CreateRoleDto) {
    @IsNumber(undefined, { groups: ['update'], message: '角色ID格式错误' })
    @IsDefined({ groups: ['update'], message: '角色ID必须指定' })
    id!: number;
}

/**
 * 翻译成字典值的DTO
 */
export class RoleEchoDto {
    category: string;
}
