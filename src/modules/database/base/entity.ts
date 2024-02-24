import { Expose } from 'class-transformer';
import { BaseEntity as TypeOrmBaseEntity, Column } from 'typeorm';

export class BaseEntity extends TypeOrmBaseEntity {
    @Expose()
    @Column('bigint', { primary: true, name: 'id', comment: '主键' })
    id: number;
}
