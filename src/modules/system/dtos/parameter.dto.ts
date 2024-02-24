import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsDefined, IsEnum, IsNotEmpty, IsNumber, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

/**
 * 系统参数分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryParameterDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    key?: string;

    @IsOptional()
    name?: string;

    @IsOptional()
    value?: string;

    @Transform(({ value }) => value.split(','))
    @IsOptional()
    timeRange?: string[];
}

/**
 * 系统参数创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateParameterDto {
    @IsNotEmpty({ groups: ['create', 'update'], message: '状态值必须传递' })
    state!: boolean;

    @IsNotEmpty({ groups: ['create', 'update'], message: '内置值必须传递' })
    readonly!: boolean;

    @IsNotEmpty({ groups: ['create'], message: '参数键不能为空' })
    @IsOptional({ groups: ['update'] })
    key!: string;

    @IsNotEmpty({ groups: ['create', 'update'], message: '参数名称不能为空' })
    name!: string;

    @IsNotEmpty({ groups: ['create', 'update'], message: '参数值不能为空' })
    value!: string;

    @IsOptional()
    describe?: string;
}

/**
 * 系统参数更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateParameterDto extends PartialType(CreateParameterDto) {
    @IsNumber(undefined, { groups: ['update'], message: '参数ID格式错误' })
    @IsDefined({ groups: ['update'], message: '参数ID必须指定' })
    id!: number;
}
