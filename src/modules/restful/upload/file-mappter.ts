import { Request } from 'express';

interface FileMapper {
    file: Express.Multer.File;
    req: Request;
}

/**
 * 返回File对象
 */
export const fileMapper = ({ file, req }: FileMapper) => {
    return {
        originalName: file.originalname,
        fileName: file.filename,
        fileUrl: `${req.protocol}://${req.headers.host}/${file.path}`,
    };
};
