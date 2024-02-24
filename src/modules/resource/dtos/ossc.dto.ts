import { PartialType } from '@nestjs/swagger';
import { IsDefined, IsEnum, IsNotEmpty, IsNumber, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { IsUnique, IsUniqueExist } from '@/modules/database/constraints';
import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

import { OsscEntity } from '../entities';

/**
 * 分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryOsscDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    category?: string;

    @IsOptional()
    code?: string;

    @IsOptional()
    accessKey?: string;
}

/**
 * 创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateOsscDto {
    @IsUnique(OsscEntity, {
        groups: ['create'],
        message: '资源编码名称重复',
    })
    @IsUniqueExist(OsscEntity, {
        groups: ['update'],
        message: '资源编码重复',
    })
    @IsNotEmpty({ groups: ['create', 'update'], message: '资源编码不能为空' })
    code!: string;
}

/**
 * 更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateOsscDto extends PartialType(CreateOsscDto) {
    @IsNumber(undefined, { groups: ['update'], message: 'ID格式错误' })
    @IsDefined({ groups: ['update'], message: 'ID必须指定' })
    id!: number;
}

/**
 * 翻译成字典值的DTO
 */
export class OsscEchoDto {
    category: string;
}
