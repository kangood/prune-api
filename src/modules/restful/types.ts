import { Type } from '@nestjs/common';
import { ClassTransformOptions } from 'class-transformer';

/**
 * CRUD控制器方法列表
 */
export type CrudMethod = 'detail' | 'delete' | 'restore' | 'list' | 'store' | 'update';

/**
 * CRUD装饰器的方法选项
 */
export interface CrudMethodOption {
    /**
     * 序列化选项,如果为`noGroup`则不传参数，否则根据`id`+方法匹配来传参
     */
    serialize?: ClassTransformOptions | 'noGroup';
    hook?: (target: Type, method: string) => void;
}
/**
 * 每个启用方法的配置
 */
export interface CrudItem {
    name: CrudMethod;
    option?: CrudMethodOption;
}

/**
 * CRUD装饰器选项
 */
export interface CrudOptions {
    id: string;
    // 需要启用的方法
    enabled: Array<CrudMethod | CrudItem>;
    // 一些方法要使用到的自定义DTO
    dtos: {
        [key in 'list' | 'store' | 'update']?: Type;
    };
    // 资源权限使用的前缀
    preAuth: string;
}
