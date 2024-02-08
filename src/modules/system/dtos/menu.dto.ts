import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import {
    IsDefined,
    IsEnum,
    IsNotEmpty,
    IsNumber,
    IsNumberString,
    IsOptional,
    Min,
    ValidateIf,
} from 'class-validator';

import { toNumber } from 'lodash';

import { DtoValidation } from '@/modules/core/decorators';
import { SelectTrashMode } from '@/modules/database/constants';
import { IsDataExist, IsTreeUnique, IsTreeUniqueExist } from '@/modules/database/constraints';

import { ListQueryDto } from '@/modules/restful/dtos';

import { MenuEntity } from '../entities';

/**
 * 分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryMenuTreeDto extends ListQueryDto {
    @IsEnum(SelectTrashMode)
    @IsOptional()
    trashed?: SelectTrashMode;
}

/**
 * 新建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateMenuDto {
    @IsTreeUnique(MenuEntity, {
        groups: ['create'],
        message: '该菜单名称已经存在',
    })
    @IsTreeUniqueExist(MenuEntity, {
        groups: ['update'],
        message: '该菜单名称已经存在',
    })
    @IsNotEmpty({ groups: ['create'], message: '菜单名称不能为空' })
    @IsOptional({ groups: ['update'] })
    label!: string;

    @IsDataExist(MenuEntity, { always: true, message: '父菜单不存在' })
    @IsNumberString(undefined, { always: true, message: '父菜单ID格式不正确' })
    @ValidateIf((value) => value.parent !== null && value.parent)
    @IsOptional({ always: true })
    parent?: string;

    @Transform(({ value }) => toNumber(value))
    @Min(1, { always: true, message: '排序值必须大于1' })
    @IsNumber(undefined, { always: true })
    @IsOptional({ always: true })
    sortValue = 1;

    @IsOptional()
    abbreviation: string | null;

    @IsOptional()
    type: string | null;

    @IsOptional()
    describe: string | null;

    @IsOptional()
    state: boolean | null;
}

/**
 * 更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateMenuDto extends PartialType(CreateMenuDto) {
    @IsNumberString(undefined, { groups: ['update'], message: '机构ID格式错误' })
    @IsDefined({ groups: ['update'], message: '机构ID必须指定' })
    id!: string;
}
