import { Logger, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_FILTER, APP_GUARD, APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core';

import { JwtService } from '@nestjs/jwt';

import { database } from './config';
import { AuthorityGuard } from './modules/auth/authority.guard';
import { LoginGuard } from './modules/auth/login.guard';
import { AppFilter, AppIntercepter, AppPipe } from './modules/core/providers';
import { DatabaseModule } from './modules/database/database.module';
import { OrgModule } from './modules/org/org.module';
import { ResourceModule } from './modules/resource/resource.module';
import { OSSModule } from './modules/restful/oss/oss.module';
import { SystemModule } from './modules/system/system.module';

const envFilePath = ['.env'];

export const IS_DEV = process.env.NODE_ENV !== 'prod';

if (IS_DEV) {
    envFilePath.unshift('.env.dev');
} else {
    envFilePath.unshift('.env.prod');
}

@Module({
    imports: [
        DatabaseModule.forRoot(database),
        SystemModule,
        OrgModule,
        OSSModule,
        ResourceModule,
        ConfigModule.forRoot({
            isGlobal: true,
            envFilePath,
        }),
        // 这里的secret无效，读取不到，异步也一样
        // JwtModule.register({
        //     global: true,
        //     secret: process.env.JWT_SECRET,
        //     signOptions: {
        //         expiresIn: `${60 * 60 * 24}s`,
        //     },
        // }),
    ],
    providers: [
        {
            provide: APP_PIPE,
            useValue: new AppPipe({
                transform: true,
                forbidUnknownValues: false,
                validationError: { target: false },
            }),
        },
        {
            provide: APP_INTERCEPTOR,
            useClass: AppIntercepter,
        },
        {
            provide: APP_FILTER,
            useClass: AppFilter,
        },
        {
            provide: APP_GUARD,
            useClass: LoginGuard,
        },
        {
            provide: APP_GUARD,
            useClass: AuthorityGuard,
        },
        JwtService,
        Logger,
    ],
})
export class AppModule {}
