/*
Navicat MySQL Data Transfer

Source Server         : IFMSV2
Source Server Version : 50626
Source Host           : 192.168.46.117:3306
Source Database       : zzxtest

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2019-03-11 15:21:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for z_zx
-- ----------------------------
DROP TABLE IF EXISTS `z_zx`;
CREATE TABLE `z_zx` (
  `ID` varchar(36) NOT NULL,
  `C_NAME` varchar(255) DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  `C_NUM` varchar(255) DEFAULT NULL,
  `C_ADDRESS` varchar(255) DEFAULT NULL,
  `C_DESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
