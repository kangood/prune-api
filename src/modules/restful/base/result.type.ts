export interface IResult<T> {
    code: number;
    message: string;
    result?: T;
}

export interface IResults<T> {
    code: number;
    message: string;
    result?: T[];
}
