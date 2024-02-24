import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';

import { UserEntity } from '../org/entities';
/**
 * @Deprecated 由LoginGuard中逻辑替代
 */
@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
    constructor() {
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            secretOrKey: process.env.JWT_SECRET,
        });
    }

    // 在每次请求会走的验证，从请求头中验证token中的用户
    async validate(user: UserEntity): Promise<any> {
        if (!user.id) {
            throw new UnauthorizedException();
        }
        return user;
    }
}
