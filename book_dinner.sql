/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : book_dinner

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-04 09:49:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL COMMENT '菜品ID',
  `dname` varchar(255) NOT NULL COMMENT '菜品名',
  `price` varchar(255) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '数量',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('34', '4', '菜品四', '89', '8', '38');
INSERT INTO `cart` VALUES ('36', '4', '菜品四', '89', '3', '40');
INSERT INTO `cart` VALUES ('37', '5', '菜品五', '90', '9', '40');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `did` int(11) NOT NULL COMMENT '菜品id',
  `comment` varchar(255) NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `dish`
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
  `name` varchar(255) NOT NULL COMMENT '菜品名',
  `price` varchar(255) NOT NULL COMMENT '单价',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `category` int(11) NOT NULL COMMENT '分类：1.凉菜系列，2.热菜系列，3.海鲜系列，4.酒水系列，5.主食系列',
  `imgPath` varchar(255) NOT NULL DEFAULT '../../../static/logo.png' COMMENT '图片地址',
  `sale` int(11) NOT NULL COMMENT '销售量',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1', '菜品一', '77', '这是菜品一', '1', '../../../static/logo.png', '80');
INSERT INTO `dish` VALUES ('2', '菜品二', '66', '这是菜品一', '1', '../../../static/logo.png', '90');
INSERT INTO `dish` VALUES ('3', '菜品三', '99', '这是菜品三', '1', '../../../static/logo.png', '60');
INSERT INTO `dish` VALUES ('4', '菜品四', '89', '这是菜品三', '2', '../../../static/logo.png', '90');
INSERT INTO `dish` VALUES ('5', '菜品五', '90', '这是菜品五', '2', '../../../static/logo.png', '30');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` int(11) NOT NULL COMMENT '订单id',
  `time` varchar(255) NOT NULL COMMENT '下单时间',
  `name` varchar(255) NOT NULL COMMENT '收货人姓名',
  `phone` int(11) NOT NULL COMMENT '收货人电话',
  `total` varchar(255) NOT NULL COMMENT '总价',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `address` varchar(255) NOT NULL COMMENT '地址',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL COMMENT '菜品id',
  `dname` varchar(255) NOT NULL COMMENT '菜品名称',
  `price` varchar(255) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `receipt`
-- ----------------------------
DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  `phone` varchar(255) NOT NULL COMMENT '收货手机号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '收货人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receipt
-- ----------------------------
INSERT INTO `receipt` VALUES ('2', '西城区1331', '13034563608', '40', '4646w');
INSERT INTO `receipt` VALUES ('5', '西城区1331', '13034563608', '40', '4646f4');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `sex` varchar(255) NOT NULL COMMENT '性别',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `permission` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('38', '聂', '男', '18846792935', '123', '1');
INSERT INTO `user` VALUES ('40', '聂哈哈', '男', '18845071994', '123', '0');
