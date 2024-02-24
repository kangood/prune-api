import { SnowflakeIdv1 } from 'simple-flakeid';

const snowflakeIdv1 = new SnowflakeIdv1({ workerId: 1 });

export const getSnowflakeId = () => {
    return snowflakeIdv1.NextNumber();
};
