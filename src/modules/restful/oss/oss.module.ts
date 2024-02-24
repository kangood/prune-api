import { Module } from '@nestjs/common';

import { OSSController } from './oss.controller';
import { OSSService } from './oss.service';

@Module({
    imports: [],
    controllers: [OSSController],
    providers: [OSSService],
    exports: [],
})
export class OSSModule {}
