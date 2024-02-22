import { Get, Controller } from '@nestjs/common';

import { RequireAuthority, RequireLogin } from '@/modules/auth/auth.decorator';

import { OSSMiddlewareService } from './oss-middleware.service';
import { AliOSSType, QiniuOSSType } from './oss-middleware.type';

@Controller('oss-middleware')
@RequireLogin()
export class OSSMiddlewareController {
    constructor(protected service: OSSMiddlewareService) {}

    /**
     * 获取阿里云 OSS 上传信息
     */
    @Get('getAliOSSInfo')
    @RequireAuthority('oss-middleware:getAliOSSInfo')
    async getAliOSSInfo(): Promise<AliOSSType> {
        return this.service.getAliSignature();
    }

    /**
     * 获取七牛云 OSS 上传信息
     */
    @Get('getQiniuOSSInfo')
    @RequireAuthority('oss-middleware:getQiniuOSSInfo')
    async getQiniuOSSInfo(): Promise<QiniuOSSType> {
        return this.service.getQiniuSignature();
    }
}
