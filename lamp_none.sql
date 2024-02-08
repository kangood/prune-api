/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : lamp

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 08/02/2024 19:02:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_area
-- ----------------------------
DROP TABLE IF EXISTS `c_area`;
CREATE TABLE `c_area` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '全名',
  `sort_value` int DEFAULT '1' COMMENT '排序',
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '维度',
  `level_` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '行政区级: dictType = AREA_LEVEL',
  `source_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据来源',
  `state` bit(1) DEFAULT b'0' COMMENT '状态',
  `parentId` varchar(20) DEFAULT NULL COMMENT '父ID',
  `mpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING BTREE,
  KEY `FK_faba1208d8bfdb64cb52c65d18a` (`parentId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='地区表';

-- ----------------------------
-- Records of c_area
-- ----------------------------
BEGIN;
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465175766999109', '01', '中国', '', 1, '', '', '01', '02', b'0', NULL, '465175766999109.', NULL, '2023-08-07 18:45:02.000000', NULL, '2023-08-12 15:01:54.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465177363329093', '02', '北京市', '', 1, '', '', '02', '02', b'0', '465175766999109', '465175766999109.465177363329093.', NULL, '2023-08-07 18:51:32.000000', NULL, '2023-08-12 15:14:50.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465177397678149', '03', '朝阳区', '', 1, '', '', '04', '', b'0', '465177363329093', '465175766999109.465177363329093.465177397678149.', NULL, '2023-08-07 18:51:41.000000', NULL, '2023-08-12 15:26:06.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465177425383493', '04', '三里屯街道', '', 1, '', '', '05', '', b'0', '465177397678149', '465175766999109.465177363329093.465177397678149.465177425383493.', NULL, '2023-08-07 18:51:47.000000', NULL, '2023-08-12 15:26:09.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465177551310917', '05', '重庆市', '', 1, '', '', '02', '02', b'0', '465175766999109', '465175766999109.465177551310917.', NULL, '2023-08-07 18:52:18.000000', NULL, '2023-08-12 15:02:12.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465177690779717', '06', '江北区', '', 1, '', '', '04', '02', b'0', '465177551310917', '465175766999109.465177551310917.465177690779717.', NULL, '2023-08-07 18:52:52.000000', NULL, '2023-08-12 15:25:46.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('466895356276805', '023', '丰都县', '', 1, '', '', '04', '02', b'0', '465177551310917', '465175766999109.465177551310917.466895356276805.', NULL, '2023-08-12 15:22:04.000000', NULL, '2023-08-12 15:22:04.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('466895553298501', '024', '三合街道', '', 1, '', '', '05', '02', b'0', '466895356276805', '465175766999109.465177551310917.466895356276805.466895553298501.', NULL, '2023-08-12 15:22:52.000000', NULL, '2023-08-12 15:22:52.000000', NULL);
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('466896161755205', '215', '观音桥街道', '', 1, '', '', '05', '02', b'0', '465177690779717', '465175766999109.465177551310917.465177690779717.466896161755205.', NULL, '2023-08-12 15:25:21.000000', NULL, '2023-09-11 17:29:47.000000', NULL);
COMMIT;

-- ----------------------------
-- Table structure for c_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `c_dictionary`;
CREATE TABLE `c_dictionary` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型标签',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `sort_value` int DEFAULT '1' COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标',
  `css_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'css样式',
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'css class',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人id',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人id',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_type_code` (`type`,`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典项';

-- ----------------------------
-- Records of c_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1', 'AREA_LEVEL', '行政区划', '01', '国家', b'1', '', 1, '', '', '', b'1', NULL, 3, '2020-01-20 15:12:57.000000', 3, '2023-12-19 16:29:34.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('10', 'EDUCATION', '学历', '01', '小学', b'1', '', 1, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:13.000000', 3, '2023-08-08 08:32:59.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('11', 'EDUCATION', '学历', '02', '中学', b'1', '', 2, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:32.000000', 3, '2020-03-09 23:34:32.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('110', 'POSITION_STATUS', '职位状态', '01', '在职', b'1', '', 1, '', '', '', b'1', NULL, 1, '2019-06-04 11:38:16.000000', 1, '2019-06-04 11:38:16.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('111', 'POSITION_STATUS', '职位状态', '02', '请假', b'1', '', 2, '', '', '', b'1', NULL, 3, '2020-03-09 23:39:30.000000', 3, '2020-03-09 23:39:30.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('112', 'POSITION_STATUS', '职位状态', '03', '离职', b'1', '', 3, '', '', '', b'1', NULL, 1, '2019-06-04 11:38:50.000000', 1, '2019-06-04 11:38:50.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('12', 'EDUCATION', '学历', '03', '高中', b'1', '', 3, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:40.000000', 3, '2020-03-09 23:34:40.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('13', 'EDUCATION', '学历', '04', '专科', b'1', '', 4, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2019-06-04 11:36:29.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('14', 'EDUCATION', '学历', '05', '本科', b'1', '', 5, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:19.000000', 1, '2019-06-04 11:36:19.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486198107023605760', 'RESOURCE_TYPE', '资源类型', '20', '菜单', b'1', '', 2, '', '', '', b'1', NULL, 2, '2022-01-26 12:43:36.000000', 2, '2022-01-26 12:46:58.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486198623417925632', 'RESOURCE_DATA_SCOPE', '数据范围', '01', '全部', b'1', '', 1, '', '', '', b'1', NULL, 2, '2022-01-26 12:45:39.000000', 2, '2022-01-26 12:47:45.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486198858865180672', 'ROLE_CATEGORY', '角色类别', '10', '功能角色', b'1', '', 1, '', '', '', b'1', NULL, 2, '2022-01-26 12:46:35.000000', 2, '2022-01-26 12:51:54.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486198996287356928', 'RESOURCE_TYPE', '资源类型', '60', '数据', b'1', '', 6, '', '', '', b'1', NULL, 2, '2022-01-26 12:47:08.000000', 2, '2022-01-26 12:47:08.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486199651718660096', 'RESOURCE_DATA_SCOPE', '数据范围', '02', '本单位及子级', b'1', '', 2, '', '', '', b'1', NULL, 2, '2022-01-26 12:49:44.000000', 2, '2022-01-26 12:49:44.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486199679237488640', 'RESOURCE_DATA_SCOPE', '数据范围', '03', '本单位', b'1', '', 3, '', '', '', b'1', NULL, 2, '2022-01-26 12:49:50.000000', 2, '2022-01-26 12:49:50.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486199726792507392', 'RESOURCE_DATA_SCOPE', '数据范围', '04', '本部门及子级', b'1', '', 4, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:02.000000', 2, '2022-01-26 12:50:02.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486199753644441600', 'RESOURCE_DATA_SCOPE', '数据范围', '05', '本部门', b'1', '', 5, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:08.000000', 2, '2022-01-26 12:50:08.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486199809227358208', 'RESOURCE_DATA_SCOPE', '数据范围', '06', '个人', b'1', '', 6, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:21.000000', 2, '2022-01-26 12:50:21.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486199838218387456', 'RESOURCE_DATA_SCOPE', '数据范围', '07', '自定义', b'1', '', 7, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:28.000000', 2, '2022-01-26 12:53:23.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486200233623814144', 'ROLE_CATEGORY', '角色类别', '20', '桌面角色', b'1', '', 2, '', '', '', b'1', NULL, 2, '2022-01-26 12:52:03.000000', 2, '2022-01-26 12:52:03.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1486200358744096768', 'ROLE_CATEGORY', '角色类别', '30', '数据角色', b'1', '', 3, '', '', '', b'1', NULL, 2, '2022-01-26 12:52:32.000000', 2, '2022-01-26 12:52:32.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('15', 'EDUCATION', '学历', '06', '硕士', b'1', '', 6, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2019-06-04 11:36:29.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('16', 'EDUCATION', '学历', '07', '博士', b'1', '', 7, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2019-06-04 11:36:29.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('17', 'EDUCATION', '学历', '08', '博士后', b'1', '', 8, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2019-06-04 11:36:29.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('2', 'AREA_LEVEL', '行政区划', '02', '省份/直辖市', b'1', '', 2, '', '', '', b'1', NULL, 3, '2020-01-20 15:13:45.000000', 3, '2020-01-20 15:13:45.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('29', 'EDUCATION', '学历', '20', '其他', b'1', '', 20, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:54.000000', 3, '2020-03-09 23:34:54.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('3', 'AREA_LEVEL', '行政区划', '03', '地市', b'1', '', 3, '', '', '', b'1', NULL, 3, '2020-01-20 15:14:16.000000', 3, '2020-01-20 15:14:16.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('4', 'AREA_LEVEL', '行政区划', '04', '区县', b'1', '', 4, '', '', '', b'1', NULL, 3, '2020-01-20 15:14:54.000000', 3, '2020-01-20 15:14:54.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('40', 'ORG_TYPE', '机构类型', '01', '单位', b'1', '', 1, '', '', '', b'1', NULL, 1, '2020-11-23 21:13:17.000000', 1, '2020-11-23 21:13:17.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('41', 'ORG_TYPE', '机构类型', '02', '部门', b'1', '', 2, '', '', '', b'1', NULL, 1, '2020-11-23 21:13:17.000000', 1, '2020-11-23 21:13:17.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('43', 'NATION', '民族', '01', '汉族', b'1', '', 0, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('44', 'NATION', '民族', '02', '壮族', b'1', '', 1, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('449940761571413', 'AREA_SOURCE', '地区数据来源', '01', '爬取', b'1', '', 1, '', '', '', b'1', NULL, 2, '2023-06-27 11:29:45.000000', 2, '2023-06-27 11:29:47.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('449940761571414', 'AREA_SOURCE', '地区数据来源', '02', '新增', b'1', '', 1, '', '', '', b'1', NULL, 2, '2023-06-27 11:31:24.000000', 2, '2023-06-27 11:31:26.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('45', 'NATION', '民族', '03', '满族', b'1', '', 2, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('46', 'NATION', '民族', '04', '回族', b'1', '', 3, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('47', 'NATION', '民族', '05', '苗族', b'1', '', 4, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('48', 'NATION', '民族', '06', '维吾尔族', b'1', '', 5, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('49', 'NATION', '民族', '07', '土家族', b'1', '', 6, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('5', 'AREA_LEVEL', '行政区划', '05', '乡镇', b'1', '', 5, '', '', '', b'1', NULL, 3, '2020-03-09 23:33:46.000000', 3, '2020-03-09 23:33:46.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('50', 'NATION', '民族', '08', '彝族', b'1', '', 7, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('51', 'NATION', '民族', '09', '蒙古族', b'1', '', 8, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512567113781317', 'OSSC_CATEGORY', 'OSSC种类', '00', '', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:40:55.512000', NULL, '2023-12-19 16:40:55.512000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512569714729029', 'OSSC_CATEGORY', 'OSSC种类', '1', 'aliyun', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:51:30.510000', NULL, '2023-12-19 16:51:30.510000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512569856454725', 'OSSC_CATEGORY', 'OSSC种类', '2', 'qiniu', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:52:05.110000', NULL, '2023-12-19 16:52:05.110000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512570085163077', 'OSSC_CATEGORY', 'OSSC种类', '3', 'minio', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:53:00.948000', NULL, '2023-12-19 16:53:00.948000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512570187567173', 'OSSC_CATEGORY', 'OSSC种类', '4', 'amazon s3', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:53:25.949000', NULL, '2023-12-19 16:53:25.949000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495301', '1312', 'asd', '00', '', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-21 15:50:39.867000', NULL, '2023-12-21 15:50:39.867000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('52', 'NATION', '民族', '10', '藏族', b'1', '', 9, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('53', 'NATION', '民族', '11', '布依族', b'1', '', 10, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('54', 'NATION', '民族', '12', '侗族', b'1', '', 11, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('55', 'NATION', '民族', '13', '瑶族', b'1', '', 12, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('56', 'NATION', '民族', '14', '朝鲜族', b'1', '', 13, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('57', 'NATION', '民族', '15', '白族', b'1', '', 14, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('58', 'NATION', '民族', '16', '哈尼族', b'1', '', 15, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('59', 'NATION', '民族', '17', '哈萨克族', b'1', '', 16, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('60', 'NATION', '民族', '18', '黎族', b'1', '', 17, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('61', 'NATION', '民族', '19', '傣族', b'1', '', 18, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('62', 'NATION', '民族', '20', '畲族', b'1', '', 19, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('63', 'NATION', '民族', '21', '傈僳族', b'1', '', 20, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('64', 'NATION', '民族', '22', '仡佬族', b'1', '', 21, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('65', 'NATION', '民族', '23', '东乡族', b'1', '', 22, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('66', 'NATION', '民族', '24', '高山族', b'1', '', 23, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('67', 'NATION', '民族', '25', '拉祜族', b'1', '', 24, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('68', 'NATION', '民族', '26', '水族', b'1', '', 25, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('69', 'NATION', '民族', '27', '佤族', b'1', '', 26, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('70', 'NATION', '民族', '28', '纳西族', b'1', '', 27, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('71', 'NATION', '民族', '29', '羌族', b'1', '', 28, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('72', 'NATION', '民族', '30', '土族', b'1', '', 29, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('73', 'NATION', '民族', '31', '仫佬族', b'1', '', 30, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('74', 'NATION', '民族', '32', '锡伯族', b'1', '', 31, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('75', 'NATION', '民族', '33', '柯尔克孜族', b'1', '', 32, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('76', 'NATION', '民族', '34', '达斡尔族', b'1', '', 33, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('77', 'NATION', '民族', '35', '景颇族', b'1', '', 34, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('78', 'NATION', '民族', '36', '毛南族', b'1', '', 35, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('79', 'NATION', '民族', '37', '撒拉族', b'1', '', 36, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('80', 'NATION', '民族', '38', '塔吉克族', b'1', '', 37, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('81', 'NATION', '民族', '39', '阿昌族', b'1', '', 38, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('82', 'NATION', '民族', '40', '普米族', b'1', '', 39, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('83', 'NATION', '民族', '41', '鄂温克族', b'1', '', 40, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('84', 'NATION', '民族', '42', '怒族', b'1', '', 41, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('85', 'NATION', '民族', '43', '京族', b'1', '', 42, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('86', 'NATION', '民族', '44', '基诺族', b'1', '', 43, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('87', 'NATION', '民族', '45', '德昂族', b'1', '', 44, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('88', 'NATION', '民族', '46', '保安族', b'1', '', 45, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('89', 'NATION', '民族', '47', '俄罗斯族', b'1', '', 46, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('90', 'NATION', '民族', '48', '裕固族', b'1', '', 47, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('91', 'NATION', '民族', '49', '乌兹别克族', b'1', '', 48, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('92', 'NATION', '民族', '50', '门巴族', b'1', '', 49, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('93', 'NATION', '民族', '51', '鄂伦春族', b'1', '', 50, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('94', 'NATION', '民族', '52', '独龙族', b'1', '', 51, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('95', 'NATION', '民族', '53', '塔塔尔族', b'1', '', 52, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('96', 'NATION', '民族', '54', '赫哲族', b'1', '', 53, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('97', 'NATION', '民族', '55', '珞巴族', b'1', '', 54, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('98', 'NATION', '民族', '56', '布朗族', b'1', '', 55, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2018-03-15 20:11:04.000000');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('99', 'NATION', '民族', '57', '其他', b'1', '', 100, '', '', '', b'1', NULL, 3, '2020-03-09 23:38:29.000000', 3, '2020-03-09 23:38:29.000000');
COMMIT;

-- ----------------------------
-- Table structure for c_menu
-- ----------------------------
DROP TABLE IF EXISTS `c_menu`;
CREATE TABLE `c_menu` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `resource_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '[20-菜单 60-数据];\n@Echo(api = DICTIONARY_ITEM_FEIGN_CLASS,dictType = EchoDictType.RESOURCE_TYPE)',
  `tree_grade` int DEFAULT NULL COMMENT '树层级',
  `tree_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '树路径',
  `describe_` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `is_general` bit(1) DEFAULT b'0' COMMENT '通用菜单 \nTrue表示无需分配所有人就可以访问的',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `sort_value` int DEFAULT '1' COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单图标',
  `group_` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分组',
  `data_scope` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据范围;[01-全部 02-本单位及子级 03-本单位 04-本部门 05-本部门及子级 06-个人 07-自定义]',
  `custom_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '实现类',
  `is_def` bit(1) DEFAULT b'0' COMMENT '是否默认',
  `parentId` varchar(20) DEFAULT NULL COMMENT '父级菜单ID',
  `mpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人id',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人id',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_path` (`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单';

-- ----------------------------
-- Records of c_menu
-- ----------------------------
BEGIN;
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473632799518789', '组织机构', '20', NULL, NULL, '', b'0', 'org', '', b'1', 2, 'OrganisationIcon', '', NULL, NULL, b'0', NULL, '473632799518789.', b'0', NULL, NULL, '2023-08-31 16:16:48', NULL, '2023-08-31 16:16:48');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473633613013061', '机构管理', '20', NULL, NULL, '', b'0', 'orgs', 'org/orgs/list', b'1', 1, '', '', NULL, NULL, b'1', '473632799518789', '473632799518789.473633613013061.', b'0', NULL, NULL, '2023-08-31 16:20:06', NULL, '2023-08-31 16:20:06');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473633775972421', '岗位管理', '20', NULL, NULL, '', b'0', 'stations', 'org/stations/list', b'1', 2, '', '', NULL, NULL, b'0', '473632799518789', '473632799518789.473633775972421.', b'0', NULL, NULL, '2023-08-31 16:20:46', NULL, '2023-08-31 16:20:46');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473633960718405', '用户管理', '20', NULL, NULL, '', b'0', 'users', 'org/users/list', b'1', 3, '', '', NULL, NULL, b'0', '473632799518789', '473632799518789.473633960718405.', b'0', NULL, NULL, '2023-08-31 16:21:31', NULL, '2023-08-31 16:21:31');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473686460346437', '查看全部', '60', NULL, NULL, '', b'0', NULL, '', b'1', 1, '', '', '01', NULL, b'0', '473633775972421', '473632799518789.473633775972421.473686460346437.', b'0', NULL, NULL, '2023-08-31 19:55:08', NULL, '2023-08-31 19:55:08');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473941204222021', '查看本单位及子单位', '60', NULL, NULL, '', b'0', NULL, '', b'1', 2, '', '', '02', NULL, b'0', '473633775972421', '473632799518789.473633775972421.473941204222021.', b'0', NULL, NULL, '2023-09-01 13:11:42', NULL, '2023-09-01 13:11:42');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473941311623237', '查看本单位', '60', NULL, NULL, '', b'0', NULL, '', b'1', 3, '', '', '03', NULL, b'0', '473633775972421', '473632799518789.473633775972421.473941311623237.', b'0', NULL, NULL, '2023-09-01 13:12:08', NULL, '2023-09-01 13:12:08');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473941488152645', '查看本部门及子部门', '60', NULL, NULL, '', b'0', NULL, '', b'1', 4, '', '', '04', NULL, b'0', '473633775972421', '473632799518789.473633775972421.473941488152645.', b'0', NULL, NULL, '2023-09-01 13:12:51', NULL, '2023-09-01 13:12:51');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473941563088965', '查看本部门', '60', NULL, NULL, '', b'0', NULL, '', b'1', 5, '', '', '05', NULL, b'0', '473633775972421', '473632799518789.473633775972421.473941563088965.', b'0', NULL, NULL, '2023-09-01 13:13:09', NULL, '2023-09-01 13:13:09');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473941623590981', '查看个人', '60', NULL, NULL, '', b'0', NULL, '', b'1', 6, '', '', '06', NULL, b'0', '473633775972421', '473632799518789.473633775972421.473941623590981.', b'0', NULL, NULL, '2023-09-01 13:13:24', NULL, '2023-09-01 13:13:24');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477503721513029', '系统设置', '20', NULL, NULL, NULL, b'0', 'setting', '', b'1', 3, 'SettingIcon', NULL, NULL, NULL, b'0', NULL, '477503721513029.', b'0', NULL, NULL, '2023-09-11 14:47:37', NULL, '2023-09-11 14:47:37');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506197712965', '菜单管理', '20', NULL, NULL, NULL, b'0', 'menus', 'setting/menus/list', b'1', 1, NULL, NULL, NULL, NULL, b'1', '477503721513029', '477503721513029.477506197712965.', b'0', NULL, NULL, '2023-09-11 14:57:42', NULL, '2023-09-11 14:57:42');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506352619589', '角色管理', '20', NULL, NULL, NULL, b'0', 'roles', 'setting/roles/list', b'1', 2, NULL, NULL, NULL, NULL, b'0', '512095515308101', '512095515308101.477506352619589.', b'0', NULL, NULL, '2023-09-11 14:58:19', NULL, '2023-09-11 14:58:19');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506457538629', '字典管理', '20', NULL, NULL, NULL, b'0', 'dictionaries', 'setting/dictionaries/list', b'1', 3, NULL, NULL, NULL, NULL, b'0', '477503721513029', '477503721513029.477506457538629.', b'0', NULL, NULL, '2023-09-11 14:58:45', NULL, '2023-09-11 14:58:45');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506603237445', '行政区划', '20', NULL, NULL, NULL, b'0', 'areas', 'setting/areas/list', b'1', 4, NULL, NULL, NULL, NULL, b'0', '512103019884613', '512103019884613.477506603237445.', b'0', NULL, NULL, '2023-09-11 14:59:21', NULL, '2023-09-11 14:59:21');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506718847045', '参数管理', '20', NULL, NULL, NULL, b'0', 'parameters', 'setting/parameters/list', b'1', 5, NULL, NULL, NULL, NULL, b'0', '477503721513029', '477503721513029.477506718847045.', b'0', NULL, NULL, '2023-09-11 14:59:49', NULL, '2023-09-11 14:59:49');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('482519172976709', '个人主页', '20', NULL, NULL, '', b'0', 'home', 'home/list', b'1', 1, 'HomeIcon', NULL, NULL, NULL, b'0', NULL, '482519172976709.', b'0', NULL, NULL, '2023-09-25 18:55:32', NULL, '2023-09-25 18:55:32');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512095515308101', '权限管理', '20', NULL, NULL, NULL, b'0', 'authority', NULL, b'1', 4, 'LockIcon', NULL, NULL, NULL, b'0', NULL, '512095515308101.', b'0', NULL, NULL, '2023-12-18 08:41:59', NULL, '2023-12-18 08:41:59');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512103019884613', '基础配置', '20', NULL, NULL, NULL, b'0', 'base', NULL, b'1', 5, 'LayersIcon', NULL, NULL, NULL, b'0', NULL, '512103019884613.', b'0', NULL, NULL, '2023-12-18 09:12:31', NULL, '2023-12-18 09:12:31');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512216121036869', '资源管理', '20', NULL, NULL, NULL, b'0', 'resource', NULL, b'1', 6, 'FolderIcon', NULL, NULL, NULL, b'0', NULL, '512216121036869.', b'0', NULL, NULL, '2023-12-18 16:52:44', NULL, '2023-12-18 16:52:44');
INSERT INTO `c_menu` (`id`, `label`, `resource_type`, `tree_grade`, `tree_path`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512216970563653', '对象存储', '20', NULL, NULL, NULL, b'0', 'osscs', 'resource/osscs/list', b'1', 1, '', NULL, NULL, NULL, b'0', '512216121036869', '512216121036869.512216970563653.', b'0', NULL, NULL, '2023-12-18 16:56:11', NULL, '2023-12-18 16:56:11');
COMMIT;

-- ----------------------------
-- Table structure for c_org
-- ----------------------------
DROP TABLE IF EXISTS `c_org`;
CREATE TABLE `c_org` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `type_` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型: dictType = ORG_TYPE',
  `abbreviation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '简称',
  `parentId` varchar(20) DEFAULT NULL COMMENT '父ID',
  `mpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `sort_value` int DEFAULT '1' COMMENT '排序',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`label`) USING BTREE,
  FULLTEXT KEY `fu_path` (`mpath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='组织';

-- ----------------------------
-- Records of c_org
-- ----------------------------
BEGIN;
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465434835644485', '北京万家灯火科技有限公司', '01', '烽火万家', NULL, '465434835644485.', 1, b'0', '', '2023-08-08 12:19:12.000000', NULL, NULL, '2023-12-21 20:42:47.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465436178821189', '研发部', '02', '', '465434835644485', '465434835644485.465436178821189.', 1, b'0', '2', '2023-08-08 12:24:40.000000', NULL, NULL, '2023-09-11 15:36:46.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465436228214853', '运营部', '02', '', '465434835644485', '465434835644485.465436228214853.', 1, b'0', '', '2023-08-08 12:24:52.000000', NULL, NULL, '2023-08-08 12:24:51.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465436245590085', '市场部', '02', '', '465434835644485', '465434835644485.465436245590085.', 1, b'0', '', '2023-08-08 12:24:56.000000', NULL, NULL, '2023-08-08 12:24:55.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465436307472453', '语音部', '02', '', '465434835644485', '465434835644485.465436307472453.', 1, b'0', '', '2023-08-08 12:25:11.000000', NULL, NULL, '2023-08-08 12:25:11.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465436583051333', '采购部', '02', '', '465436178821189', '465434835644485.465436178821189.465436583051333.', 2, b'0', '', '2023-08-08 12:26:18.000000', NULL, NULL, '2023-08-09 17:30:31.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465436617269317', '执行部', '02', '', '465436178821189', '465434835644485.465436178821189.465436617269317.', 1, b'0', '', '2023-08-08 12:26:27.000000', NULL, NULL, '2023-08-09 17:30:27.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465544521830469', '重庆泛络科技有限公司', '01', '泛络科技', NULL, '465544521830469.', 1, b'0', '', '2023-08-08 19:45:31.000000', NULL, NULL, '2023-08-12 17:36:33.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('465545335124037', '开发部', '02', '', '465544521830469', '465544521830469.465545335124037.', 1, b'0', '', '2023-08-08 19:48:49.000000', NULL, NULL, '2023-09-11 15:36:54.000000', NULL);
INSERT INTO `c_org` (`id`, `label`, `type_`, `abbreviation`, `parentId`, `mpath`, `sort_value`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('466791001468997', '开发部2-c1', '01', '', '465545335124037', '466791001468997.', 1, b'1', '', '2023-08-12 08:17:27.000000', NULL, NULL, '2023-08-12 08:17:26.000000', NULL);
COMMIT;

-- ----------------------------
-- Table structure for c_ossc
-- ----------------------------
DROP TABLE IF EXISTS `c_ossc`;
CREATE TABLE `c_ossc` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '资源编码',
  `category` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '种类',
  `bucket_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '空间名',
  `access_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ak',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'sk',
  `endpoint` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '资源地址',
  `describe` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人id',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人id',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of c_ossc
-- ----------------------------
BEGIN;
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512293694996549', 'qiniu-panlore', '2', 'figure-bed', 'x6gL6f28tRdRszYJ7WMB_3RvG_vajTODD0RwvWWg', 'H0fxWDsOF6E_aqefAh5XRpQpLrj0vPxOZ3oCdwRv', 'http://s3.cn-south-1.qiniucs.com', NULL, b'1', NULL, NULL, '2023-12-18 22:08:54.664000', NULL, '2023-12-21 19:56:34.000000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512293825183813', 'ali-kangod', '3', 'kd-resources', 'LTAI5tNaV4WeFuBzc4vtEc9m', 'ZKmNmyvhEu35WbHwVRgxMpVk3XBkDu', 'https://oss-cn-chengdu.aliyuncs.com', NULL, b'0', NULL, NULL, '2023-12-18 22:08:54.664000', NULL, '2023-12-21 15:10:29.000000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209566588997', '123', '2', '213', '31212', '123', 'dadqwe', NULL, b'1', NULL, NULL, '2023-12-21 12:15:04.343000', NULL, '2023-12-21 12:20:10.000000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209590362181', '3213', '2', '3123', '3112', '3213', 'dazzaz', '312', b'1', NULL, NULL, '2023-12-21 12:15:10.147000', NULL, '2023-12-21 12:20:14.000000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209620418629', '3123', '3', '3123', '3123', '123', 'dqwdqzzz', '3123', b'1', NULL, NULL, '2023-12-21 12:15:17.485000', NULL, '2023-12-21 12:20:18.000000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209982296133', 'dsadqwd', '3', 'sadsad', 'sadsad', 'sadsad', 'asdasd', NULL, b'1', NULL, NULL, '2023-12-21 12:16:45.834000', NULL, '2023-12-21 12:16:45.834000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513210013646917', 'sadsadqwqw', '1', 'asdas', 'sadas', 'dasasd', 'qweqwe', NULL, b'1', NULL, NULL, '2023-12-21 12:16:53.488000', NULL, '2023-12-21 12:16:53.488000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513210049114181', '12312', '3', 'asdsa', '1111', '111', 'dasd', NULL, b'1', NULL, NULL, '2023-12-21 12:17:02.147000', NULL, '2023-12-21 12:17:02.147000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513210075594821', '133312321', '3', '333', '33', '123213', '3333', NULL, b'1', NULL, NULL, '2023-12-21 12:17:08.612000', NULL, '2023-12-21 12:17:08.612000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513210132959301', '312312dqwd123', '2', '3123213', '123123', '123123', '12312', NULL, b'1', NULL, NULL, '2023-12-21 12:17:22.617000', NULL, '2023-12-21 12:17:22.617000');
INSERT INTO `c_ossc` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513210658504773', '12312axadd', '3', '3213', '21312', 'dasd', '321321', NULL, b'1', NULL, NULL, '2023-12-21 12:19:30.924000', NULL, '2023-12-21 12:19:30.924000');
COMMIT;

-- ----------------------------
-- Table structure for c_parameter
-- ----------------------------
DROP TABLE IF EXISTS `c_parameter`;
CREATE TABLE `c_parameter` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `key_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数名称',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人id',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人id',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_key` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置';

-- ----------------------------
-- Records of c_parameter
-- ----------------------------
BEGIN;
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1', 'LoginPolicy', 'MANY', '登录策略', 'ONLY_ONE:一个用户只能登录一次; MANY:用户可以任意登录; ONLY_ONE_CLIENT:一个用户在一个应用只能登录一次', b'1', b'1', NULL, 1, '2020-04-02 21:56:19.000000', 2, '2020-11-30 09:14:44.000000');
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('460773244321861', 'kt11', 'vt', 'nt', 'dt', b'1', b'1', NULL, NULL, '2023-07-26 08:11:08.000000', NULL, '2023-07-26 08:11:08.000000');
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('460773255213125', 'kt12', 'vt', 'nt', 'dt', b'1', b'1', NULL, NULL, '2023-07-26 08:11:11.000000', NULL, '2023-09-11 17:31:20.000000');
COMMIT;

-- ----------------------------
-- Table structure for c_resource
-- ----------------------------
DROP TABLE IF EXISTS `c_resource`;
CREATE TABLE `c_resource` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `menu_id` varchar(20) DEFAULT NULL COMMENT '菜单\n#c_menu',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `readonly_` bit(1) DEFAULT b'1' COMMENT '内置',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人id',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人id',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='资源';

-- ----------------------------
-- Records of c_resource
-- ----------------------------
BEGIN;
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477217600217157', 'org:station:listRelate;org:org:tree', '查询', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:23:23.192204', NULL, '2023-09-11 16:56:03.000000');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477217670877253', 'org:station:delete', '删除', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:23:40.441319', NULL, '2023-09-11 15:47:53.780047');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477218072793157', 'org:station:update', '更新', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:25:18.569885', NULL, '2023-09-10 19:25:18.569885');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477218174779461', 'org:station:restore', '恢复', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:25:43.463777', NULL, '2023-09-11 15:48:01.291357');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477218292002885', 'org:station:store', '新建', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:26:12.087373', NULL, '2023-09-11 15:48:03.515269');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507604250693', 'org:org:store', '新建', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:03:24.961323', NULL, '2023-09-11 15:05:15.411599');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507692666949', 'org:org:delete', '删除', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:03:46.540311', NULL, '2023-09-11 15:05:18.660378');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507733999685', 'org:org:update', '更新', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:03:56.633563', NULL, '2023-09-11 15:05:27.526154');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507851591749', 'org:org:tree', '查询', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:04:25.341742', NULL, '2023-09-11 15:37:23.905993');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507980079173', 'org:org:restore', '恢复', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:04:56.710746', NULL, '2023-09-11 15:04:56.710746');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511069552709', 'org:user:store', '新建', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:17:30.977275', NULL, '2023-09-11 15:23:56.247615');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511119458373', 'org:user:delete', '删除', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:17:43.163796', NULL, '2023-09-11 15:23:56.265554');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511143804997', 'org:user:update;org:org:tree;org:station:list;oss:getAliOSSInfo', '更新', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:17:49.109086', NULL, '2023-09-12 10:22:56.730454');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511168852037', 'org:user:listRelate;org:org:tree;system:dict:listMultiType', '查询', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:17:55.225303', NULL, '2023-09-11 16:55:01.295002');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511281844293', 'org:user:restore', '恢复', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:18:22.807894', NULL, '2023-09-11 16:58:26.983419');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511529672773', 'system:menu:store;system:resource:store', '新建', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:23.313306', NULL, '2023-09-11 16:57:43.231233');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511553785925', 'system:menu:delete;system:resource:delete', '删除', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:29.200571', NULL, '2023-09-11 16:57:23.630356');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511581478981', 'system:menu:update;system:resource:update', '更新', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:35.973549', NULL, '2023-09-11 16:56:37.744049');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511604383813', 'system:menu:tree;system:dict:listMultiType;system:resource:list', '查询', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:41.550784', NULL, '2023-12-18 21:02:55.619769');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511630045253', 'system:menu:restore;system:resource:restore', '恢复', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:47.819426', NULL, '2023-09-11 16:58:34.546922');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511711989829', 'org:role:store', '新建', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:07.823581', NULL, '2023-09-11 18:11:11.194779');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511752441925', 'org:role:delete', '删除', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:17.699393', NULL, '2023-09-11 18:11:11.210230');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511774003269', 'org:role:update', '更新', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:22.962009', NULL, '2023-09-11 18:11:11.213518');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511803678789', 'org:role:listRelate;org:dict:list;org:user:listRelate;org:roleAuthority:listRoleAuthorityIdByRoleId;org:menu:tree', '查询', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:30.206552', NULL, '2023-09-16 19:52:57.721355');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511829577797', 'org:role:restore', '恢复', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:36.530838', NULL, '2023-09-11 18:11:11.220109');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511934677061', 'system:dict:store', '新建', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:02.195987', NULL, '2023-09-11 16:55:01.337443');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511958855749', 'system:dict:delete', '删除', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:08.093093', NULL, '2023-09-11 16:55:01.340699');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511983927365', 'system:dict:update', '更新', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:14.213886', NULL, '2023-09-11 16:55:01.343733');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512014274629', 'system:dict:list;system:dict:listType', '查询', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:21.624736', NULL, '2023-09-11 17:22:08.683529');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512048853061', 'system:dict:restore', '恢复', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:30.061737', NULL, '2023-09-11 16:55:01.358529');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512179880005', 'system:area:store', '新建', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:02.053797', NULL, '2023-09-11 16:55:01.364444');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512207384645', 'system:area:delete', '删除', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:08.768587', NULL, '2023-09-11 16:55:01.367244');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512237158469', 'system:area:update', '更新', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:16.037733', NULL, '2023-09-11 16:55:01.369986');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512256487493', 'system:area:tree;system:dict:list', '查询', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:20.756462', NULL, '2023-09-11 17:28:57.455117');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512284303429', 'system:area:restore', '恢复', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:27.546514', NULL, '2023-09-11 16:55:01.375542');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512309313605', 'system:area:detail', '详情', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:33.655198', NULL, '2023-09-11 16:55:01.378260');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512436150341', 'system:param:store', '新建', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:04.625978', NULL, '2023-09-11 16:55:01.380894');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512472305733', 'system:param:delete', '删除', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:13.445931', NULL, '2023-09-11 16:55:01.383586');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512492404805', 'system:param:detail;system:param:update', '更新', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:18.357448', NULL, '2023-09-11 17:31:59.436023');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512510414917', 'system:param:list', '查询', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:22.749892', NULL, '2023-09-11 16:55:01.389235');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512532643909', 'system:param:restore', '恢复', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:28.177868', NULL, '2023-09-11 16:55:01.392238');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477524245332037', 'org:station:exportExcel', '导出', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-11 16:11:07.727292', NULL, '2023-09-11 16:11:07.727292');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477524312936517', 'org:station:importExcel', '导入', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-11 16:11:24.228134', NULL, '2023-09-11 16:11:24.228134');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477540145778757', 'org:userRole:listUserRoleByRoleId;org:roleAuthority:listRoleAuthorityIdByRoleId;org:userRole:saveListAfterDelete', '分配角色', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 17:15:49.679589', NULL, '2023-09-16 19:52:57.737020');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477540812017733', 'org:roleAuthority:listRoleAuthorityIdByRoleId;system:resource:list;org:roleAuthority:saveBatchRoleAutority', '分配资源', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 17:18:32.326606', NULL, '2023-09-16 19:52:57.739896');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('479348660256837', 'org:roleAuthority:listRoleMenuByRoleIds', '角色菜单', '473632799518789', '权限路由时，查询用户对应角色的菜单数据', b'0', NULL, NULL, '2023-09-16 19:54:41.536526', NULL, '2023-09-16 19:55:38.000000');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512263975366725', 'resource:ossc:store', '新建', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:07:27.136296', NULL, '2023-12-18 20:07:27.136296');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512264058916933', 'resource:ossc:delete', '删除', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:07:47.518657', NULL, '2023-12-18 20:07:47.518657');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512264133689413', 'resource:ossc:update', '更新', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:08:05.772686', NULL, '2023-12-18 20:08:05.772686');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512264316051525', 'resource:ossc:list;resource:ossc:listRelate', '查询', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:08:50.296396', NULL, '2023-12-20 10:04:07.076515');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512264378806341', 'resource:ossc:restore', '恢复', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:09:05.620309', NULL, '2023-12-18 20:09:05.620309');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512264452317253', 'resource:ossc:detail', '详情', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:09:23.564829', NULL, '2023-12-18 20:09:23.564829');
COMMIT;

-- ----------------------------
-- Table structure for c_role
-- ----------------------------
DROP TABLE IF EXISTS `c_role`;
CREATE TABLE `c_role` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `category` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色类别;[10-功能角色 20-桌面角色 30-数据角色]',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编码',
  `describe_` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `readonly_` bit(1) DEFAULT b'0' COMMENT '内置角色',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人id',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人id',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色';

-- ----------------------------
-- Records of c_role
-- ----------------------------
BEGIN;
INSERT INTO `c_role` (`id`, `category`, `name`, `code`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('1', '10', '超级管理员', 'SUPER_ADMIN', '内置管理员(二次开发必须保留)', b'1', b'1', NULL, 1, '2020-11-22 23:46:00.000000', 1, '2020-11-22 23:46:00.000000');
INSERT INTO `c_role` (`id`, `category`, `name`, `code`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('2', '10', '平台管理员', 'PT_ADMIN', '内置运营专用平台管理员(二次开发必须保留)', b'1', b'1', NULL, 1, '2020-11-22 23:46:00.000000', 1, '2020-11-22 23:46:00.000000');
INSERT INTO `c_role` (`id`, `category`, `name`, `code`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('3', '10', '普通管理员', 'GENERAL_ADMIN', '演示用的', b'1', b'1', NULL, 1, '2020-11-22 23:46:00.000000', 1, '2020-11-22 23:46:00.000000');
INSERT INTO `c_role` (`id`, `category`, `name`, `code`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('4', '10', '普通用户', 'NORMAL', '演示用的', b'1', b'1', NULL, 1, '2020-11-22 23:46:00.000000', 1, '2020-11-22 23:46:00.000000');
INSERT INTO `c_role` (`id`, `category`, `name`, `code`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('472873866838085', '10', 'xx03', 'XXQ03', '', b'1', b'0', '2023-08-29 12:48:46.000000', NULL, '2023-08-29 12:48:41.000000', NULL, '2023-08-29 12:48:46.000000');
COMMIT;

-- ----------------------------
-- Table structure for c_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `c_role_authority`;
CREATE TABLE `c_role_authority` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `authority_id` varchar(20) NOT NULL COMMENT '资源id \n#c_resource #c_menu',
  `authority_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限类型 \n#AuthorizeType{MENU:菜单;RESOURCE:资源;}',
  `role_id` varchar(20) NOT NULL COMMENT '角色id \n#c_role',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_authority` (`authority_id`,`authority_type`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色的资源';

-- ----------------------------
-- Records of c_role_authority
-- ----------------------------
BEGIN;
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('477421823782981', '473633775972421', 'MENU', '3', '2023-09-11 09:14:22.447000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('477421823782982', '473686460346437', 'MENU', '3', '2023-09-11 09:14:22.447000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('477421823782983', '473941204222021', 'MENU', '3', '2023-09-11 09:14:22.447000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('477421823782984', '473941311623237', 'MENU', '3', '2023-09-11 09:14:22.447000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612814405', '473686460346437', 'MENU', '2', '2023-10-12 09:34:58.441000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818501', '473941204222021', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818502', '473941311623237', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818503', '473941488152645', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818504', '473632799518789', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818505', '473633613013061', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818506', '473633775972421', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818507', '473633960718405', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818508', '482519172976709', 'MENU', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818509', '477507604250693', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818510', '477507692666949', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818511', '477507733999685', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818512', '477507851591749', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818513', '477507980079173', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818514', '477217600217157', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818515', '477217670877253', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818516', '477218072793157', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818517', '477218174779461', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818518', '477218292002885', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818519', '477524245332037', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818520', '477524312936517', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818521', '477511069552709', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818522', '477511119458373', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818523', '477511143804997', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818524', '477511168852037', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612818525', '477511281844293', 'RESOURCE', '2', '2023-10-12 09:34:58.442000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612822597', '477511529672773', 'RESOURCE', '2', '2023-10-12 09:34:58.443000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612822598', '477511553785925', 'RESOURCE', '2', '2023-10-12 09:34:58.443000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612822599', '477511581478981', 'RESOURCE', '2', '2023-10-12 09:34:58.443000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612822600', '477511604383813', 'RESOURCE', '2', '2023-10-12 09:34:58.443000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612822601', '477511630045253', 'RESOURCE', '2', '2023-10-12 09:34:58.443000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612822602', '477511803678789', 'RESOURCE', '2', '2023-10-12 09:34:58.443000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('488397612822603', '479348660256837', 'RESOURCE', '2', '2023-10-12 09:34:58.443000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101253', '473632799518789', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101254', '473633613013061', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101255', '473633775972421', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101256', '473686460346437', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101257', '473941204222021', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101258', '473941311623237', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101259', '473941488152645', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101260', '473633960718405', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101261', '473941563088965', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101262', '473941623590981', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101263', '477503721513029', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101264', '477506197712965', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339101265', '477506352619589', 'MENU', '1', '2023-12-18 20:13:00.054000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105349', '477506457538629', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105350', '477506603237445', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105351', '477506718847045', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105352', '482519172976709', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105353', '512095515308101', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105354', '512103019884613', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105355', '512216121036869', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105356', '512216970563653', 'MENU', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105357', '477507604250693', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105358', '477507692666949', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105359', '477507733999685', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105360', '477507851591749', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105361', '477507980079173', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105362', '477217600217157', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105363', '477217670877253', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105364', '477218072793157', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105365', '477218174779461', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105366', '477218292002885', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105367', '477524245332037', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105368', '477524312936517', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105369', '477511069552709', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105370', '477511119458373', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105371', '477511143804997', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105372', '477511168852037', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105373', '477511281844293', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105374', '477511529672773', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105375', '477511553785925', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105376', '477511581478981', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105377', '477511604383813', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105378', '477511630045253', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105379', '477511711989829', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105380', '477511752441925', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105381', '477511774003269', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105382', '477511803678789', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105383', '477511829577797', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105384', '477540145778757', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105385', '477540812017733', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105386', '477511934677061', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105387', '477511958855749', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105388', '477511983927365', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105389', '477512014274629', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105390', '477512048853061', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105391', '477512179880005', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105392', '477512207384645', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105393', '477512237158469', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105394', '477512256487493', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105395', '477512284303429', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105396', '477512309313605', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105397', '477512436150341', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105398', '477512472305733', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105399', '477512492404805', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105400', '477512510414917', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105401', '477512532643909', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105402', '479348660256837', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105403', '512263975366725', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105404', '512264058916933', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105405', '512264133689413', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105406', '512264316051525', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339105407', '512264378806341', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('512265339109445', '512264452317253', 'RESOURCE', '1', '2023-12-18 20:13:00.055000', NULL);
COMMIT;

-- ----------------------------
-- Table structure for c_station
-- ----------------------------
DROP TABLE IF EXISTS `c_station`;
CREATE TABLE `c_station` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `org_id` varchar(20) DEFAULT NULL COMMENT '机构',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人',
  `created_org_id` bigint DEFAULT NULL COMMENT '创建者所属机构',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='岗位';

-- ----------------------------
-- Records of c_station
-- ----------------------------
BEGIN;
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('1', '总经理', '465436178821189', b'1', '2', '2020-11-23 00:06:20.000000', NULL, 1, '2023-08-08 18:45:50.000000', 1, 1);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465437477158981', 'Java后端开发', '465436617269317', b'1', '', '2023-08-08 12:29:57.000000', NULL, NULL, '2023-08-08 12:30:14.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465437603893317', 'React前端开发', '465436617269317', b'1', '', '2023-08-08 12:30:28.000000', NULL, NULL, '2023-08-08 12:30:28.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465438225875013', '测试工程师', '465436617269317', b'1', '', '2023-08-08 12:32:59.000000', NULL, NULL, '2023-08-08 12:32:59.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465438323720261', 'iOS开发', '465436617269317', b'1', '', '2023-08-08 12:33:23.000000', NULL, NULL, '2023-08-08 12:33:23.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465438388564037', 'Android开发', '465436617269317', b'1', '', '2023-08-08 12:33:39.000000', NULL, NULL, '2023-08-08 12:33:39.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465438450597957', 'DBA', '465436178821189', b'1', '', '2023-08-08 12:33:54.000000', NULL, NULL, '2023-08-08 12:33:54.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465440005341253', 'C++开发', '465436617269317', b'1', '', '2023-08-08 12:40:14.000000', NULL, NULL, '2023-08-08 12:40:14.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465440096305221', '跑腿小弟', '465436583051333', b'1', '', '2023-08-08 12:40:36.000000', NULL, NULL, '2023-08-08 12:40:36.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465440157552709', '运维工程师', '465436228214853', b'1', '', '2023-08-08 12:40:51.000000', NULL, NULL, '2023-08-08 12:40:51.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465440211255365', '实施工程师', '465436617269317', b'1', '', '2023-08-08 12:41:04.000000', NULL, NULL, '2023-08-08 12:41:04.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('465494256455749', 'NextJS后端开发', '465436617269317', b'1', '', '2023-08-08 16:20:59.000000', NULL, NULL, '2023-08-08 16:20:59.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('469665882329157', '岗位c12', '465544521830469', b'1', '', '2023-08-20 11:15:22.000000', NULL, NULL, '2023-08-20 11:15:22.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('469665882439749', '岗位c13', '465436178821189', b'1', '', '2023-08-20 11:15:22.000000', NULL, NULL, '2023-08-20 11:15:22.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('469665882521669', '岗位c14', '465436228214853', b'0', '', '2023-08-20 11:15:22.000000', NULL, NULL, '2023-08-20 11:15:22.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('469665882591301', '岗位c15', '465544521830469', b'0', '', '2023-08-20 11:15:22.000000', NULL, NULL, '2023-08-20 11:15:22.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('469665882689605', '岗位c16', '465544521830469', b'1', '', '2023-08-20 11:15:22.000000', NULL, NULL, '2023-08-20 11:15:22.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('470112933056581', '123asd', '465544521830469', b'1', '', '2023-08-21 17:34:25.000000', NULL, NULL, '2023-08-21 17:34:25.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('470118904778821', 'dasd', NULL, b'1', '', '2023-08-21 17:58:43.000000', NULL, NULL, '2023-08-21 17:58:43.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('477524013469765', '1', '465436307472453', b'1', NULL, '2023-09-11 16:10:11.101000', NULL, NULL, '2023-09-11 16:10:11.101000', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `org_id` varchar(20) DEFAULT NULL COMMENT '机构',
  `station_id` varchar(20) DEFAULT NULL COMMENT '岗位',
  `readonly` bit(1) NOT NULL DEFAULT b'0' COMMENT '内置',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'M' COMMENT '性别 \n#Sex{W:女;M:男;N:未知}',
  `state` bit(1) DEFAULT b'1' COMMENT '状态',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像',
  `nation` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '民族: dictType = NATION',
  `education` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学历: dictType = EDUCATION',
  `position_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '职位状态: dictType = POSITION_STATUS',
  `work_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工作描述',
  `password_error_last_time` datetime DEFAULT NULL COMMENT '最后一次输错密码时间',
  `password_error_num` int DEFAULT '0' COMMENT '密码错误次数',
  `password_expire_time` datetime DEFAULT NULL COMMENT '密码过期时间',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码盐',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人id',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人id',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `created_org_id` bigint DEFAULT NULL COMMENT '创建者所属机构',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of c_user
-- ----------------------------
BEGIN;
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('1', 'lampAdmin', '内置管理员z', '465436245590085', '465437603893317', b'1', 'yk625x@163.com', '15217781234', 'W', b'1', 'https://water-drop-resources.oss-cn-chengdu.aliyuncs.com/images/rc-upload-1694484623067-25.jpg', '07', '08', '02', '只工作，不上班。', '2020-11-24 19:08:45', 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2020-11-24 19:08:45', NULL, 1, '2020-11-22 23:03:15.000000', 1, '2023-09-12 10:26:27.000000', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('2', 'lamp', '超级管理员', '465436228214853', '1', b'0', '5', '3', 'N', b'1', 'https://water-drop-resources.oss-cn-chengdu.aliyuncs.com/images/rc-upload-1692000923457-49.png', '02', '04', '03', '只工作，不上班。', NULL, 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2023-06-25 17:00:10', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2023-09-10 14:29:38.056303', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('3', 'lamp_pt', '平台管理员', '465544521830469', '465438323720261', b'0', '2', '3', 'W', b'1', 'https://water-drop-resources.oss-cn-chengdu.aliyuncs.com/images/rc-upload-1702627719718-5.ico', '05', '06', '02', '只工作，不上班。', '2022-06-01 12:46:59', 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2022-06-01 12:46:59', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2023-12-15 16:09:29.000000', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('4', 'general', '普通管理员', '465436178821189', '465438388564037', b'0', '', '', 'N', b'1', 'https://water-drop-resources.oss-cn-chengdu.aliyuncs.com/images/rc-upload-1692000923457-61.jpg', '01', '01', '01', '只工作，不上班。', '2022-06-05 21:47:47', 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2022-06-05 21:47:47', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2023-08-23 09:43:20.000000', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('5', 'normal', '普通用户', '465436178821189', '1', b'0', '', '', 'M', b'1', 'https://water-drop-resources.oss-cn-chengdu.aliyuncs.com/images/rc-upload-1692000923457-73.png', '02', '02', '02', '只工作，不上班。', '2022-01-27 12:21:39', 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2022-01-27 12:21:39', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2023-09-11 16:17:46.000000', 1);
COMMIT;

-- ----------------------------
-- Table structure for c_user_role
-- ----------------------------
DROP TABLE IF EXISTS `c_user_role`;
CREATE TABLE `c_user_role` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `role_id` varchar(20) NOT NULL COMMENT '角色\n#c_role',
  `user_id` varchar(20) NOT NULL COMMENT '用户\n#c_user',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_role` (`role_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色分配\r\n账号角色绑定';

-- ----------------------------
-- Records of c_user_role
-- ----------------------------
BEGIN;
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('477552131289157', '1', '2', NULL, NULL, '2023-09-11 18:04:35.803000');
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('477552131289158', '1', '1', NULL, NULL, '2023-09-11 18:04:35.803000');
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('477554458931269', '4', '1', NULL, NULL, '2023-09-11 18:14:04.075000');
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('477554796138565', '2', '3', NULL, NULL, '2023-09-11 18:15:26.401000');
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('477554796138566', '2', '2', NULL, NULL, '2023-09-11 18:15:26.401000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
