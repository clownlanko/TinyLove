/*
 Navicat Premium Data Transfer

 Source Server         : TinyLove
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : tiny_love

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 02/01/2019 17:35:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for vi_authority
-- ----------------------------
DROP TABLE IF EXISTS `vi_authority`;
CREATE TABLE `vi_authority`  (
  `authority_id` int(3) NOT NULL AUTO_INCREMENT,
  `authority_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authority_remark` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`authority_id`) USING BTREE,
  UNIQUE INDEX `authority_name`(`authority_name`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `vi_authority_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `vi_authority` (`authority_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_business
-- ----------------------------
DROP TABLE IF EXISTS `vi_business`;
CREATE TABLE `vi_business`  (
  `business_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autograph` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credit_level` int(1) NULL DEFAULT 3,
  `like_quantity` int(11) NULL DEFAULT 0,
  `look_quantity` int(11) NULL DEFAULT 0,
  `create_time` date NULL DEFAULT NULL,
  `modify_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`business_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_cart_list
-- ----------------------------
DROP TABLE IF EXISTS `vi_cart_list`;
CREATE TABLE `vi_cart_list`  (
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `modify_time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_goods
-- ----------------------------
DROP TABLE IF EXISTS `vi_goods`;
CREATE TABLE `vi_goods`  (
  `goods_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `business_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_quantity` int(11) NULL DEFAULT 0,
  `goods_price` double NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  `modify_time` date NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `like_quantity` int(11) NULL DEFAULT 0,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `vi_goods_detail`;
CREATE TABLE `vi_goods_detail`  (
  `goods_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_goods_remark
-- ----------------------------
DROP TABLE IF EXISTS `vi_goods_remark`;
CREATE TABLE `vi_goods_remark`  (
  `remark_id` int(11) NOT NULL AUTO_INCREMENT,
  `remark_key` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`remark_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_job
-- ----------------------------
DROP TABLE IF EXISTS `vi_job`;
CREATE TABLE `vi_job`  (
  `job_id` int(2) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_remark` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE INDEX `name`(`job_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_logistics
-- ----------------------------
DROP TABLE IF EXISTS `vi_logistics`;
CREATE TABLE `vi_logistics`  (
  `logistics_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logistics_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logistics_personnel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`logistics_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_manager
-- ----------------------------
DROP TABLE IF EXISTS `vi_manager`;
CREATE TABLE `vi_manager`  (
  `user_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salary` decimal(8, 2) NULL DEFAULT NULL,
  `job_id` int(2) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `join_time` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_object_images
-- ----------------------------
DROP TABLE IF EXISTS `vi_object_images`;
CREATE TABLE `vi_object_images`  (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_url` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_object_type
-- ----------------------------
DROP TABLE IF EXISTS `vi_object_type`;
CREATE TABLE `vi_object_type`  (
  `object_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_order
-- ----------------------------
DROP TABLE IF EXISTS `vi_order`;
CREATE TABLE `vi_order`  (
  `ordre_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`ordre_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_role
-- ----------------------------
DROP TABLE IF EXISTS `vi_role`;
CREATE TABLE `vi_role`  (
  `user_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authority_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `vi_shop_type`;
CREATE TABLE `vi_shop_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE,
  UNIQUE INDEX `type_name`(`type_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vi_user
-- ----------------------------
DROP TABLE IF EXISTS `vi_user`;
CREATE TABLE `vi_user`  (
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_photo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for manager_role
-- ----------------------------
DROP VIEW IF EXISTS `manager_role`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `manager_role` AS select `vim`.`user_id` AS `user_id`,`viu`.`user_name` AS `user_name`,`viu`.`password` AS `password`,`viu`.`phone` AS `phone`,`viu`.`email` AS `email`,`vij`.`job_name` AS `job_name`,`vij`.`job_remark` AS `job_remark`,`vim`.`salary` AS `salary`,`via`.`authority_name` AS `authority_name`,`via`.`authority_remark` AS `authority_remark`,`vim`.`status` AS `status` from ((((`vi_manager` `vim` join `vi_role` `vir` on((`vim`.`user_id` = `vir`.`user_id`))) join `vi_authority` `via` on((`via`.`authority_id` = `vir`.`authority_id`))) join `vi_job` `vij` on((`vij`.`job_id` = `vim`.`job_id`))) join `vi_user` `viu` on((`viu`.`user_id` = `vim`.`user_id`)));

SET FOREIGN_KEY_CHECKS = 1;
