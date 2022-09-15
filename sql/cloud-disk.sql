/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : cloud-disk

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 15/09/2022 11:12:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for repository_pool
-- ----------------------------
DROP TABLE IF EXISTS `repository_pool`;
CREATE TABLE `repository_pool`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件的唯一标识',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `size` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repository_pool
-- ----------------------------
INSERT INTO `repository_pool` VALUES (1, '6719f98f-f6b0-41d6-b51d-ec274271df08', '5bd24a4f5108d82cbd21401b539cbe0c', 'kube-flannel.yml', '.yml', 5100, 'https://1-1257428686.cos.ap-nanjing.myqcloud.com/cloud-disk/6a72a2e4-3eb8-4624-b975-a5fa8972922b.yml', '2022-09-13 18:12:52', '2022-09-13 18:12:52', NULL);
INSERT INTO `repository_pool` VALUES (2, 'aae7df9e-eb6f-4247-915b-6f98767f3a87', '5bd24a4f5108d82cbd21401b539cbe0c', 'kube-flannel.yml', '.yml', 5100, 'https://1-1257428686.cos.ap-nanjing.myqcloud.com/cloud-disk/8303cecb-9d78-4e17-9488-4d1bfd36ffa8.yml', '2022-09-13 18:13:38', '2022-09-13 18:13:38', NULL);
INSERT INTO `repository_pool` VALUES (3, 'fd71604a-5a9a-42db-acce-233043f3b5e3', '5bd24a4f5108d82cbd21401b539cbe0c', 'kube-flannel.yml', '.yml', 5100, 'https://1-1257428686.cos.ap-nanjing.myqcloud.com/cloud-disk/e5183bf3-0f22-4dc2-a25a-ed999f136bcb.yml', '2022-09-13 18:13:43', '2022-09-13 18:13:43', NULL);
INSERT INTO `repository_pool` VALUES (4, 'b2e2e4d1-617e-4f8b-90e3-4a4ff76c45b3', '5bd24a4f5108d82cbd21401b539cbe0c', 'kube-flannel.yml', '.yml', 5100, 'https://1-1257428686.cos.ap-nanjing.myqcloud.com/cloud-disk/51564793-2012-4f0d-84e3-8ba7dcbd3bf5.yml', '2022-09-13 19:03:42', '2022-09-13 19:03:42', NULL);
INSERT INTO `repository_pool` VALUES (5, '79642a97-1ee4-4838-8a75-6f5d4f081dc4', '5bd24a4f5108d82cbd21401b539cbe0c', 'kube-flannel.yml', '.yml', 5100, 'https://1-1257428686.cos.ap-nanjing.myqcloud.com/cloud-disk/a08ab68b-3ed3-4c97-bbea-8f3b6c5ee2a8.yml', '2022-09-14 11:07:09', '2022-09-14 11:07:09', NULL);

-- ----------------------------
-- Table structure for share_basic
-- ----------------------------
DROP TABLE IF EXISTS `share_basic`;
CREATE TABLE `share_basic`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `repository_identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公共池中的唯一标识',
  `user_repository_identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户池子中的唯一标识',
  `expired_time` int(11) NULL DEFAULT NULL COMMENT '失效时间，单位秒, 【0-永不失效】',
  `click_num` int(11) NULL DEFAULT 0 COMMENT '点击次数',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of share_basic
-- ----------------------------
INSERT INTO `share_basic` VALUES (1, '1f05d27c-849f-4ab2-bd92-2b40411da702', 'USER_1', '79642a97-1ee4-4838-8a75-6f5d4f081dc4', 'dff2b783-edce-47f9-b556-5d3ad94349ba', 30, 2, '2022-09-14 19:12:19', '2022-09-14 19:12:19', NULL);

-- ----------------------------
-- Table structure for user_basic
-- ----------------------------
DROP TABLE IF EXISTS `user_basic`;
CREATE TABLE `user_basic`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_basic
-- ----------------------------
INSERT INTO `user_basic` VALUES (1, 'USER_1', 'adm', '202cb962ac59075b964b07152d234b70', 'email@q.a1', '2022-09-13 11:10:46', '2022-09-13 11:10:48', NULL);
INSERT INTO `user_basic` VALUES (2, '994cb2f2-4416-4b7e-8849-d35318f5ca34', 'test', '202cb962ac59075b964b07152d234b70', 'email@q.a2', '2022-09-13 17:13:19', '2022-09-13 17:13:19', NULL);

-- ----------------------------
-- Table structure for user_repository
-- ----------------------------
DROP TABLE IF EXISTS `user_repository`;
CREATE TABLE `user_repository`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `repository_identity` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件或文件夹类型',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_repository
-- ----------------------------
INSERT INTO `user_repository` VALUES (1, 'dff2b783-edce-47f9-b556-5d3ad94349ba', 'USER_1', 0, '79642a97-1ee4-4838-8a75-6f5d4f081dc4', '.yml', 'kube-flannel.yml', '2022-09-14 11:37:37', '2022-09-14 15:34:48', NULL);
INSERT INTO `user_repository` VALUES (2, '6430c49c-895e-4001-9cac-576f86157d7f', 'USER_1', 1, '', '', 'kube-flannel.yml1', '2022-09-14 18:54:47', '2022-09-14 19:05:18', NULL);
INSERT INTO `user_repository` VALUES (3, '2a15e790-a396-47fb-a2ce-e92bd073b26f', 'USER_1', 0, 'b2e2e4d1-617e-4f8b-90e3-4a4ff76c45b3', '.yml', 'kube-flannel.yml', '2022-09-14 19:21:06', '2022-09-14 19:21:06', NULL);

SET FOREIGN_KEY_CHECKS = 1;
