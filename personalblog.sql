/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : personalblog

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 05/05/2019 00:22:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `album_id` int(10) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(20) NOT NULL,
  `album_info` text,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(10) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(100) NOT NULL,
  `article_date` date NOT NULL,
  `author_name` varchar(30) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, '千里之行，始于脚下', '2017-08-06', 'Kris');
INSERT INTO `article` VALUES (2, '五子棋AI（一）：五子棋及五子棋AI概述', '2017-08-27', 'Kris');
INSERT INTO `article` VALUES (3, '五子棋AI（二）：绘制界面，添加点击事件，棋局胜负判断', '2017-09-13', 'Kris');
INSERT INTO `article` VALUES (4, 'CSS和JS相关知识点总结（内容导航）', '2018-03-26', 'Kris');
INSERT INTO `article` VALUES (5, '打砖块——js面向对象初识', '2018-08-30', 'Kris');
INSERT INTO `article` VALUES (6, '围住神经猫——广度优先搜索的妙用', '2018-10-03', 'Kris');
INSERT INTO `article` VALUES (7, 'vps折腾记（一）——简介、选购、环境搭建', '2018-10-22', 'Kris');
INSERT INTO `article` VALUES (8, '啃书笔记（一）——《JavaScript-DOM编程艺术》', '2018-10-29', 'Kris');
INSERT INTO `article` VALUES (9, '啃书笔记（二）——《JavaScript高级程序设计》一~三章', '2018-11-06', 'Kris');
INSERT INTO `article` VALUES (10, '啃书笔记（二）——《JavaScript高级程序设计》四章', '2018-11-06', 'Kris');
INSERT INTO `article` VALUES (11, '啃书笔记（二）——《JavaScript高级程序设计》五章', '2018-11-06', 'Kris');
INSERT INTO `article` VALUES (12, '啃书笔记（二）——《JavaScript高级程序设计》六章', '2018-11-06', 'Kris');
INSERT INTO `article` VALUES (13, '啃书笔记（二）——《JavaScript高级程序设计》七章', '2018-11-06', 'Kris');
INSERT INTO `article` VALUES (14, '手把手教你用原生JavaScript造轮子（一）——分页器', '2018-11-22', 'Kris');
INSERT INTO `article` VALUES (15, '手把手教你用原生JavaScript造轮子（二）——轮播图', '2018-12-10', 'Kris');
COMMIT;

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) NOT NULL,
  `tag_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
BEGIN;
INSERT INTO `article_tag` VALUES (1, 1, 1);
INSERT INTO `article_tag` VALUES (2, 1, 2);
INSERT INTO `article_tag` VALUES (3, 2, 3);
INSERT INTO `article_tag` VALUES (4, 2, 4);
INSERT INTO `article_tag` VALUES (5, 2, 5);
INSERT INTO `article_tag` VALUES (6, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for blogger
-- ----------------------------
DROP TABLE IF EXISTS `blogger`;
CREATE TABLE `blogger` (
  `blogger_id` int(10) NOT NULL,
  `blogger_name` varchar(30) NOT NULL,
  `blogger_password` varchar(50) NOT NULL,
  PRIMARY KEY (`blogger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogger
-- ----------------------------
BEGIN;
INSERT INTO `blogger` VALUES (1, 'Kris', '877089441fa90b1cddc54221e34bcacb');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `touris_name` varchar(20) NOT NULL,
  `touris_picture` varchar(20) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_date` date NOT NULL,
  `article_id` int(10) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(10) NOT NULL,
  `touris_name` varchar(20) NOT NULL,
  `touris_email` varchar(30) NOT NULL,
  `message_content` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `picture_id` int(10) NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(20) NOT NULL,
  `picture_info` text,
  `picture_link` varchar(0) NOT NULL,
  `album_id` int(10) NOT NULL,
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(10) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` VALUES (1, '生活');
INSERT INTO `tag` VALUES (2, '技术');
INSERT INTO `tag` VALUES (3, '五子棋');
INSERT INTO `tag` VALUES (4, 'AI');
INSERT INTO `tag` VALUES (5, '算法');
INSERT INTO `tag` VALUES (6, 'Canvas');
INSERT INTO `tag` VALUES (7, 'JavaScript');
INSERT INTO `tag` VALUES (8, 'CSS');
INSERT INTO `tag` VALUES (9, '总结');
INSERT INTO `tag` VALUES (10, 'VPS');
INSERT INTO `tag` VALUES (11, '服务器');
INSERT INTO `tag` VALUES (12, 'Linux');
INSERT INTO `tag` VALUES (13, 'DOM');
INSERT INTO `tag` VALUES (14, '笔记');
INSERT INTO `tag` VALUES (15, '轮子');
INSERT INTO `tag` VALUES (16, '分页');
INSERT INTO `tag` VALUES (17, 'Vue');
INSERT INTO `tag` VALUES (18, 'Webpack');
INSERT INTO `tag` VALUES (19, 'ECMAScript6');
INSERT INTO `tag` VALUES (20, '轮播图');
INSERT INTO `tag` VALUES (21, 'NodeJS');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
