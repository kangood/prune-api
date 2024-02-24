/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : prune

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 24/02/2024 11:41:41
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
INSERT INTO `c_area` (`id`, `code`, `label`, `full_name`, `sort_value`, `longitude`, `latitude`, `level_`, `source_`, `state`, `parentId`, `mpath`, `deleted_at`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES ('466895553298501', '024', '三合街道', '', 1, '', '', '05', '02', b'0', '466895356276805', '465175766999109.465177551310917.466895356276805.466895553298501.', NULL, '2023-08-12 15:22:52.000000', NULL, '2024-02-20 19:34:07.000000', NULL);
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
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495302', 'AREA_LEVEL', '行政区划', '01', '国家', b'1', '', 1, '', '', '', b'1', NULL, 3, '2020-01-20 15:12:57.000000', 3, '2024-02-09 20:34:01.455964');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495303', 'AREA_LEVEL', '行政区划', '02', '省份/直辖市', b'1', '', 2, '', '', '', b'1', NULL, 3, '2020-01-20 15:13:45.000000', 3, '2024-02-09 20:34:01.464323');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495304', 'AREA_LEVEL', '行政区划', '03', '地市', b'1', '', 3, '', '', '', b'1', NULL, 3, '2020-01-20 15:14:16.000000', 3, '2024-02-09 20:34:01.465573');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495305', 'AREA_LEVEL', '行政区划', '04', '区县', b'1', '', 4, '', '', '', b'1', NULL, 3, '2020-01-20 15:14:54.000000', 3, '2024-02-09 20:34:01.466758');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495306', 'AREA_LEVEL', '行政区划', '05', '乡镇', b'1', '', 5, '', '', '', b'1', NULL, 3, '2020-03-09 23:33:46.000000', 3, '2024-02-09 20:34:01.467812');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495307', 'EDUCATION', '学历', '01', '小学', b'1', '', 1, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:13.000000', 3, '2024-02-09 20:34:01.468882');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495308', 'EDUCATION', '学历', '02', '中学', b'1', '', 2, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:32.000000', 3, '2024-02-09 20:34:01.469951');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495309', 'EDUCATION', '学历', '03', '高中', b'1', '', 3, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:40.000000', 3, '2024-02-09 20:34:01.470859');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495310', 'EDUCATION', '学历', '04', '专科', b'1', '', 4, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2024-02-09 20:34:01.471947');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495311', 'EDUCATION', '学历', '05', '本科', b'1', '', 5, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:19.000000', 1, '2024-02-09 20:34:01.472872');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495312', 'EDUCATION', '学历', '06', '硕士', b'1', '', 6, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2024-02-09 20:34:01.473858');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495313', 'EDUCATION', '学历', '07', '博士', b'1', '', 7, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2024-02-09 20:34:01.474882');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495314', 'EDUCATION', '学历', '08', '博士后', b'1', '', 8, '', '', '', b'1', NULL, 1, '2019-06-04 11:36:29.000000', 1, '2024-02-09 20:34:01.475948');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495315', 'EDUCATION', '学历', '20', '其他', b'1', '', 20, '', '', '', b'1', NULL, 3, '2020-03-09 23:34:54.000000', 3, '2024-02-09 20:34:01.476970');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495316', 'ORG_TYPE', '机构类型', '01', '单位', b'1', '', 1, '', '', '', b'1', NULL, 1, '2020-11-23 21:13:17.000000', 1, '2024-02-09 20:34:01.477926');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495317', 'ORG_TYPE', '机构类型', '02', '部门', b'1', '', 2, '', '', '', b'1', NULL, 1, '2020-11-23 21:13:17.000000', 1, '2024-02-09 20:34:01.478991');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495318', 'NATION', '民族', '01', '汉族', b'1', '', 0, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.480043');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495319', 'NATION', '民族', '02', '壮族', b'1', '', 1, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.481006');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495320', 'NATION', '民族', '03', '满族', b'1', '', 2, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.481957');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495321', 'NATION', '民族', '04', '回族', b'1', '', 3, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.483008');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495322', 'NATION', '民族', '05', '苗族', b'1', '', 4, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.483949');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495323', 'NATION', '民族', '06', '维吾尔族', b'1', '', 5, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.484887');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495324', 'NATION', '民族', '07', '土家族', b'1', '', 6, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.485814');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495325', 'NATION', '民族', '08', '彝族', b'1', '', 7, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.486836');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495326', 'NATION', '民族', '09', '蒙古族', b'1', '', 8, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.487763');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495327', 'NATION', '民族', '10', '藏族', b'1', '', 9, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.488672');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495328', 'NATION', '民族', '11', '布依族', b'1', '', 10, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.489607');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495329', 'NATION', '民族', '12', '侗族', b'1', '', 11, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.490498');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495330', 'NATION', '民族', '13', '瑶族', b'1', '', 12, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.491534');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495331', 'NATION', '民族', '14', '朝鲜族', b'1', '', 13, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.492553');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495332', 'NATION', '民族', '15', '白族', b'1', '', 14, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.493519');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495333', 'NATION', '民族', '16', '哈尼族', b'1', '', 15, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.494720');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495334', 'NATION', '民族', '17', '哈萨克族', b'1', '', 16, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.495752');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495335', 'NATION', '民族', '18', '黎族', b'1', '', 17, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.496910');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495336', 'NATION', '民族', '19', '傣族', b'1', '', 18, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.497888');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495337', 'NATION', '民族', '20', '畲族', b'1', '', 19, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.498890');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495338', 'NATION', '民族', '21', '傈僳族', b'1', '', 20, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.499794');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495339', 'NATION', '民族', '22', '仡佬族', b'1', '', 21, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.500772');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495340', 'NATION', '民族', '23', '东乡族', b'1', '', 22, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.501659');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495341', 'NATION', '民族', '24', '高山族', b'1', '', 23, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.502553');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495342', 'NATION', '民族', '25', '拉祜族', b'1', '', 24, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.503481');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495343', 'NATION', '民族', '26', '水族', b'1', '', 25, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.504425');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495344', 'NATION', '民族', '27', '佤族', b'1', '', 26, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.505357');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495345', 'NATION', '民族', '28', '纳西族', b'1', '', 27, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.506269');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495346', 'NATION', '民族', '29', '羌族', b'1', '', 28, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.507215');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495347', 'NATION', '民族', '30', '土族', b'1', '', 29, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.508501');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495348', 'NATION', '民族', '31', '仫佬族', b'1', '', 30, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.509979');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495349', 'NATION', '民族', '32', '锡伯族', b'1', '', 31, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.511072');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495350', 'NATION', '民族', '33', '柯尔克孜族', b'1', '', 32, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.512100');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495351', 'NATION', '民族', '34', '达斡尔族', b'1', '', 33, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.513239');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495352', 'NATION', '民族', '35', '景颇族', b'1', '', 34, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.514271');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495353', 'NATION', '民族', '36', '毛南族', b'1', '', 35, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.515373');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495354', 'NATION', '民族', '37', '撒拉族', b'1', '', 36, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.516310');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495355', 'NATION', '民族', '38', '塔吉克族', b'1', '', 37, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.517370');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495356', 'NATION', '民族', '39', '阿昌族', b'1', '', 38, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.518372');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495357', 'NATION', '民族', '40', '普米族', b'1', '', 39, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.519359');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495358', 'NATION', '民族', '41', '鄂温克族', b'1', '', 40, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.520352');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495359', 'NATION', '民族', '42', '怒族', b'1', '', 41, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.521297');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495360', 'NATION', '民族', '43', '京族', b'1', '', 42, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.522230');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495361', 'NATION', '民族', '44', '基诺族', b'1', '', 43, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.523443');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495362', 'NATION', '民族', '45', '德昂族', b'1', '', 44, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.524421');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495363', 'NATION', '民族', '46', '保安族', b'1', '', 45, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.525471');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495364', 'NATION', '民族', '47', '俄罗斯族', b'1', '', 46, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.526551');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495365', 'NATION', '民族', '48', '裕固族', b'1', '', 47, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.527621');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495366', 'NATION', '民族', '49', '乌兹别克族', b'1', '', 48, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.528576');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495367', 'NATION', '民族', '50', '门巴族', b'1', '', 49, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.529670');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495368', 'NATION', '民族', '51', '鄂伦春族', b'1', '', 50, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.530606');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495369', 'NATION', '民族', '52', '独龙族', b'1', '', 51, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.531573');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495370', 'NATION', '民族', '53', '塔塔尔族', b'1', '', 52, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.532647');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495371', 'NATION', '民族', '54', '赫哲族', b'1', '', 53, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.533757');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495372', 'NATION', '民族', '55', '珞巴族', b'1', '', 54, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.534717');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495373', 'NATION', '民族', '56', '布朗族', b'1', '', 55, '', '', '', b'1', NULL, 1, '2018-03-15 20:11:01.000000', 1, '2024-02-09 20:34:01.535685');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495374', 'NATION', '民族', '57', '其他', b'1', '', 100, '', '', '', b'1', NULL, 3, '2020-03-09 23:38:29.000000', 3, '2024-02-09 20:34:01.536739');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495375', 'POSITION_STATUS', '职位状态', '01', '在职', b'1', '', 1, '', '', '', b'1', NULL, 1, '2019-06-04 11:38:16.000000', 1, '2024-02-09 20:34:01.537829');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495376', 'POSITION_STATUS', '职位状态', '02', '请假', b'1', '', 2, '', '', '', b'1', NULL, 3, '2020-03-09 23:39:30.000000', 3, '2024-02-09 20:34:01.538909');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495377', 'POSITION_STATUS', '职位状态', '03', '离职', b'1', '', 3, '', '', '', b'1', NULL, 1, '2019-06-04 11:38:50.000000', 1, '2024-02-09 20:34:01.540206');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495378', 'AREA_SOURCE', '地区数据来源', '01', '爬取', b'1', '', 1, '', '', '', b'1', NULL, 2, '2023-06-27 11:29:45.000000', 2, '2024-02-09 20:34:01.541263');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495379', 'AREA_SOURCE', '地区数据来源', '02', '新增', b'1', '', 1, '', '', '', b'1', NULL, 2, '2023-06-27 11:31:24.000000', 2, '2024-02-09 20:34:01.542342');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495380', 'OSSC_CATEGORY', 'OSSC种类', '00', '', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:40:55.512000', NULL, '2024-02-09 20:34:01.543298');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495381', 'OSSC_CATEGORY', 'OSSC种类', '1', 'aliyun', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:51:30.510000', NULL, '2024-02-09 20:34:01.544299');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495382', 'OSSC_CATEGORY', 'OSSC种类', '2', 'qiniu', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:52:05.110000', NULL, '2024-02-09 20:34:01.545278');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495383', 'OSSC_CATEGORY', 'OSSC种类', '3', 'minio', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:53:00.948000', NULL, '2024-02-09 20:34:01.546323');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495384', 'OSSC_CATEGORY', 'OSSC种类', '4', 'amazon s3', b'1', NULL, 1, NULL, NULL, NULL, b'0', NULL, NULL, '2023-12-19 16:53:25.949000', NULL, '2024-02-09 20:34:01.547283');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495385', 'RESOURCE_TYPE', '资源类型', '10', '有子级的菜单', b'1', 'CATALOGUE', 1, '', '', '', b'1', NULL, 2, '2022-01-26 12:43:36.000000', 2, '2024-02-23 19:26:43.353499');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495386', 'RESOURCE_TYPE', '资源类型', '20', '无子级的菜单', b'1', 'MENU', 2, '', '', '', b'1', NULL, 2, '2022-01-26 12:43:36.000000', 2, '2024-02-23 19:26:48.878170');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495387', 'RESOURCE_DATA_SCOPE', '数据范围', '01', '全部', b'1', '', 1, '', '', '', b'1', NULL, 2, '2022-01-26 12:45:39.000000', 2, '2024-02-09 20:34:01.550394');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495388', 'ROLE_CATEGORY', '角色类别', '10', '功能角色', b'1', '', 1, '', '', '', b'1', NULL, 2, '2022-01-26 12:46:35.000000', 2, '2024-02-09 20:34:01.551368');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495389', 'RESOURCE_TYPE', '资源类型', '60', '按钮', b'0', '暂时空缺，只作为判断用', 3, '', '', '', b'1', NULL, 2, '2022-01-26 12:43:36.000000', 2, '2024-02-23 15:42:25.781114');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495390', 'RESOURCE_DATA_SCOPE', '数据范围', '02', '本单位及子级', b'1', '', 2, '', '', '', b'1', NULL, 2, '2022-01-26 12:49:44.000000', 2, '2024-02-09 20:34:01.553339');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495391', 'RESOURCE_DATA_SCOPE', '数据范围', '03', '本单位', b'1', '', 3, '', '', '', b'1', NULL, 2, '2022-01-26 12:49:50.000000', 2, '2024-02-09 20:34:01.554293');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495392', 'RESOURCE_DATA_SCOPE', '数据范围', '04', '本部门及子级', b'1', '', 4, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:02.000000', 2, '2024-02-09 20:34:01.555271');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495393', 'RESOURCE_DATA_SCOPE', '数据范围', '05', '本部门', b'1', '', 5, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:08.000000', 2, '2024-02-09 20:34:01.556509');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495394', 'RESOURCE_DATA_SCOPE', '数据范围', '06', '个人', b'1', '', 6, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:21.000000', 2, '2024-02-09 20:34:01.557642');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495395', 'RESOURCE_DATA_SCOPE', '数据范围', '07', '自定义', b'1', '', 7, '', '', '', b'1', NULL, 2, '2022-01-26 12:50:28.000000', 2, '2024-02-09 20:34:01.558586');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495396', 'ROLE_CATEGORY', '角色类别', '20', '桌面角色', b'1', '', 2, '', '', '', b'1', NULL, 2, '2022-01-26 12:52:03.000000', 2, '2024-02-09 20:34:01.559535');
INSERT INTO `c_dictionary` (`id`, `type`, `label`, `code`, `name`, `state`, `describe_`, `sort_value`, `icon`, `css_style`, `css_class`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513262550495397', 'ROLE_CATEGORY', '角色类别', '30', '数据角色', b'1', '', 3, '', '', '', b'1', NULL, 2, '2022-01-26 12:52:32.000000', 2, '2024-02-09 20:34:01.560677');
COMMIT;

-- ----------------------------
-- Table structure for c_menu
-- ----------------------------
DROP TABLE IF EXISTS `c_menu`;
CREATE TABLE `c_menu` (
  `id` varchar(20) NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签',
  `resource_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '[10-有子级的菜单 20-无子级的菜单 60-按钮]; dictType = RESOURCE_TYPE',
  `tree_grade` int DEFAULT NULL COMMENT '树层级',
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
  `mpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '树路径',
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
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473632799518789', '组织机构', 'sys.menu2.org.index', '10', NULL, '', b'0', 'org', '', b'1', 2, 'ic2-org', '', NULL, NULL, b'0', NULL, '473632799518789.', b'0', NULL, NULL, '2023-08-31 16:16:48', NULL, '2023-08-31 16:16:48');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473633613013061', '机构管理', 'sys.menu2.org.org', '20', NULL, '', b'0', 'orgs', '/org/orgs/list.page.tsx', b'1', 1, '', '', NULL, NULL, b'0', '473632799518789', '473632799518789.473633613013061.', b'0', NULL, NULL, '2023-08-31 16:20:06', NULL, '2023-08-31 16:20:06');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473633775972421', '岗位管理', 'sys.menu2.org.station', '20', NULL, '', b'0', 'stations', '/org/stations/list.page.tsx', b'1', 2, '', '', NULL, NULL, b'0', '473632799518789', '473632799518789.473633775972421.', b'0', NULL, NULL, '2023-08-31 16:20:46', NULL, '2023-08-31 16:20:46');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('473633960718405', '用户管理', 'sys.menu2.org.user', '20', NULL, '', b'0', 'users', '/org/users/list.page.tsx', b'1', 3, '', '', NULL, NULL, b'0', '473632799518789', '473632799518789.473633960718405.', b'0', NULL, NULL, '2023-08-31 16:21:31', NULL, '2023-08-31 16:21:31');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477503721513029', '系统设置', 'sys.menu2.setting.index', '10', NULL, NULL, b'0', 'setting', '', b'1', 3, 'ic2-setting', NULL, NULL, NULL, b'0', NULL, '477503721513029.', b'0', NULL, NULL, '2023-09-11 14:47:37', NULL, '2023-09-11 14:47:37');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506197712965', '菜单管理', 'sys.menu2.setting.menu', '20', NULL, NULL, b'0', 'menus', '/setting/menus/list.page.tsx', b'1', 1, NULL, NULL, NULL, NULL, b'0', '477503721513029', '477503721513029.477506197712965.', b'0', NULL, NULL, '2023-09-11 14:57:42', NULL, '2023-09-11 14:57:42');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506352619589', '角色管理', 'sys.menu2.authority.role', '20', NULL, NULL, b'0', 'roles', '/authority/roles/list.page.tsx', b'1', 1, NULL, NULL, NULL, NULL, b'0', '512095515308101', '512095515308101.477506352619589.', b'0', NULL, NULL, '2023-09-11 14:58:19', NULL, '2023-09-11 14:58:19');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506457538629', '字典管理', 'sys.menu2.setting.dictionary', '20', NULL, NULL, b'0', 'dictionaries', '/setting/dictionaries/list.page.tsx', b'1', 2, NULL, NULL, NULL, NULL, b'0', '477503721513029', '477503721513029.477506457538629.', b'0', NULL, NULL, '2023-09-11 14:58:45', NULL, '2023-09-11 14:58:45');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506603237445', '行政区划', 'sys.menu2.base.area', '20', NULL, NULL, b'0', 'areas', '/base/areas/list.page.tsx', b'1', 1, NULL, NULL, NULL, NULL, b'0', '512103019884613', '512103019884613.477506603237445.', b'0', NULL, NULL, '2023-09-11 14:59:21', NULL, '2023-09-11 14:59:21');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477506718847045', '参数管理', 'sys.menu2.setting.parameter', '20', NULL, NULL, b'0', 'parameters', '/setting/parameters/list.page.tsx', b'1', 3, NULL, NULL, NULL, NULL, b'0', '477503721513029', '477503721513029.477506718847045.', b'0', NULL, NULL, '2023-09-11 14:59:49', NULL, '2023-09-11 14:59:49');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('482519172976709', '个人主页', 'sys.menu2.home.index', '20', NULL, '', b'0', 'home', '/home/list.page.tsx', b'1', 1, 'ic2-home', NULL, NULL, NULL, b'0', NULL, '482519172976709.', b'0', NULL, NULL, '2023-09-25 18:55:32', NULL, '2023-09-25 18:55:32');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512095515308101', '权限管理', 'sys.menu2.authority.index', '10', NULL, NULL, b'0', 'authority', NULL, b'1', 4, 'ic2-authority', NULL, NULL, NULL, b'0', NULL, '512095515308101.', b'0', NULL, NULL, '2023-12-18 08:41:59', NULL, '2023-12-18 08:41:59');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512103019884613', '基础配置', 'sys.menu2.base.index', '10', NULL, NULL, b'0', 'base', NULL, b'1', 5, 'ic2-base', NULL, NULL, NULL, b'0', NULL, '512103019884613.', b'0', NULL, NULL, '2023-12-18 09:12:31', NULL, '2023-12-18 09:12:31');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512216121036869', '资源管理', 'sys.menu2.resource.index', '10', NULL, NULL, b'0', 'resource', NULL, b'1', 6, 'ic2-resource', NULL, NULL, NULL, b'0', NULL, '512216121036869.', b'0', NULL, NULL, '2023-12-18 16:52:44', NULL, '2023-12-18 16:52:44');
INSERT INTO `c_menu` (`id`, `name`, `label`, `resource_type`, `tree_grade`, `describe_`, `is_general`, `path`, `component`, `state`, `sort_value`, `icon`, `group_`, `data_scope`, `custom_class`, `is_def`, `parentId`, `mpath`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512216970563653', '对象存储', 'sys.menu2.resource.oss', '20', NULL, NULL, b'0', 'osss', '/resource/osss/list.page.tsx', b'1', 1, '', NULL, NULL, NULL, b'0', '512216121036869', '512216121036869.512216970563653.', b'0', NULL, NULL, '2023-12-18 16:56:11', NULL, '2023-12-18 16:56:11');
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
-- Table structure for c_oss
-- ----------------------------
DROP TABLE IF EXISTS `c_oss`;
CREATE TABLE `c_oss` (
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
-- Records of c_oss
-- ----------------------------
BEGIN;
INSERT INTO `c_oss` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512293694996549', 'qiniu-panlore', '2', 'figure-bed', 'x6gL6f28tRdRszYJ7WMB_3RvG_vajTODD0RwvWWg', 'H0fxWDsOF6E_aqefAh5XRpQpLrj0vPxOZ3oCdwRv', 'http://s3.cn-south-1.qiniucs.com', NULL, b'1', NULL, NULL, '2023-12-18 22:08:54.664000', NULL, '2023-12-21 19:56:34.000000');
INSERT INTO `c_oss` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512293825183813', 'ali-kangod', '3', 'kd-resources', 'LTAI5tNaV4WeFuBzc4vtEc9m', 'ZKmNmyvhEu35WbHwVRgxMpVk3XBkDu', 'https://oss-cn-chengdu.aliyuncs.com', NULL, b'0', NULL, NULL, '2023-12-18 22:08:54.664000', NULL, '2023-12-21 15:10:29.000000');
INSERT INTO `c_oss` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209566588997', '123', '2', '213', '31212', '123', 'dadqwe', NULL, b'1', NULL, NULL, '2023-12-21 12:15:04.343000', NULL, '2023-12-21 12:20:10.000000');
INSERT INTO `c_oss` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209590362181', '3213', '2', '3123', '3112', '3213', 'dazzaz', '312', b'1', NULL, NULL, '2023-12-21 12:15:10.147000', NULL, '2023-12-21 12:20:14.000000');
INSERT INTO `c_oss` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209620418629', '3123', '3', '3123', '3123', '123', 'dqwdqzzz', '3123', b'1', NULL, NULL, '2023-12-21 12:15:17.485000', NULL, '2023-12-21 12:20:18.000000');
INSERT INTO `c_oss` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513209982296133', 'dsadqwd', '3', 'sadsad', 'sadsad', 'sadsad', 'asdasd', NULL, b'1', NULL, NULL, '2023-12-21 12:16:45.834000', NULL, '2023-12-21 12:16:45.834000');
INSERT INTO `c_oss` (`id`, `code`, `category`, `bucket_name`, `access_key`, `secret_key`, `endpoint`, `describe`, `state`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('513210013646917', 'sadsadqwqw', '1', 'asdas', 'sadas', 'dasasd', 'qweqwe', NULL, b'1', NULL, NULL, '2023-12-21 12:16:53.488000', NULL, '2023-12-21 12:16:53.488000');
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
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('534862933868613', 'sad', 'dasd', 'dasdfff1111', NULL, b'1', b'0', NULL, NULL, '2024-02-20 16:42:50.964000', NULL, '2024-02-20 16:47:20.000000');
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('534865676562501', '1111', '111', '1111', NULL, b'1', b'0', NULL, NULL, '2024-02-20 16:54:00.566000', NULL, '2024-02-20 16:54:00.566000');
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('534865698082885', '22222', '2222', '22222', NULL, b'1', b'0', NULL, NULL, '2024-02-20 16:54:05.821000', NULL, '2024-02-20 16:54:05.821000');
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('534865786617925', '6', '6', '6', NULL, b'1', b'0', NULL, NULL, '2024-02-20 16:54:27.436000', NULL, '2024-02-20 16:54:27.436000');
INSERT INTO `c_parameter` (`id`, `key_`, `value`, `name`, `describe_`, `state`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('534865904812101', '7', '7', '7', NULL, b'1', b'0', NULL, NULL, '2024-02-20 16:54:56.292000', NULL, '2024-02-20 16:54:56.292000');
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
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477217670877253', 'org:station:delete', '删除', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:23:40.441319', NULL, '2023-09-11 15:47:53.780047');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477218072793157', 'org:station:update', '更新', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:25:18.569885', NULL, '2023-09-10 19:25:18.569885');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477218292002885', 'org:station:store', '新建', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-10 19:26:12.087373', NULL, '2023-09-11 15:48:03.515269');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507604250693', 'org:org:store', '新建', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:03:24.961323', NULL, '2023-09-11 15:05:15.411599');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507692666949', 'org:org:delete', '删除', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:03:46.540311', NULL, '2023-09-11 15:05:18.660378');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477507733999685', 'org:org:update', '更新', '473633613013061', NULL, b'0', NULL, NULL, '2023-09-11 15:03:56.633563', NULL, '2023-09-11 15:05:27.526154');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511069552709', 'org:user:store', '新建', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:17:30.977275', NULL, '2023-09-11 15:23:56.247615');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511119458373', 'org:user:delete', '删除', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:17:43.163796', NULL, '2023-09-11 15:23:56.265554');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511143804997', 'org:user:update;org:org:tree;org:station:list;oss-middleware:getQiniuOSSInfo', '更新', '473633960718405', NULL, b'0', NULL, NULL, '2023-09-11 15:17:49.109086', NULL, '2024-02-23 19:40:00.372264');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511529672773', 'system:menu:store;system:resource:store', '新建', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:23.313306', NULL, '2023-09-11 16:57:43.231233');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511553785925', 'system:menu:delete;system:resource:delete', '删除', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:29.200571', NULL, '2023-09-11 16:57:23.630356');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511581478981', 'system:menu:update;system:resource:update', '更新', '477506197712965', NULL, b'0', NULL, NULL, '2023-09-11 15:19:35.973549', NULL, '2023-09-11 16:56:37.744049');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511711989829', 'org:role:store', '新建', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:07.823581', NULL, '2023-09-11 18:11:11.194779');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511752441925', 'org:role:delete', '删除', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:17.699393', NULL, '2023-09-11 18:11:11.210230');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511774003269', 'org:role:update', '更新', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 15:20:22.962009', NULL, '2023-09-11 18:11:11.213518');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511934677061', 'system:dict:store', '新建', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:02.195987', NULL, '2023-09-11 16:55:01.337443');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511958855749', 'system:dict:delete', '删除', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:08.093093', NULL, '2023-09-11 16:55:01.340699');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477511983927365', 'system:dict:update', '更新', '477506457538629', NULL, b'0', NULL, NULL, '2023-09-11 15:21:14.213886', NULL, '2023-09-11 16:55:01.343733');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512179880005', 'system:area:store', '新建', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:02.053797', NULL, '2023-09-11 16:55:01.364444');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512207384645', 'system:area:delete', '删除', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:08.768587', NULL, '2023-09-11 16:55:01.367244');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512237158469', 'system:area:update', '更新', '477506603237445', NULL, b'0', NULL, NULL, '2023-09-11 15:22:16.037733', NULL, '2023-09-11 16:55:01.369986');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512436150341', 'system:param:store', '新建', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:04.625978', NULL, '2023-09-11 16:55:01.380894');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512472305733', 'system:param:delete', '删除', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:13.445931', NULL, '2023-09-11 16:55:01.383586');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477512492404805', 'system:param:detail;system:param:update', '更新', '477506718847045', NULL, b'0', NULL, NULL, '2023-09-11 15:23:18.357448', NULL, '2023-09-11 17:31:59.436023');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477524245332037', 'org:station:exportExcel', '导出', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-11 16:11:07.727292', NULL, '2023-09-11 16:11:07.727292');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477524312936517', 'org:station:importExcel', '导入', '473633775972421', NULL, b'0', NULL, NULL, '2023-09-11 16:11:24.228134', NULL, '2023-09-11 16:11:24.228134');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477540145778757', 'org:userRole:listUserRoleByRoleId;org:roleAuthority:listRoleAuthorityIdByRoleId;org:userRole:saveListAfterDelete', '分配角色', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 17:15:49.679589', NULL, '2023-09-16 19:52:57.737020');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('477540812017733', 'org:roleAuthority:listRoleAuthorityIdByRoleId;system:resource:list;org:roleAuthority:saveBatchRoleAutority', '分配资源', '477506352619589', NULL, b'0', NULL, NULL, '2023-09-11 17:18:32.326606', NULL, '2023-09-16 19:52:57.739896');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512263975366725', 'resource:oss:store', '新建', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:07:27.136296', NULL, '2023-12-18 20:07:27.136296');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512264058916933', 'resource:oss:delete', '删除', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:07:47.518657', NULL, '2023-12-18 20:07:47.518657');
INSERT INTO `c_resource` (`id`, `code`, `name`, `menu_id`, `describe_`, `readonly_`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('512264133689413', 'resource:oss:update', '更新', '512216970563653', NULL, b'0', NULL, NULL, '2023-12-18 20:08:05.772686', NULL, '2023-12-18 20:08:05.772686');
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
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126463557', '473633613013061', 'MENU', '534899980963909', '2024-02-20 19:18:15.328000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126463558', '473632799518789', 'MENU', '534899980963909', '2024-02-20 19:18:15.328000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467653', '473633775972421', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467654', '473686460346437', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467655', '473941204222021', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467656', '473941311623237', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467657', '473941488152645', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467658', '473941563088965', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467659', '473941623590981', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467660', '473633960718405', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467661', '477503721513029', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467662', '477506457538629', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467663', '477506197712965', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
INSERT INTO `c_role_authority` (`id`, `authority_id`, `authority_type`, `role_id`, `created_at`, `created_by`) VALUES ('534901126467664', '477506718847045', 'MENU', '534899980963909', '2024-02-20 19:18:15.329000', NULL);
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
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('470112933056581', '123asd', '465544521830469', b'0', '', '2023-08-21 17:34:25.000000', NULL, NULL, '2024-02-21 10:00:10.000000', NULL, NULL);
INSERT INTO `c_station` (`id`, `name`, `org_id`, `state`, `describe_`, `created_at`, `deleted_at`, `created_by`, `updated_at`, `updated_by`, `created_org_id`) VALUES ('535117968990277', '213', '465436617269317', b'1', NULL, '2024-02-21 10:00:35.398000', NULL, NULL, '2024-02-21 10:00:35.398000', NULL, NULL);
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
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码盐',
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
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('1', 'prune_admin', '内置管理员z', '465436245590085', '465437603893317', b'1', 'yk625x@163.com', '15217781234', 'W', b'1', 'https://qiniu.panlore.top/project/prune/rc-upload-1708587296972-5.jpg', '07', '08', '02', '只工作，不上班。', '2020-11-24 19:08:45', 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2020-11-24 19:08:45', NULL, 1, '2020-11-22 23:03:15.000000', 1, '2024-02-24 11:38:27.218368', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('2', 'prune', '超级管理员', '465436228214853', '1', b'0', '5', '3', 'N', b'1', 'https://qiniu.panlore.top/project/prune/rc-upload-1708587296972-8.jpg', '02', '04', '03', '只工作，不上班。', NULL, 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2023-06-25 17:00:10', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2024-02-24 11:38:31.866877', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('3', 'prune_pt', '平台管理员', '465544521830469', '465438323720261', b'0', '2', '3', 'W', b'1', 'https://qiniu.panlore.top/project/prune/rc-upload-1708587296972-13.jpg', '05', '06', '02', '只工作，不上班。', '2022-06-01 12:46:59', 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2022-06-01 12:46:59', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2024-02-24 11:38:36.658104', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('4', 'general', '普通管理员', '465436178821189', '465438388564037', b'0', '', '', 'N', b'1', 'https://qiniu.panlore.top/project/prune/rc-upload-1708587296972-22.png', '01', '01', '01', '只工作，不上班。', '2022-06-05 21:47:47', 0, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'ki5pj8dv44i14yu4nbhh', '2022-06-05 21:47:47', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2024-02-24 11:38:40.596065', 1);
INSERT INTO `c_user` (`id`, `account`, `name`, `org_id`, `station_id`, `readonly`, `email`, `mobile`, `sex`, `state`, `avatar`, `nation`, `education`, `position_status`, `work_describe`, `password_error_last_time`, `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`, `deleted_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `created_org_id`) VALUES ('5', 'normal2', '普通用户', '465436178821189', '1', b'0', '', '', 'M', b'1', 'https://qiniu.panlore.top/project/prune/rc-upload-1708587575530-2.png', '33', '02', '02', '只工作，不上班。', '2022-01-27 12:21:39', 0, NULL, '931b893ae00c11a7918a869735d298a5', 'ki5pj8dv44i14yu4nbhh', '2022-01-27 12:21:39', NULL, 1, '2020-11-22 23:03:15.000000', 2, '2024-02-24 11:38:44.677252', 1);
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
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('534901026406469', '534899980963909', '3', NULL, NULL, '2024-02-20 19:17:50.900000');
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('534901026406470', '534899980963909', '5', NULL, NULL, '2024-02-20 19:17:50.900000');
INSERT INTO `c_user_role` (`id`, `role_id`, `user_id`, `deleted_at`, `created_by`, `created_at`) VALUES ('534901026410565', '534899980963909', '4', NULL, NULL, '2024-02-20 19:17:50.901000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
