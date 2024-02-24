import { readFile } from 'fs/promises';
import { join } from 'path';

import { Injectable } from '@nestjs/common';
import ExcelJS from 'exceljs';
import { FastifyReply } from 'fastify';
import { isEmpty, isNil, omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { paginate } from '@/modules/database/helpers';
import { PaginateReturn, QueryHook } from '@/modules/database/types';
import { UPLOAD_FOLDER } from '@/modules/restful/constants';
import { PublicOrderType } from '@/modules/system/constants';

import { CreateStationDto, QueryStationDto, UpdateStationDto } from '../dtos';
import { OrgEntity, StationEntity } from '../entities';
import { StationRepository } from '../repositories';

// 岗位查询接口
type FindParams = {
    [key in keyof Omit<QueryStationDto, 'limit' | 'page'>]: QueryStationDto[key];
};

/**
 * 岗位数据操作
 */
@Injectable()
export class StationService extends BaseService<StationEntity, StationRepository, FindParams> {
    constructor(protected repository: StationRepository) {
        super(repository);
    }

    /**
     * 新建岗位
     * @param data
     */
    async create(data: CreateStationDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新岗位
     * @param data
     */
    async update(data: UpdateStationDto) {
        await this.repository.update(data.id, omit(data, ['id']));
        return this.detail(data.id);
    }

    /**
     * 调用关联查询并分页
     */
    async listRelate(
        options?: QueryStationDto,
        callback?: QueryHook<StationEntity>,
    ): Promise<PaginateReturn<StationEntity>> {
        const qb = await this.buildListRelateQB(this.repository.buildBaseQB(), options, callback);
        return paginate(qb, options);
    }

    /**
     * Excel导出
     */
    async exportExcel(options?: QueryStationDto, response?: FastifyReply) {
        // 先拿传过来的参数去查询
        const stationList = await (
            await this.buildListRelateQB(this.repository.buildBaseQB(), options)
        ).getMany();
        const workbook = new ExcelJS.Workbook();
        const worksheet = workbook.addWorksheet();
        // 定义表格字段以及填充数据
        worksheet.columns = [
            { header: '岗位名称', key: 'name', width: 32 },
            { header: '机构名称', key: 'orgMap', width: 42 },
            { header: '状态', key: 'state' },
            { header: '描述', key: 'describe' },
        ];
        worksheet.addRows(stationList);
        // 处理加工数据
        worksheet.eachRow((row: any, rowNumber: number) => {
            if (rowNumber > 1) {
                // 翻译state值
                const stateCell = row.getCell('state');
                stateCell.value = stateCell.value ? '启用' : '禁用';
                // 获取对象中的机构值
                const orgCell = row.getCell('orgMap');
                orgCell.value = orgCell.value.label;
            }
        });
        // 最后输出
        const buffer = await workbook.xlsx.writeBuffer();
        response.send(buffer);
    }

    /**
     * 获取Excel中的数据集合
     */
    async getExcelDataList(file: Express.Multer.File) {
        const importedDataList: CreateStationDto[] = [];
        // 加载并读取已上传的文件数据
        const filePath = join(UPLOAD_FOLDER, file.filename);
        await readFile(filePath).then(async (data) => {
            // 从Excel中获取到数据
            const workbook = new ExcelJS.Workbook();
            await workbook.xlsx.load(data);
            const worksheet = workbook.getWorksheet(1);
            // 数据填充进List
            worksheet.eachRow((row: any, rowNumber: number) => {
                if (rowNumber > 1) {
                    const name = row.getCell(1).value; // 岗位名称
                    const orgId = row.getCell(2).value; // 机构ID
                    const state = row.getCell(3).value !== '否'; // 状态，'否'即false，其他情况true
                    const describe = row.getCell(4).value; // 描述
                    importedDataList.push({ name, orgId, state, describe });
                }
            });
        });
        return importedDataList;
    }

    /**
     * Excel导入
     */
    async importExcel(file: Express.Multer.File) {
        const importedDataList = await this.getExcelDataList(file);
        for (const data of importedDataList) {
            await this.create(data);
        }
    }

    /**
     * 加入关联机构查询
     */
    protected async buildListRelateQB(
        queryBuilder: SelectQueryBuilder<StationEntity>,
        options: FindParams,
        callback?: QueryHook<StationEntity>,
    ) {
        // 调用buildListQB组装条件查询，再此基础上加入对org的关联
        return (await this.buildListQB(queryBuilder, options, callback)).leftJoinAndMapOne(
            `station.orgMap`,
            OrgEntity,
            'org',
            'station.org_id=org.id',
        );
    }

    /**
     * 构建岗位列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<StationEntity>,
        options: FindParams,
        callback?: QueryHook<StationEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, name, orgId, timeRange } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(name)) {
            qb.andWhere(`${queryName}.name like '%${name}%'`);
        }
        if (!isEmpty(orgId)) {
            qb.andWhere({ orgId });
        }
        if (!isNil(timeRange)) {
            qb.andWhere(`${queryName}.created_at between ${timeRange[0]} and ${timeRange[1]}`);
        }
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 对岗位进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<StationEntity>, orderBy?: PublicOrderType) {
        const queryName = this.repository.qbName;
        switch (orderBy) {
            // 按时间倒序
            case PublicOrderType.CREATED:
                return qb.orderBy(`${queryName}.created_at`, 'DESC');
            case PublicOrderType.UPDATED:
                return qb.orderBy(`${queryName}.updated_at`, 'DESC');
            // 默认按id正序
            default:
                return qb.orderBy(`${queryName}.id`, 'ASC');
        }
    }
}
