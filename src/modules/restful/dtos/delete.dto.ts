import { IsDefined, IsNumberString } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

/**
 * 批量删除验证
 */
@DtoValidation()
export class DeleteDto {
    @IsNumberString(undefined, {
        each: true,
        message: 'ID格式错误',
    })
    @IsDefined({
        each: true,
        message: 'ID必须指定',
    })
    ids: string[] = [];
}
