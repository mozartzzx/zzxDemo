/*
Navicat MySQL Data Transfer

Source Server         : IFMSV2
Source Server Version : 50626
Source Host           : 192.168.46.117:3306
Source Database       : zzxtest

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2019-03-11 15:21:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for q_qq
-- ----------------------------
DROP TABLE IF EXISTS `q_qq`;
CREATE TABLE `q_qq` (
  `ID` varchar(36) NOT NULL,
  `C_CODE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
