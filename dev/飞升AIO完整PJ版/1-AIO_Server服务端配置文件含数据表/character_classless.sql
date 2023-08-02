/*
 Navicat Premium Data Transfer

 Source Server         : 飞升计划数据库
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : 127.0.0.1:3306
 Source Schema         : acore_characters

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 18/02/2023 08:39:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character_classless
-- ----------------------------
DROP TABLE IF EXISTS `character_classless`;
CREATE TABLE `character_classless`  (
  `guid` int UNSIGNED NOT NULL COMMENT 'Player GUID (Low)',
  `spells` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Array of known Spell IDs',
  `talents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Array of known Talent IDs',
  `glyphs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Array of known Glyph IDs',
  `reset_counter` int UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of Abilities reset',
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'ClassLess System by Shikifuyin' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_classless
-- ----------------------------
INSERT INTO `character_classless` VALUES (1, '', '', '', 0);
INSERT INTO `character_classless` VALUES (3, '', '', '', 0);
INSERT INTO `character_classless` VALUES (8, '883,14287,3043', '', '', 1);
INSERT INTO `character_classless` VALUES (10, '1752', '', '', 0);
INSERT INTO `character_classless` VALUES (11, '', '', '', 0);

SET FOREIGN_KEY_CHECKS = 1;
