/*
Navicat MySQL Data Transfer

Source Server         : 1_TrinityCore-master
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : acore_characters

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2023-06-18 22:36:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `characters_douqi`
-- ----------------------------
-- DROP TABLE IF EXISTS `characters_douqi`;
CREATE TABLE IF NOT EXISTS  `characters_douqi` (
  `guid` int(10) NOT NULL,
  `douqizhi` int(30) NOT NULL DEFAULT '0',
  `liliang` int(30) NOT NULL,
  `minjie` int(30) NOT NULL,
  `naili` int(30) NOT NULL,
  `zhili` int(30) NOT NULL,
  `jingshen` int(30) NOT NULL,
  `gongqiang` int(30) NOT NULL,
  `faqiang` int(30) NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of characters_douqi
-- ----------------------------
INSERT INTO `characters_douqi` VALUES ('1', '13', '0', '0', '0', '0', '0', '0', '1000');
