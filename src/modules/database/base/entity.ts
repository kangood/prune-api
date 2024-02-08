import { Expose } from 'class-transformer';
import { BaseEntity as TypeOrmBaseEntity, Column } from 'typeorm';

export class BaseEntity extends TypeOrmBaseEntity {
    @Expose()
    @Column('varchar', { primary: true, name: 'id', comment: '主键', length: 20 })
    id: string;
}
