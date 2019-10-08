/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 08/10/2019 22:36:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for claim_voucher
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher`;
CREATE TABLE `claim_voucher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_sn` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `next_deal_sn` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total_amount` double NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_2`(`next_deal_sn`) USING BTREE,
  INDEX `FK_Reference_3`(`create_sn`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`next_deal_sn`) REFERENCES `employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`create_sn`) REFERENCES `employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of claim_voucher
-- ----------------------------
INSERT INTO `claim_voucher` VALUES (11, '一词', '10004', '2019-08-09 17:00:48', NULL, 246, '已打款');
INSERT INTO `claim_voucher` VALUES (12, '我的', '10004', '2019-08-09 17:01:10', '10002', 4999, '已审核');

-- ----------------------------
-- Table structure for claim_voucher_item
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher_item`;
CREATE TABLE `claim_voucher_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) NULL DEFAULT NULL,
  `item` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_4`(`claim_voucher_id`) USING BTREE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of claim_voucher_item
-- ----------------------------
INSERT INTO `claim_voucher_item` VALUES (18, 11, '交通', 123, '啊');
INSERT INTO `claim_voucher_item` VALUES (19, 12, '交通', 2500, '啊');
INSERT INTO `claim_voucher_item` VALUES (20, 12, '交通', 2499, '新');
INSERT INTO `claim_voucher_item` VALUES (21, 11, '交通', 123, '啊');

-- ----------------------------
-- Table structure for deal_record
-- ----------------------------
DROP TABLE IF EXISTS `deal_record`;
CREATE TABLE `deal_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) NULL DEFAULT NULL,
  `deal_sn` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deal_time` datetime(0) NULL DEFAULT NULL,
  `deal_way` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deal_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_5`(`claim_voucher_id`) USING BTREE,
  INDEX `FK_Reference_6`(`deal_sn`) USING BTREE,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`deal_sn`) REFERENCES `employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deal_record
-- ----------------------------
INSERT INTO `deal_record` VALUES (13, 12, '10004', '2019-08-09 17:01:40', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES (14, 11, '10004', '2019-08-09 17:01:42', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES (15, 12, '10003', '2019-08-09 17:09:59', '打回', '已打回', '');
INSERT INTO `deal_record` VALUES (16, 11, '10003', '2019-08-09 17:10:07', '打回', '已打回', '');
INSERT INTO `deal_record` VALUES (17, 12, '10004', '2019-08-09 17:10:41', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES (18, 11, '10004', '2019-08-09 17:10:43', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES (19, 11, '10003', '2019-08-09 17:11:00', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES (20, 12, '10003', '2019-08-09 17:11:14', '通过', '待复审', '');
INSERT INTO `deal_record` VALUES (21, 11, '10002', '2019-08-09 17:11:30', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES (22, 12, '10001', '2019-08-09 17:11:50', '打回', '已打回', '');
INSERT INTO `deal_record` VALUES (23, 12, '10004', '2019-08-09 17:12:22', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES (24, 12, '10003', '2019-08-09 17:12:49', '通过', '已审核', '');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `sn` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('10001', '总经理办公室', '星星大厦E座1201');
INSERT INTO `department` VALUES ('10002', '财务部', '星星大厦E座1202');
INSERT INTO `department` VALUES ('10003', '事业部', '星星大厦E座1101');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `sn` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_sn` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `post` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sn`) USING BTREE,
  INDEX `FK_Reference_1`(`department_sn`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`department_sn`) REFERENCES `department` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('10001', '123', '刘备', '10001', '总经理');
INSERT INTO `employee` VALUES ('10002', '000000', '孙尚香', '10002', '财务');
INSERT INTO `employee` VALUES ('10003', '000000', '关羽', '10003', '部门经理');
INSERT INTO `employee` VALUES ('10004', '000000', '周仓', '10003', '员工');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `money` double(20, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('张三', 85);
INSERT INTO `user` VALUES ('王一', 100);

-- ----------------------------
-- View structure for u
-- ----------------------------
DROP VIEW IF EXISTS `u`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `u` AS select `u`.`money` AS `money`,`u`.`user` AS `uname` from `user` `u`;

SET FOREIGN_KEY_CHECKS = 1;
