/*
 Navicat Premium Data Transfer

 Source Server         : VI
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : vi

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 05/12/2018 20:02:39
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
-- Records of vi_authority
-- ----------------------------
INSERT INTO `vi_authority` VALUES (100, '超级管理员', '拥有至高无上的权力', NULL);
INSERT INTO `vi_authority` VALUES (101, '普通管理员', '一般的增删改查', 100);
INSERT INTO `vi_authority` VALUES (102, '用户管理', '管理用户', 101);
INSERT INTO `vi_authority` VALUES (103, '商户管理', '管理商户', 101);
INSERT INTO `vi_authority` VALUES (104, '广告管理', '管理广告', 101);

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
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vi_job
-- ----------------------------
INSERT INTO `vi_job` VALUES (200, '人事经理', '人前人后忙');
INSERT INTO `vi_job` VALUES (201, '项目经理', '项目技术处理');
INSERT INTO `vi_job` VALUES (202, '策划经理', '项目策划');
INSERT INTO `vi_job` VALUES (203, '设计经理', 'UI设计');
INSERT INTO `vi_job` VALUES (204, '运维师', '项目维护');

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
-- Records of vi_manager
-- ----------------------------
INSERT INTO `vi_manager` VALUES ('VIU000004', 20000.00, 200, 1, '2018-12-05 02:37:59', '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000005', 20000.00, 201, 1, '2018-12-03 08:58:43', '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000006', 20000.00, 202, 1, '2018-12-05 10:55:30', '2018-06-04 10:20:16');
INSERT INTO `vi_manager` VALUES ('VIU000007', 20000.00, 203, 1, NULL, '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000000', 20000.00, 200, 1, NULL, '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000001', 20000.00, 201, 1, NULL, '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000002', 20000.00, 202, 1, NULL, '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000003', 20000.00, 203, 1, NULL, '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000004', 20000.00, 204, 1, '2018-12-04 18:13:28', '2018-12-05 10:20:26');
INSERT INTO `vi_manager` VALUES ('VIU000008', 5000.00, 201, 1, '2018-12-05 11:50:44', '2018-12-05 11:50:44');

-- ----------------------------
-- Table structure for vi_role
-- ----------------------------
DROP TABLE IF EXISTS `vi_role`;
CREATE TABLE `vi_role`  (
  `user_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authority_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vi_role
-- ----------------------------
INSERT INTO `vi_role` VALUES ('VIU000000', 100);
INSERT INTO `vi_role` VALUES ('VIU000001', 101);
INSERT INTO `vi_role` VALUES ('VIU000002', 102);
INSERT INTO `vi_role` VALUES ('VIU000003', 103);
INSERT INTO `vi_role` VALUES ('VIU000004', 104);
INSERT INTO `vi_role` VALUES ('VIU000005', 101);
INSERT INTO `vi_role` VALUES ('VIU000006', 102);
INSERT INTO `vi_role` VALUES ('VIU000007', 104);
INSERT INTO `vi_role` VALUES ('VIU000008', 100);

-- ----------------------------
-- Table structure for vi_user
-- ----------------------------
DROP TABLE IF EXISTS `vi_user`;
CREATE TABLE `vi_user`  (
  `user_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_photo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vi_user
-- ----------------------------
INSERT INTO `vi_user` VALUES ('VIU000001', 'admin0', '123456', '2018-11-24', 'c1e298dd-3ebf-4579', '132141242314', '1543025435275@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000002', 'admin1', '123456', '2018-11-24', '2873c337-f4f5-4787', '4565745645435', '1543025435678@qq.com', NULL, '2018-12-03 04:27:19');
INSERT INTO `vi_user` VALUES ('VIU000003', 'admin2', '123456', '2018-11-24', '1d2fb503-58d1-477b', '132141242314', '1543025435695@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000004', 'admin3', '123456', '2018-11-24', '63a1601d-c395-42e6', '132141242314', '1543025435702@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000005', 'admin4', '123456', '2018-11-24', '469bbbe1-4976-4adf', '132141242314', '1543025435708@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000006', 'admin5', '123456', '2018-11-24', '6ea1a716-d597-4bd1', '132141242314', '1543025435714@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000007', 'admin6', '123456', '2018-11-24', 'be30ddae-e6eb-4aff', '132141242314', '1543025435721@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000008', 'admin7', '123456', '2018-11-24', '9f878229-e611-4c6f', '132141242314', '1543025435727@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000009', 'admin8', '123456', '2018-11-24', '42e5dd38-6820-4d68', '132141242314', '1543025435733@qq.com', NULL, NULL);
INSERT INTO `vi_user` VALUES ('VIU000010', 'admin9', '123456', '2018-11-24', '1beb71df-2786-4953', '132141242314', '1543025435740@qq.com', NULL, NULL);

-- ----------------------------
-- View structure for manager_role
-- ----------------------------
DROP VIEW IF EXISTS `manager_role`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `manager_role` AS select `vim`.`user_id` AS `user_id`,`viu`.`user_name` AS `user_name`,`viu`.`password` AS `password`,`viu`.`phone` AS `phone`,`viu`.`email` AS `email`,`vij`.`job_name` AS `job_name`,`vij`.`job_remark` AS `job_remark`,`vim`.`salary` AS `salary`,`via`.`authority_name` AS `authority_name`,`via`.`authority_remark` AS `authority_remark`,`vim`.`status` AS `status` from ((((`vi_manager` `vim` join `vi_role` `vir` on((`vim`.`user_id` = `vir`.`user_id`))) join `vi_authority` `via` on((`via`.`authority_id` = `vir`.`authority_id`))) join `vi_job` `vij` on((`vij`.`job_id` = `vim`.`job_id`))) join `vi_user` `viu` on((`viu`.`user_id` = `vim`.`user_id`)));

SET FOREIGN_KEY_CHECKS = 1;
