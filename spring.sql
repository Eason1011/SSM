/*
 Navicat Premium Data Transfer

 Source Server         : ieason
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : spring

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 14/03/2020 16:43:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `createName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES (1, '201901', '文学院', 'eason', 5799645, '2019-07-23 08:59:32', '管理员');
INSERT INTO `clazz` VALUES (2, '201902', '历史文化学院', 'ef', 5855088, '2019-07-22 18:40:20', '管理员');
INSERT INTO `clazz` VALUES (3, '201903', '教育学院', 'efk', 5621380, '2020-03-11 13:36:33', '管理员');
INSERT INTO `clazz` VALUES (4, '201904', '心理学院', 'efef', 5621339, NULL, '管理员');
INSERT INTO `clazz` VALUES (5, '201905', '马克思主义学院', 'efefef', 5621339, NULL, '管理员');
INSERT INTO `clazz` VALUES (6, '201906', '哲学学院', '马龙', 5521339, NULL, '管理员');
INSERT INTO `clazz` VALUES (7, '201907', '社会发展与公共管理', '马文', 571390, NULL, '管理员');
INSERT INTO `clazz` VALUES (8, '201908', '法学院', '马玉贤', 571280, NULL, '管理员');
INSERT INTO `clazz` VALUES (9, '201909', '经济学院', 'James', 5621345, NULL, '管理员');
INSERT INTO `clazz` VALUES (10, '201910', '商学院', 'Lebron', 5532345, NULL, '管理员');
INSERT INTO `clazz` VALUES (11, '201911', '计算机科学与工程', 'chen', 773203, NULL, '管理员');
INSERT INTO `clazz` VALUES (12, '201912', '外国语学院', 'Eason', 5621365, NULL, '管理员');
INSERT INTO `clazz` VALUES (13, '201913', '音乐学院', '马博', 7732894, NULL, NULL);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seq` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 'sex', '返校', '1', '是', 1, 1);
INSERT INTO `dict` VALUES (2, 'sex', '返校', '2', '否', 2, 1);
INSERT INTO `dict` VALUES (3, 'nation', '体温', '1', '是', 1, 1);
INSERT INTO `dict` VALUES (4, 'nation', '体温', '2', '否', 2, 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clazzId` int(11) NULL DEFAULT NULL,
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime NULL DEFAULT NULL,
  `nation` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `createName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clazzTeacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clazzName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clazzPhone` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (41, 1, '4624626', 'jdvnj', '1', '2019-07-01 00:00:00', '1', '2019-07-24 11:06:56', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (40, 2, '67', '??', '1', '2019-07-11 00:00:00', '2', '2019-07-24 09:17:16', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (11, 2, '34', '??', '1', '2019-07-22 00:00:00', '3', '2019-07-23 19:00:10', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (12, 1, '30', '??', '1', '2019-07-17 00:00:00', '2', '2019-07-23 19:11:55', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (13, 2, '56', '??', '1', '2019-07-10 00:00:00', '2', '2019-07-23 19:30:56', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (14, 2, '4545', '李四', '0', '2019-07-09 00:00:00', '2', '2019-07-23 19:37:22', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (15, 1, '22', '李四', '1', '2019-07-19 00:00:00', '2', '2019-07-23 18:29:25', '管理员', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (34, 2, '56', '??', '1', '2019-07-02 00:00:00', '2', '2019-07-24 07:55:45', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (32, 2, '45', '你好', '0', '2019-07-11 00:00:00', '2', '2019-07-23 19:44:07', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (43, 1, '124', 'indbhs', '1', '2019-07-09 00:00:00', '2', '2019-07-24 11:07:54', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (44, 1, '125', 'ryjr', '1', '2019-01-03 00:00:00', '3', '2019-07-24 11:08:21', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (45, 2, '125', 'tft', '1', '2019-07-07 00:00:00', '3', '2019-07-24 11:10:55', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (46, 1, '145', '???', '1', '2019-07-12 00:00:00', '2', '2019-07-24 11:47:39', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (47, 6, '150', '李四', '1', '2019-07-12 00:00:00', '1', '2019-07-24 11:51:00', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (48, 7, '160', '张三', '1', '2019-07-06 00:00:00', '2', '2019-07-24 11:54:55', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (49, 13, '177', '马博', '1', '2019-07-13 00:00:00', '2', '2019-07-24 12:02:45', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (50, 2, '777', '????', '1', '2019-07-11 00:00:00', '2', '2019-07-24 12:05:38', '???', NULL, '文学院', NULL);
INSERT INTO `student` VALUES (51, 1, '888', '?', '1', '2019-07-13 00:00:00', '2', '2019-07-24 12:08:07', '???', NULL, NULL, NULL);
INSERT INTO `student` VALUES (53, 1, '34', '????', '1', '2019-07-11 00:00:00', '1', '2019-07-24 16:36:17', '???', NULL, NULL, NULL);
INSERT INTO `student` VALUES (54, 1, 'IEason', '??', '1', '2019-07-16 00:00:00', '1', '2019-07-24 16:43:04', '???', NULL, NULL, NULL);
INSERT INTO `student` VALUES (55, 1, '7777', '????', '1', '2019-07-19 00:00:00', '2', '2019-07-27 11:07:06', '???', NULL, NULL, NULL);
INSERT INTO `student` VALUES (56, 1, '9999', '综合新', '1', '2019-07-12 00:00:00', '1', '2019-07-27 11:20:36', '管理员', NULL, NULL, NULL);
INSERT INTO `student` VALUES (59, 1, '201771030118', '常梦娇', '1', '2019-11-22 00:00:00', '1', '2020-03-11 13:45:27', '管理员', NULL, NULL, NULL);
INSERT INTO `student` VALUES (61, 3, '123', '李四', '2', '2020-03-21 00:00:00', '1', '2020-03-12 11:35:54', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (62, 1, '88888', '跟踪调查', '1', NULL, '1', '2020-03-12 13:13:46', '陈奕迅', '你好', '文学院', NULL);
INSERT INTO `student` VALUES (64, 2, '222222', '综合新闻', '1', NULL, '1', '2020-03-12 14:02:30', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (65, 2, '444444', '综合新闻', '1', '2020-03-02 00:00:00', '1', '2020-03-12 16:09:17', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (66, 5, '5678', '综合新闻', '1', '2020-03-09 00:00:00', '1', '2020-03-12 16:49:22', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (67, 13, '123456', '马文', '2', NULL, '1', '2020-03-13 23:17:55', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (68, 11, '2019937538', '马玉贤', '2', NULL, '1', '2020-03-14 09:23:57', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (69, 11, '201571049228', '马龙', '2', NULL, '1', '2020-03-14 10:48:06', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (70, 11, '201571049228', '马龙', '2', NULL, '1', '2020-03-14 10:49:26', '陈奕迅', NULL, NULL, NULL);
INSERT INTO `student` VALUES (71, 11, '201571049228', '马龙', '2', NULL, '1', '2020-03-14 10:50:08', '陈奕迅', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `status` int(11) NOT NULL COMMENT '用户状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '管理员', '123456', 1);
INSERT INTO `user` VALUES (2, 'IEason', '陈奕迅', '123456', 1);
INSERT INTO `user` VALUES (3, 'James', '詹姆斯', '123456', 2);
INSERT INTO `user` VALUES (4, 'cmj', '常梦娇', '123456', 1);

SET FOREIGN_KEY_CHECKS = 1;
