import { SetMetadata } from '@nestjs/common';

export const RequireLogin = () => SetMetadata('require-login', true);

export const RequireAuthority = (...resources: string[]) =>
    SetMetadata('require-resource', resources);
