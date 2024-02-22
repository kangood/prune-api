import { Module } from '@nestjs/common';

import { OSSMiddlewareController } from './oss-middleware.controller';
import { OSSMiddlewareService } from './oss-middleware.service';

@Module({
    imports: [],
    controllers: [OSSMiddlewareController],
    providers: [OSSMiddlewareService],
    exports: [],
})
export class OSSMiddlewareModule {}
