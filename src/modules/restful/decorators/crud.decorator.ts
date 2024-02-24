import { Get, Type, Post, Patch, Delete, SerializeOptions } from '@nestjs/common';
import { ClassTransformOptions } from 'class-transformer';
import { isNil } from 'lodash';

import { RequireAuthority } from '@/modules/auth/auth.decorator';

import { BaseController } from '../base';

import { CRUD_OPTIONS } from '../constants';

import { CrudItem, CrudOptions } from '../types';

/**
 * 控制器上的CRUD装饰器
 * @param options
 */
export const Crud =
    (options: CrudOptions) =>
    <T extends BaseController<any>>(Target: Type<T>) => {
        Reflect.defineMetadata(CRUD_OPTIONS, options, Target);

        const { id, enabled, dtos, preAuth } = Reflect.getMetadata(
            CRUD_OPTIONS,
            Target,
        ) as CrudOptions;
        const methods: CrudItem[] = [];
        // 添加启用的CRUD方法
        for (const value of enabled) {
            const item = (typeof value === 'string' ? { name: value } : value) as CrudItem;
            if (
                methods.map(({ name }) => name).includes(item.name) ||
                !isNil(Object.getOwnPropertyDescriptor(Target.prototype, item.name))
            )
                continue;
            methods.push(item);
        }
        // 添加控制器方法的具体实现,参数的DTO类型,方法及路径装饰器,序列化选项,是否允许匿名访问等metadata
        // 添加其它回调函数
        for (const { name, option = {} } of methods) {
            if (isNil(Object.getOwnPropertyDescriptor(Target.prototype, name))) {
                const descriptor = Object.getOwnPropertyDescriptor(BaseController.prototype, name);
                Object.defineProperty(Target.prototype, name, {
                    ...descriptor,
                    async value(...args: any[]) {
                        return descriptor.value.apply(this, args);
                    },
                });
            }

            const descriptor = Object.getOwnPropertyDescriptor(Target.prototype, name);

            const [, ...params] = Reflect.getMetadata('design:paramtypes', Target.prototype, name);

            if (name === 'store' && !isNil(dtos.store)) {
                Reflect.defineMetadata(
                    'design:paramtypes',
                    [dtos.store, ...params],
                    Target.prototype,
                    name,
                );
            } else if (name === 'update' && !isNil(dtos.update)) {
                Reflect.defineMetadata(
                    'design:paramtypes',
                    [dtos.update, ...params],
                    Target.prototype,
                    name,
                );
            } else if (name === 'list' && !isNil(dtos.list)) {
                Reflect.defineMetadata(
                    'design:paramtypes',
                    [dtos.list, ...params],
                    Target.prototype,
                    name,
                );
            }

            let serialize: ClassTransformOptions = {};
            if (isNil(option.serialize)) {
                if (['detail', 'store', 'update', 'delete', 'restore'].includes(name)) {
                    serialize = { groups: [`${id}-detail`] };
                } else if (['list'].includes(name)) {
                    serialize = { groups: [`${id}-list`] };
                }
            } else if (option.serialize === 'noGroup') {
                serialize = {};
            } else {
                serialize = option.serialize;
            }
            SerializeOptions(serialize)(Target, name, descriptor);
            // 识别控制层固定的几个方法名，加请求方式装饰器
            switch (name) {
                case 'list':
                    Get()(Target, name, descriptor);
                    break;
                case 'detail':
                    Get(':id')(Target, name, descriptor);
                    break;
                case 'store':
                    Post()(Target, name, descriptor);
                    break;
                case 'update':
                    Patch()(Target, name, descriptor);
                    break;
                case 'delete':
                    Delete()(Target, name, descriptor);
                    break;
                case 'restore':
                    Patch('restore')(Target, name, descriptor);
                    break;
                default:
                    break;
            }
            // 给控制层enabled中定义的API，加资源权限装饰器
            RequireAuthority(`${preAuth}${name}`)(Target, name, descriptor);

            if (!isNil(option.hook)) option.hook(Target, name);
        }

        return Target;
    };
