import { Get, Controller } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';

import { OSSMiddlewareService } from './oss-middleware.service';
import { OSSMiddlewareType } from './oss-middleware.type';

@Controller('oss-middleware')
@RequireLogin()
export class OSSMiddlewareController {
    constructor(protected service: OSSMiddlewareService) {}

    /**
     * 获取阿里 OSS 上传信息
     */
    @Get('getAliOSSInfo')
    @RequireAuthority('oss-middleware:getAliOSSInfo')
    async getAliOSSInfo(): Promise<OSSMiddlewareType> {
        return this.service.getSignature();
    }
}
