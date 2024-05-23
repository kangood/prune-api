import { Injectable } from '@nestjs/common';
// eslint-disable-next-line import/no-extraneous-dependencies
import OSS from 'ali-oss';
import dayjs from 'dayjs';
import qiniu from 'qiniu';

import { AliOSSType, QiniuOSSType } from './oss-middleware.type';

@Injectable()
export class OSSMiddlewareService {
    /**
     * 获取阿里云 OSS 上传签名
     */
    async getAliSignature(): Promise<AliOSSType> {
        const config = {
            accessKeyId: process.env.ALI_ACCESS_KEY,
            accessKeySecret: process.env.ALI_ACCESS_KEY_SECRET,
            bucket: 'water-drop-resources',
            dir: 'images/',
        };

        const client = new OSS(config);

        const date = new Date();
        date.setDate(date.getDate() + 1);
        const policy = {
            expiration: date.toISOString(), // 请求有效期
            conditions: [
                ['content-length-range', 0, 1048576000], // 设置上传文件的大小限制
            ],
        };

        // bucket域名
        const host = `https://${config.bucket}.${
            (await client.getBucketLocation(config.bucket)).location
        }.aliyuncs.com`.toString();
        // 签名
        const formData = client.calculatePostSignature(policy);
        // 返回参数
        const params = {
            expire: dayjs().add(1, 'days').unix().toString(),
            policy: formData.policy,
            signature: formData.Signature,
            accessId: formData.OSSAccessKeyId,
            host,
            dir: 'images/',
        };

        return params;
    }

    /**
     * 获取七牛云 OSS 上传签名
     */
    async getQiniuSignature(): Promise<QiniuOSSType> {
        const accessKey = process.env.QINIU_ACCESS_KEY;
        const secretKey = process.env.QINIU_SECRET_KEY;
        const mac = new qiniu.auth.digest.Mac(accessKey, secretKey);
        const options = {
            host: 'https://qiniu.panlore.top',
            dir: 'project/prune/',
            scope: 'kd-figure-bed',
            expire: new Date().getTime() + 60 * 60 * 1000, // 和默认值一样，1个小时
        };
        const putPolicy = new qiniu.rs.PutPolicy(options);
        const uploadToken = putPolicy.uploadToken(mac);
        const params = {
            host: options.host,
            dir: options.dir,
            token: uploadToken,
            expires: options.expire,
        };
        return params;
    }
}
