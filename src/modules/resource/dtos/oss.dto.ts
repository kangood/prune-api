import { PartialType } from '@nestjs/swagger';
import { IsDefined, IsEnum, IsNotEmpty, IsNumberString, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { IsUnique, IsUniqueExist } from '@/modules/database/constraints';
import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

import { OssEntity } from '../entities';

/**
 * 分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryOssDto extends ListWithTrashedQueryDto {
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
export class CreateOssDto {
    @IsUnique(OssEntity, {
        groups: ['create'],
        message: '资源编码名称重复',
    })
    @IsUniqueExist(OssEntity, {
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
export class UpdateOssDto extends PartialType(CreateOssDto) {
    @IsNumberString(undefined, { groups: ['update'], message: '对象存储ID格式错误' })
    @IsDefined({ groups: ['update'], message: 'ID必须指定' })
    id!: string;
}

/**
 * 翻译成字典值的DTO
 */
export class OssEchoDto {
    category: string;
}
