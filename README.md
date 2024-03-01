<div align="center"> 
<br> 
<br>
<h1> Prune Api </h1>
</div>

## 简介

Prune Api 是现代化风格的快速开发平台 [Prune Admin](https://github.com/KangodYan/prune-admin) 的后端数据服务，基于 NestJS、TypeScript、TypeORM、MySQL 构建。

## 快速开始

### 获取项目代码

```bash
git clone https://github.com/KangodYan/prune-api.git
```

### 导入数据库文件

- 在 MySQL8 数据库中新建数据库，命名 `prune`
- 找到项目根目录下的 `prune.sql` 文件，导入到 `prune` 数据库中
- 在数据库配置文件中去掉 sql_mode 配置项的 `ONLY_FULL_GROUP_BY` 选项，然后重启服务

### 安装依赖

在项目根目录下运行以下命令安装项目依赖：

```bash
pnpm install
```

### 启动开发服务器

运行以下命令以启动开发服务器：

```bash
pnpm start:dev
```

访问 [http://localhost:7441](http://localhost:7441) 查看您的应用程序。

### 构建生产版本

运行以下命令以构建生产版本：

```bash
pnpm build
```

### 在生产环境启动服务

```bash
pnpm start:prod
```
