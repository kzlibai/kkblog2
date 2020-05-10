/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : kzewenblog_db

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 08/05/2020 21:23:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '小孔', 'admin', 'admin', 'kzewen@163.com', NULL, '努力向上的程序员');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_private` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_time` datetime(0) NULL DEFAULT NULL,
  `upvote` int(100) NULL DEFAULT NULL,
  `downvote` int(100) NULL DEFAULT NULL,
  `comment_num` int(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`admin_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NULL DEFAULT NULL,
  `commenter_id` bigint(20) NULL DEFAULT NULL,
  `comment_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comment_time` datetime(0) NULL DEFAULT NULL,
  `children_comment` bigint(20) NULL DEFAULT NULL,
  `upvote` int(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_2`(`commenter_id`) USING BTREE,
  INDEX `FK_Reference_3`(`article_id`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`commenter_id`) REFERENCES `commenter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commenter
-- ----------------------------
DROP TABLE IF EXISTS `commenter`;
CREATE TABLE `commenter`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_4`(`admin_id`) USING BTREE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upvote
-- ----------------------------
DROP TABLE IF EXISTS `upvote`;
CREATE TABLE `upvote`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `commenter_id` bigint(20) NULL DEFAULT NULL,
  `article_id` bigint(20) NULL DEFAULT NULL,
  `upvote` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `downvote` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vote_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_6`(`article_id`) USING BTREE,
  INDEX `FK_Reference_7`(`commenter_id`) USING BTREE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`commenter_id`) REFERENCES `commenter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
