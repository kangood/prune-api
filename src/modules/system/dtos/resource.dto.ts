import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsDefined, IsEnum, IsNotEmpty, IsNumberString, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { IsUnique, IsUniqueExist } from '@/modules/database/constraints';
import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

import { ResourceEntity } from '../entities';

/**
 * 分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryResourceDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    menuId?: string;

    @IsOptional()
    code?: string;

    @IsOptional()
    name?: string;

    @Transform(({ value }) => value.split(','))
    @IsOptional()
    timeRange?: string[];
}

/**
 * 创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateResourceDto {
    @IsUnique(ResourceEntity, {
        groups: ['create'],
        message: '资源编码重复',
    })
    @IsUniqueExist(ResourceEntity, {
        groups: ['update'],
        message: '资源编码重复',
    })
    @IsNotEmpty({ groups: ['create', 'update'], message: '资源编码不能为空' })
    code!: string;

    @IsNotEmpty({ groups: ['create', 'update'], message: '资源名称不能为空' })
    name!: string;

    @IsOptional()
    describe?: string;
}

/**
 * 更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateResourceDto extends PartialType(CreateResourceDto) {
    @IsNumberString(undefined, { groups: ['update'], message: '资源ID格式错误' })
    @IsDefined({ groups: ['update'], message: '资源ID必须指定' })
    id!: string;
}
