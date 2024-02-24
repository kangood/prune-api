import { Get, Controller } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';

import { OSSService } from './oss.service';
import { OSSType } from './oss.type';

@Controller('oss')
@RequireLogin()
export class OSSController {
    constructor(protected service: OSSService) {}

    /**
     * 获取阿里 OSS 上传信息
     */
    @Get('getAliOSSInfo')
    @RequireAuthority('oss:getAliOSSInfo')
    async getAliOSSInfo(): Promise<OSSType> {
        return this.service.getSignature();
    }
}
