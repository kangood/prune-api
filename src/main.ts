import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';
import { useContainer } from 'class-validator';
import { contentParser } from 'fastify-multer';

import { AppModule } from './app.module';

const { PROTOCOL, HOST, PORT } = process.env;

async function bootstrap() {
    const app = await NestFactory.create<NestFastifyApplication>(AppModule, new FastifyAdapter());
    // 加全局前缀
    app.setGlobalPrefix('api');
    // 允许跨域
    app.enableCors();
    useContainer(app.select(AppModule), {
        fallbackOnErrors: true,
    });
    // 添加fastify上传文件的支持，FastifyAdapter不支持multipart/form-data
    // @ts-ignore （fastify-multer 在 TS 上没有适配 fastify 4.x，所以关闭，但不影响运行）
    app.register(contentParser);
    await app.listen(PORT, '0.0.0.0', () => {
        Logger.log(`服务已经启动,接口请访问:${PROTOCOL}${HOST}:${PORT}`);
    });
}
bootstrap();
