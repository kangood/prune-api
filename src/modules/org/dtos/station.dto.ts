import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsDefined, IsEnum, IsNotEmpty, IsNumberString, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { IsUnique, IsUniqueExist } from '@/modules/database/constraints';
import { StationEntity } from '@/modules/org/entities';
import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

/**
 * 岗位分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryStationDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    name?: string;

    @IsOptional()
    orgId?: string;

    @Transform(({ value }) => value.split(','))
    @IsOptional()
    timeRange?: string[];
}

/**
 * 岗位创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateStationDto {
    @IsUnique(StationEntity, {
        groups: ['create'],
        message: '岗位名称重复',
    })
    @IsUniqueExist(StationEntity, {
        groups: ['update'],
        message: '岗位名称重复',
    })
    @IsNotEmpty({ groups: ['create'], message: '岗位名称不能为空' })
    @IsOptional({ groups: ['update'] })
    name!: string;

    @IsOptional()
    orgId?: string;

    @IsOptional()
    state?: boolean;

    @IsOptional()
    describe?: string;
}

/**
 * 岗位更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateStationDto extends PartialType(CreateStationDto) {
    @IsNumberString(undefined, { groups: ['update'], message: '岗位ID格式错误' })
    @IsDefined({ groups: ['update'], message: '岗位ID必须指定' })
    id!: string;
}
