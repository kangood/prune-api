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

import { OrgEntity } from '../entities';

/**
 * 机构分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryOrgTreeDto extends ListQueryDto {
    @IsEnum(SelectTrashMode)
    @IsOptional()
    trashed?: SelectTrashMode;
}

/**
 * 机构创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateOrgDto {
    @IsTreeUnique(OrgEntity, {
        groups: ['create'],
        message: '该机构/部门已经存在',
    })
    @IsTreeUniqueExist(OrgEntity, {
        groups: ['update'],
        message: '该机构/部门已经存在',
    })
    @IsNotEmpty({ groups: ['create'], message: '机构/部门名称不能为空' })
    @IsOptional({ groups: ['update'] })
    label!: string;

    @IsDataExist(OrgEntity, { always: true, message: '父机构/部门不存在' })
    @IsNumberString(undefined, { always: true, message: '父机构/部门ID格式不正确' })
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
 * 机构更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateOrgDto extends PartialType(CreateOrgDto) {
    @IsNumberString(undefined, { groups: ['update'], message: '机构ID格式错误' })
    @IsDefined({ groups: ['update'], message: '机构ID必须指定' })
    id!: string;
}
