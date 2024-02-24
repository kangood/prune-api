import { Transform } from 'class-transformer';
import { IsBoolean, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';
import { toBoolean } from '@/modules/core/helpers';

import { DeleteDto } from './delete.dto';

/**
 * 带软删除的批量删除验证
 */
@DtoValidation()
export class DeleteWithTrashDto extends DeleteDto {
    @Transform(({ value }) => toBoolean(value))
    @IsBoolean()
    @IsOptional()
    trash?: boolean;
}
