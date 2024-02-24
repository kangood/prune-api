import { Body, Controller, Get, Post, Query } from '@nestjs/common';

import { LoginUserDto } from '../org/dtos';

import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) {}

    @Post('login')
    async login(@Body() loginUserDto: LoginUserDto) {
        return this.authService.login(loginUserDto);
    }

    @Get('refresh')
    async refresh(@Query('refreshToken') refreshToken: string) {
        return this.authService.refresh(refreshToken);
    }
}
