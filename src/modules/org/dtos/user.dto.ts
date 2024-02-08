import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsDefined, IsEnum, IsNotEmpty, IsNumberString, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

/**
 * 用户分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryUserDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    id?: string;

    @IsOptional()
    account?: string;

    @Transform(({ value }) => value.split(','))
    nation?: string[];

    @IsOptional()
    orgId?: string;

    @Transform(({ value }) => value.split(','))
    @IsOptional()
    timeRange?: string[];
}

/**
 * 用户创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateUserDto {
    // 单就用户的constraint有问题，先不用了
    // @IsUnique(UserEntity, {
    //     groups: ['create'],
    //     message: '账号名称重复',
    // })
    // @IsUniqueExist(UserEntity, {
    //     groups: ['update'],
    //     message: '账号名称重复',
    // })
    @IsNotEmpty({ groups: ['create', 'update'], message: '账号名称不能为空' })
    @IsOptional({ groups: ['update'] })
    account!: string;

    @IsNotEmpty({ groups: ['create'], message: '姓名不能为空' })
    name?: string;

    @IsOptional()
    state?: boolean;

    @IsNotEmpty({ groups: ['create'], message: '密码不能为空' })
    password?: string;
}

/**
 * 用户更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateUserDto extends PartialType(CreateUserDto) {
    @IsNumberString(undefined, { groups: ['update'], message: '用户ID格式错误' })
    @IsDefined({ groups: ['update'], message: '用户ID必须指定' })
    id!: string;

    @IsNotEmpty({ groups: ['resetPwd'], message: '确认密码不能为空' })
    @IsOptional()
    confirmPassword?: string;
}

/**
 * 用户登录验证
 */
@DtoValidation({ groups: ['login'] })
export class LoginUserDto {
    @IsNotEmpty({ groups: ['login'], message: '用户名不能为空' })
    account?: string;

    @IsNotEmpty({ groups: ['login'], message: '密码不能为空' })
    password?: string;

    @IsOptional()
    userId?: string;
}

/**
 * 翻译成字典值的DTO
 */
export class UserEchoDto {
    nation: string;

    education: string;

    positionStatus: string;
}
