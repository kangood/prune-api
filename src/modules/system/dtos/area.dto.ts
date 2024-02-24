import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import {
    IsDefined,
    IsEnum,
    IsNotEmpty,
    IsNumber,
    IsOptional,
    Min,
    ValidateIf,
} from 'class-validator';

import { toNumber } from 'lodash';

import { DtoValidation } from '@/modules/core/decorators';
import { SelectTrashMode } from '@/modules/database/constants';
import { IsDataExist, IsTreeUnique, IsTreeUniqueExist } from '@/modules/database/constraints';
import { ListQueryDto } from '@/modules/restful/dtos';
import { AreaEntity } from '@/modules/system/entities';

/**
 * 地区分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryAreaTreeDto extends ListQueryDto {
    @IsEnum(SelectTrashMode)
    @IsOptional()
    trashed?: SelectTrashMode;
}

/**
 * 地区创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateAreaDto {
    @IsTreeUnique(AreaEntity, {
        groups: ['create'],
        message: '地区编码重复',
    })
    @IsTreeUniqueExist(AreaEntity, {
        groups: ['update'],
        message: '地区编码重复',
    })
    @IsNotEmpty({ groups: ['create'], message: '地区编码不能为空' })
    @IsOptional({ groups: ['update'] })
    code!: string;

    @IsDataExist(AreaEntity, { always: true, message: '父地区不存在' })
    @IsNumber(undefined, { always: true, message: '父地区ID格式不正确' })
    @ValidateIf((value) => value.parent !== null && value.parent)
    @IsOptional({ always: true })
    parent?: number;

    @Transform(({ value }) => toNumber(value))
    @Min(1, { always: true, message: '排序值必须大于1' })
    @IsNumber(undefined, { always: true })
    @IsOptional({ always: true })
    sortValue = 1;

    @IsNotEmpty({ groups: ['create'], message: '地区名称不能为空' })
    @IsOptional({ groups: ['update'] })
    label: string;

    @IsOptional()
    fullName: string | null;

    @IsOptional()
    level: string | null;

    @IsOptional()
    source: string | null;
}

/**
 * 地区更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateAreaDto extends PartialType(CreateAreaDto) {
    @IsNumber(undefined, { groups: ['update'], message: '地区ID格式错误' })
    @IsDefined({ groups: ['update'], message: '地区ID必须指定' })
    id!: number;
}
