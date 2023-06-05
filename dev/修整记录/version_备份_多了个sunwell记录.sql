/*
Navicat MySQL Data Transfer

Source Server         : 1_TrinityCore-master
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : acore_world

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2023-06-05 10:09:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `version`
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `core_version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_version` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int(11) DEFAULT '0',
  PRIMARY KEY (`core_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Version Notes';

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('AzerothCore rev. bd9f99f78448+ 2023-06-01 11:11:54 +0800 (master branch) (Win64, Debug, Static)', 'bd9f99f78448+', 'ACDB 335.10-dev', '10');
INSERT INTO `version` VALUES ('SunwellCore rev.  () (Win64, RelWithDebInfo)', '', 'TDB 335.52', '52');
