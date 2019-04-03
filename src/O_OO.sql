/*
Navicat MySQL Data Transfer

Source Server         : IFMSV2
Source Server Version : 50626
Source Host           : 192.168.46.117:3306
Source Database       : zzxtest

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2019-03-11 15:21:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for o_oo
-- ----------------------------
DROP TABLE IF EXISTS `o_oo`;
CREATE TABLE `o_oo` (
  `ID` varchar(36) NOT NULL,
  `C_STORE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
