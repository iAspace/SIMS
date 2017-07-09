/*
Navicat MySQL Data Transfer

Source Server         : iAspace
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : stu_info

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-05-25 15:12:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `real_name` varchar(50) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`real_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES ('老师', '老师', 'imlaoshi');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `number` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `age` int(3) NOT NULL,
  `classes` varchar(255) NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('001', '学生001', '男', '20', '15软4');
INSERT INTO `student` VALUES ('002', '学生002', '男', '20', '15软4');
INSERT INTO `student` VALUES ('003', '学生003', '男', '20', '15软4');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `real_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`real_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1111', '1212121', '1111111');
INSERT INTO `user_info` VALUES ('11111', '1112', '1111111');
INSERT INTO `user_info` VALUES ('学生001', '张三', 'imzhang3');
INSERT INTO `user_info` VALUES ('学生002', '李四', 'imlisi4');
INSERT INTO `user_info` VALUES ('学生003', '张四', 'imzhang4');
INSERT INTO `user_info` VALUES ('学生004', '张三', 'imzhang3');
INSERT INTO `user_info` VALUES ('学生005', '王六', '1111111');
SET FOREIGN_KEY_CHECKS=1;
