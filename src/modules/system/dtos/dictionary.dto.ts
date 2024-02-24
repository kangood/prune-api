import { PartialType } from '@nestjs/swagger';
import { IsDefined, IsEnum, IsNotEmpty, IsNumber, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

/**
 * 字典分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryDictionaryDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    label?: string;

    @IsOptional()
    type?: string;

    @IsOptional()
    code?: string;

    @IsOptional()
    name?: string;
}

/**
 * 字典创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateDictionaryDto {
    @IsNotEmpty({ groups: ['create'], message: '类型必须传递' })
    @IsOptional({ groups: ['update'] })
    type!: string;

    @IsNotEmpty({ groups: ['create'], message: '类型标签必须传递' })
    @IsOptional({ groups: ['update'] })
    label!: string;

    @IsNotEmpty({ groups: ['create'], message: '编码必须填写' })
    @IsOptional({ groups: ['update'] })
    code!: string;
}

/**
 * 字典更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateDictionaryDto extends PartialType(CreateDictionaryDto) {
    @IsNumber(undefined, { groups: ['update'], message: '字典ID格式错误' })
    @IsDefined({ groups: ['update'], message: '字典ID必须指定' })
    id!: number;
}
