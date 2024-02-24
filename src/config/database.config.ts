import { TypeOrmModuleOptions } from '@nestjs/typeorm';

import { config } from 'dotenv';

config({ path: `.env.${process.env.NODE_ENV}` });

/**
 * 数据库配置
 */
export const database = (): TypeOrmModuleOptions => ({
    charset: 'utf8mb4',
    logging: 'all',
    type: 'mysql',
    host: process.env.MYSQL_HOST,
    port: parseInt(process.env.MYSQL_PORT, 10),
    username: process.env.MYSQL_USERNAME,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    synchronize: false,
    autoLoadEntities: true,
    bigNumberStrings: false,
});
