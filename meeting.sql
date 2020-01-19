/*
Navicat MySQL Data Transfer

Source Server         : 10.0.0.12_3306
Source Server Version : 50625
Source Host           : 10.0.0.12:3306
Source Database       : meeting

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-01-19 16:48:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for calendar_index
-- ----------------------------
DROP TABLE IF EXISTS `calendar_index`;
CREATE TABLE `calendar_index` (
  `row_id` varchar(255) NOT NULL,
  `a_title` varchar(255) DEFAULT NULL,
  `a_date` datetime DEFAULT NULL,
  `a_year` varchar(255) DEFAULT NULL,
  `a_week` varchar(255) DEFAULT NULL,
  `week_start_date` date DEFAULT NULL,
  `week_end_date` date DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `data_status` varchar(255) DEFAULT NULL,
  `data_order` varchar(255) DEFAULT NULL,
  `data_deleted` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `ext2` date DEFAULT NULL,
  `ex3` datetime DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `a_year` (`a_year`) USING BTREE,
  KEY `a_week` (`a_week`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendar_index
-- ----------------------------
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe1320000', null, null, '2019', '1', '2018-12-31', '2019-01-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe18f0001', null, null, '2019', '2', '2019-01-07', '2019-01-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe1a80002', null, null, '2019', '3', '2019-01-14', '2019-01-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe1bb0003', null, null, '2019', '4', '2019-01-21', '2019-01-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe1ce0004', null, null, '2019', '5', '2019-01-28', '2019-02-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe1e10005', null, null, '2019', '6', '2019-02-04', '2019-02-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe1f40006', null, null, '2019', '7', '2019-02-11', '2019-02-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe2070007', null, null, '2019', '8', '2019-02-18', '2019-02-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe21b0008', null, null, '2019', '9', '2019-02-25', '2019-03-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe2300009', null, null, '2019', '10', '2019-03-04', '2019-03-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe246000a', null, null, '2019', '11', '2019-03-11', '2019-03-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe259000b', null, null, '2019', '12', '2019-03-18', '2019-03-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe26f000c', null, null, '2019', '13', '2019-03-25', '2019-03-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe284000d', null, null, '2019', '14', '2019-04-01', '2019-04-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe297000e', null, null, '2019', '15', '2019-04-08', '2019-04-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe2ab000f', null, null, '2019', '16', '2019-04-15', '2019-04-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe2be0010', null, null, '2019', '17', '2019-04-22', '2019-04-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe2d10011', null, null, '2019', '18', '2019-04-29', '2019-05-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe2e50012', null, null, '2019', '19', '2019-05-06', '2019-05-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe2fd0013', null, null, '2019', '20', '2019-05-13', '2019-05-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3100014', null, null, '2019', '21', '2019-05-20', '2019-05-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3230015', null, null, '2019', '22', '2019-05-27', '2019-06-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3360016', null, null, '2019', '23', '2019-06-03', '2019-06-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe34b0017', null, null, '2019', '24', '2019-06-10', '2019-06-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3610018', null, null, '2019', '25', '2019-06-17', '2019-06-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3750019', null, null, '2019', '26', '2019-06-24', '2019-06-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe38b001a', null, null, '2019', '27', '2019-07-01', '2019-07-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe39e001b', null, null, '2019', '28', '2019-07-08', '2019-07-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3b2001c', null, null, '2019', '29', '2019-07-15', '2019-07-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3c5001d', null, null, '2019', '30', '2019-07-22', '2019-07-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3d6001e', null, null, '2019', '31', '2019-07-29', '2019-08-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3e9001f', null, null, '2019', '32', '2019-08-05', '2019-08-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe3fc0020', null, null, '2019', '33', '2019-08-12', '2019-08-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4100021', null, null, '2019', '34', '2019-08-19', '2019-08-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4230022', null, null, '2019', '35', '2019-08-26', '2019-09-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4370023', null, null, '2019', '36', '2019-09-02', '2019-09-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4490024', null, null, '2019', '37', '2019-09-09', '2019-09-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe45b0025', null, null, '2019', '38', '2019-09-16', '2019-09-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe46e0026', null, null, '2019', '39', '2019-09-23', '2019-09-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4820027', null, null, '2019', '40', '2019-09-30', '2019-10-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4960028', null, null, '2019', '41', '2019-10-07', '2019-10-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4a80029', null, null, '2019', '42', '2019-10-14', '2019-10-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4ba002a', null, null, '2019', '43', '2019-10-21', '2019-10-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4cc002b', null, null, '2019', '44', '2019-10-28', '2019-11-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4dd002c', null, null, '2019', '45', '2019-11-04', '2019-11-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe4ee002d', null, null, '2019', '46', '2019-11-11', '2019-11-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe501002e', null, null, '2019', '47', '2019-11-18', '2019-11-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe514002f', null, null, '2019', '48', '2019-11-25', '2019-12-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe5270030', null, null, '2019', '49', '2019-12-02', '2019-12-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe5390031', null, null, '2019', '50', '2019-12-09', '2019-12-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe54c0032', null, null, '2019', '51', '2019-12-16', '2019-12-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f414f65016f414fe55e0033', null, null, '2019', '52', '2019-12-23', '2019-12-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c7fd50000', null, null, '2020', '1', '2019-12-30', '2020-01-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80040001', null, null, '2020', '2', '2020-01-06', '2020-01-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80140002', null, null, '2020', '3', '2020-01-13', '2020-01-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80340003', null, null, '2020', '4', '2020-01-20', '2020-01-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c804a0004', null, null, '2020', '5', '2020-01-27', '2020-02-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c805b0005', null, null, '2020', '6', '2020-02-03', '2020-02-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c806d0006', null, null, '2020', '7', '2020-02-10', '2020-02-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c807e0007', null, null, '2020', '8', '2020-02-17', '2020-02-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80a00008', null, null, '2020', '9', '2020-02-24', '2020-03-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80bc0009', null, null, '2020', '10', '2020-03-02', '2020-03-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80ce000a', null, null, '2020', '11', '2020-03-09', '2020-03-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80de000b', null, null, '2020', '12', '2020-03-16', '2020-03-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c80fb000c', null, null, '2020', '13', '2020-03-23', '2020-03-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c810c000d', null, null, '2020', '14', '2020-03-30', '2020-04-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8120000e', null, null, '2020', '15', '2020-04-06', '2020-04-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c812f000f', null, null, '2020', '16', '2020-04-13', '2020-04-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81420010', null, null, '2020', '17', '2020-04-20', '2020-04-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81560011', null, null, '2020', '18', '2020-04-27', '2020-05-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c816e0012', null, null, '2020', '19', '2020-05-04', '2020-05-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81830013', null, null, '2020', '20', '2020-05-11', '2020-05-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81930014', null, null, '2020', '21', '2020-05-18', '2020-05-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81a30015', null, null, '2020', '22', '2020-05-25', '2020-05-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81b90016', null, null, '2020', '23', '2020-06-01', '2020-06-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81cc0017', null, null, '2020', '24', '2020-06-08', '2020-06-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81dd0018', null, null, '2020', '25', '2020-06-15', '2020-06-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c81ef0019', null, null, '2020', '26', '2020-06-22', '2020-06-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8201001a', null, null, '2020', '27', '2020-06-29', '2020-07-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8212001b', null, null, '2020', '28', '2020-07-06', '2020-07-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8227001c', null, null, '2020', '29', '2020-07-13', '2020-07-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c823a001d', null, null, '2020', '30', '2020-07-20', '2020-07-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8249001e', null, null, '2020', '31', '2020-07-27', '2020-08-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c825a001f', null, null, '2020', '32', '2020-08-03', '2020-08-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c82690020', null, null, '2020', '33', '2020-08-10', '2020-08-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c82790021', null, null, '2020', '34', '2020-08-17', '2020-08-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c828e0022', null, null, '2020', '35', '2020-08-24', '2020-08-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c82a00023', null, null, '2020', '36', '2020-08-31', '2020-09-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c82c90024', null, null, '2020', '37', '2020-09-07', '2020-09-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c82d90025', null, null, '2020', '38', '2020-09-14', '2020-09-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c82e90026', null, null, '2020', '39', '2020-09-21', '2020-09-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c82fd0027', null, null, '2020', '40', '2020-09-28', '2020-10-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c830e0028', null, null, '2020', '41', '2020-10-05', '2020-10-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c83240029', null, null, '2020', '42', '2020-10-12', '2020-10-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8334002a', null, null, '2020', '43', '2020-10-19', '2020-10-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8346002b', null, null, '2020', '44', '2020-10-26', '2020-11-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c835a002c', null, null, '2020', '45', '2020-11-02', '2020-11-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c836a002d', null, null, '2020', '46', '2020-11-09', '2020-11-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c837a002e', null, null, '2020', '47', '2020-11-16', '2020-11-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c8390002f', null, null, '2020', '48', '2020-11-23', '2020-11-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c83a40030', null, null, '2020', '49', '2020-11-30', '2020-12-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c83be0031', null, null, '2020', '50', '2020-12-07', '2020-12-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c83ce0032', null, null, '2020', '51', '2020-12-14', '2020-12-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f555b96016f555c83dd0033', null, null, '2020', '52', '2020-12-21', '2020-12-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f54e0034', null, null, '2021', '1', '2020-12-28', '2021-01-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f5750035', null, null, '2021', '2', '2021-01-04', '2021-01-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f58b0036', null, null, '2021', '3', '2021-01-11', '2021-01-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f59c0037', null, null, '2021', '4', '2021-01-18', '2021-01-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f5af0038', null, null, '2021', '5', '2021-01-25', '2021-01-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f5c00039', null, null, '2021', '6', '2021-02-01', '2021-02-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f5d5003a', null, null, '2021', '7', '2021-02-08', '2021-02-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f5f3003b', null, null, '2021', '8', '2021-02-15', '2021-02-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f609003c', null, null, '2021', '9', '2021-02-22', '2021-02-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f619003d', null, null, '2021', '10', '2021-03-01', '2021-03-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f62f003e', null, null, '2021', '11', '2021-03-08', '2021-03-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f63f003f', null, null, '2021', '12', '2021-03-15', '2021-03-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f65a0040', null, null, '2021', '13', '2021-03-22', '2021-03-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6710041', null, null, '2021', '14', '2021-03-29', '2021-04-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6820042', null, null, '2021', '15', '2021-04-05', '2021-04-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6960043', null, null, '2021', '16', '2021-04-12', '2021-04-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6b00044', null, null, '2021', '17', '2021-04-19', '2021-04-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6c20045', null, null, '2021', '18', '2021-04-26', '2021-05-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6d50046', null, null, '2021', '19', '2021-05-03', '2021-05-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6e50047', null, null, '2021', '20', '2021-05-10', '2021-05-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f6f70048', null, null, '2021', '21', '2021-05-17', '2021-05-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f70f0049', null, null, '2021', '22', '2021-05-24', '2021-05-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f720004a', null, null, '2021', '23', '2021-05-31', '2021-06-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f732004b', null, null, '2021', '24', '2021-06-07', '2021-06-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f742004c', null, null, '2021', '25', '2021-06-14', '2021-06-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f755004d', null, null, '2021', '26', '2021-06-21', '2021-06-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f766004e', null, null, '2021', '27', '2021-06-28', '2021-07-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f776004f', null, null, '2021', '28', '2021-07-05', '2021-07-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f7890050', null, null, '2021', '29', '2021-07-12', '2021-07-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f7980051', null, null, '2021', '30', '2021-07-19', '2021-07-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f7ac0052', null, null, '2021', '31', '2021-07-26', '2021-08-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f7be0053', null, null, '2021', '32', '2021-08-02', '2021-08-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f7d30054', null, null, '2021', '33', '2021-08-09', '2021-08-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f7e50055', null, null, '2021', '34', '2021-08-16', '2021-08-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f7f40056', null, null, '2021', '35', '2021-08-23', '2021-08-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8040057', null, null, '2021', '36', '2021-08-30', '2021-09-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8160058', null, null, '2021', '37', '2021-09-06', '2021-09-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8260059', null, null, '2021', '38', '2021-09-13', '2021-09-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f836005a', null, null, '2021', '39', '2021-09-20', '2021-09-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f847005b', null, null, '2021', '40', '2021-09-27', '2021-10-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f857005c', null, null, '2021', '41', '2021-10-04', '2021-10-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f876005d', null, null, '2021', '42', '2021-10-11', '2021-10-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f886005e', null, null, '2021', '43', '2021-10-18', '2021-10-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f898005f', null, null, '2021', '44', '2021-10-25', '2021-10-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8a90060', null, null, '2021', '45', '2021-11-01', '2021-11-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8b80061', null, null, '2021', '46', '2021-11-08', '2021-11-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8c60062', null, null, '2021', '47', '2021-11-15', '2021-11-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8d40063', null, null, '2021', '48', '2021-11-22', '2021-11-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8e80064', null, null, '2021', '49', '2021-11-29', '2021-12-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f8fc0065', null, null, '2021', '50', '2021-12-06', '2021-12-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f9120066', null, null, '2021', '51', '2021-12-13', '2021-12-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index` VALUES ('8a80800a6f63f642016f63f7f9210067', null, null, '2021', '52', '2021-12-20', '2021-12-26', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for calendar_index_copy
-- ----------------------------
DROP TABLE IF EXISTS `calendar_index_copy`;
CREATE TABLE `calendar_index_copy` (
  `row_id` varchar(255) NOT NULL,
  `a_title` varchar(255) DEFAULT NULL,
  `a_date` datetime DEFAULT NULL,
  `a_year` varchar(255) DEFAULT NULL,
  `a_week` varchar(255) DEFAULT NULL,
  `week_start_date` date DEFAULT NULL,
  `week_end_date` date DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `data_status` varchar(255) DEFAULT NULL,
  `data_order` varchar(255) DEFAULT NULL,
  `data_deleted` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `ext2` date DEFAULT NULL,
  `ex3` datetime DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `a_year` (`a_year`) USING BTREE,
  KEY `a_week` (`a_week`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendar_index_copy
-- ----------------------------
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe1320000', null, null, '2019', '1', '2018-12-31', '2019-01-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe18f0001', null, null, '2019', '2', '2019-01-07', '2019-01-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe1a80002', null, null, '2019', '3', '2019-01-14', '2019-01-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe1bb0003', null, null, '2019', '4', '2019-01-21', '2019-01-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe1ce0004', null, null, '2019', '5', '2019-01-28', '2019-02-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe1e10005', null, null, '2019', '6', '2019-02-04', '2019-02-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe1f40006', null, null, '2019', '7', '2019-02-11', '2019-02-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe2070007', null, null, '2019', '8', '2019-02-18', '2019-02-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe21b0008', null, null, '2019', '9', '2019-02-25', '2019-03-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe2300009', null, null, '2019', '10', '2019-03-04', '2019-03-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe246000a', null, null, '2019', '11', '2019-03-11', '2019-03-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe259000b', null, null, '2019', '12', '2019-03-18', '2019-03-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe26f000c', null, null, '2019', '13', '2019-03-25', '2019-03-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe284000d', null, null, '2019', '14', '2019-04-01', '2019-04-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe297000e', null, null, '2019', '15', '2019-04-08', '2019-04-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe2ab000f', null, null, '2019', '16', '2019-04-15', '2019-04-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe2be0010', null, null, '2019', '17', '2019-04-22', '2019-04-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe2d10011', null, null, '2019', '18', '2019-04-29', '2019-05-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe2e50012', null, null, '2019', '19', '2019-05-06', '2019-05-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe2fd0013', null, null, '2019', '20', '2019-05-13', '2019-05-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3100014', null, null, '2019', '21', '2019-05-20', '2019-05-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3230015', null, null, '2019', '22', '2019-05-27', '2019-06-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3360016', null, null, '2019', '23', '2019-06-03', '2019-06-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe34b0017', null, null, '2019', '24', '2019-06-10', '2019-06-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3610018', null, null, '2019', '25', '2019-06-17', '2019-06-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3750019', null, null, '2019', '26', '2019-06-24', '2019-06-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe38b001a', null, null, '2019', '27', '2019-07-01', '2019-07-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe39e001b', null, null, '2019', '28', '2019-07-08', '2019-07-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3b2001c', null, null, '2019', '29', '2019-07-15', '2019-07-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3c5001d', null, null, '2019', '30', '2019-07-22', '2019-07-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3d6001e', null, null, '2019', '31', '2019-07-29', '2019-08-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3e9001f', null, null, '2019', '32', '2019-08-05', '2019-08-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe3fc0020', null, null, '2019', '33', '2019-08-12', '2019-08-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4100021', null, null, '2019', '34', '2019-08-19', '2019-08-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4230022', null, null, '2019', '35', '2019-08-26', '2019-09-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4370023', null, null, '2019', '36', '2019-09-02', '2019-09-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4490024', null, null, '2019', '37', '2019-09-09', '2019-09-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe45b0025', null, null, '2019', '38', '2019-09-16', '2019-09-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe46e0026', null, null, '2019', '39', '2019-09-23', '2019-09-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4820027', null, null, '2019', '40', '2019-09-30', '2019-10-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4960028', null, null, '2019', '41', '2019-10-07', '2019-10-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4a80029', null, null, '2019', '42', '2019-10-14', '2019-10-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4ba002a', null, null, '2019', '43', '2019-10-21', '2019-10-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4cc002b', null, null, '2019', '44', '2019-10-28', '2019-11-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4dd002c', null, null, '2019', '45', '2019-11-04', '2019-11-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe4ee002d', null, null, '2019', '46', '2019-11-11', '2019-11-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe501002e', null, null, '2019', '47', '2019-11-18', '2019-11-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe514002f', null, null, '2019', '48', '2019-11-25', '2019-12-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe5270030', null, null, '2019', '49', '2019-12-02', '2019-12-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe5390031', null, null, '2019', '50', '2019-12-09', '2019-12-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe54c0032', null, null, '2019', '51', '2019-12-16', '2019-12-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f414f65016f414fe55e0033', null, null, '2019', '52', '2019-12-23', '2019-12-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c7fd50000', null, null, '2020', '1', '2019-12-30', '2020-01-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80040001', null, null, '2020', '2', '2020-01-06', '2020-01-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80140002', null, null, '2020', '3', '2020-01-13', '2020-01-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80340003', null, null, '2020', '4', '2020-01-20', '2020-01-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c804a0004', null, null, '2020', '5', '2020-01-27', '2020-02-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c805b0005', null, null, '2020', '6', '2020-02-03', '2020-02-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c806d0006', null, null, '2020', '7', '2020-02-10', '2020-02-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c807e0007', null, null, '2020', '8', '2020-02-17', '2020-02-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80a00008', null, null, '2020', '9', '2020-02-24', '2020-03-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80bc0009', null, null, '2020', '10', '2020-03-02', '2020-03-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80ce000a', null, null, '2020', '11', '2020-03-09', '2020-03-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80de000b', null, null, '2020', '12', '2020-03-16', '2020-03-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c80fb000c', null, null, '2020', '13', '2020-03-23', '2020-03-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c810c000d', null, null, '2020', '14', '2020-03-30', '2020-04-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8120000e', null, null, '2020', '15', '2020-04-06', '2020-04-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c812f000f', null, null, '2020', '16', '2020-04-13', '2020-04-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81420010', null, null, '2020', '17', '2020-04-20', '2020-04-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81560011', null, null, '2020', '18', '2020-04-27', '2020-05-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c816e0012', null, null, '2020', '19', '2020-05-04', '2020-05-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81830013', null, null, '2020', '20', '2020-05-11', '2020-05-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81930014', null, null, '2020', '21', '2020-05-18', '2020-05-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81a30015', null, null, '2020', '22', '2020-05-25', '2020-05-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81b90016', null, null, '2020', '23', '2020-06-01', '2020-06-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81cc0017', null, null, '2020', '24', '2020-06-08', '2020-06-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81dd0018', null, null, '2020', '25', '2020-06-15', '2020-06-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c81ef0019', null, null, '2020', '26', '2020-06-22', '2020-06-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8201001a', null, null, '2020', '27', '2020-06-29', '2020-07-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8212001b', null, null, '2020', '28', '2020-07-06', '2020-07-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8227001c', null, null, '2020', '29', '2020-07-13', '2020-07-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c823a001d', null, null, '2020', '30', '2020-07-20', '2020-07-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8249001e', null, null, '2020', '31', '2020-07-27', '2020-08-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c825a001f', null, null, '2020', '32', '2020-08-03', '2020-08-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c82690020', null, null, '2020', '33', '2020-08-10', '2020-08-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c82790021', null, null, '2020', '34', '2020-08-17', '2020-08-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c828e0022', null, null, '2020', '35', '2020-08-24', '2020-08-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c82a00023', null, null, '2020', '36', '2020-08-31', '2020-09-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c82c90024', null, null, '2020', '37', '2020-09-07', '2020-09-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c82d90025', null, null, '2020', '38', '2020-09-14', '2020-09-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c82e90026', null, null, '2020', '39', '2020-09-21', '2020-09-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c82fd0027', null, null, '2020', '40', '2020-09-28', '2020-10-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c830e0028', null, null, '2020', '41', '2020-10-05', '2020-10-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c83240029', null, null, '2020', '42', '2020-10-12', '2020-10-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8334002a', null, null, '2020', '43', '2020-10-19', '2020-10-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8346002b', null, null, '2020', '44', '2020-10-26', '2020-11-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c835a002c', null, null, '2020', '45', '2020-11-02', '2020-11-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c836a002d', null, null, '2020', '46', '2020-11-09', '2020-11-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c837a002e', null, null, '2020', '47', '2020-11-16', '2020-11-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c8390002f', null, null, '2020', '48', '2020-11-23', '2020-11-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c83a40030', null, null, '2020', '49', '2020-11-30', '2020-12-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c83be0031', null, null, '2020', '50', '2020-12-07', '2020-12-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c83ce0032', null, null, '2020', '51', '2020-12-14', '2020-12-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f555b96016f555c83dd0033', null, null, '2020', '52', '2020-12-21', '2020-12-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59a790000', null, null, '2021', '1', '2020-12-28', '2021-01-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59aa50001', null, null, '2021', '2', '2021-01-04', '2021-01-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59ab60002', null, null, '2021', '3', '2021-01-11', '2021-01-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59ac60003', null, null, '2021', '4', '2021-01-18', '2021-01-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59ad50004', null, null, '2021', '5', '2021-01-25', '2021-01-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59ae50005', null, null, '2021', '6', '2021-02-01', '2021-02-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59af30006', null, null, '2021', '7', '2021-02-08', '2021-02-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b030007', null, null, '2021', '8', '2021-02-15', '2021-02-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b140008', null, null, '2021', '9', '2021-02-22', '2021-02-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b230009', null, null, '2021', '10', '2021-03-01', '2021-03-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b32000a', null, null, '2021', '11', '2021-03-08', '2021-03-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b42000b', null, null, '2021', '12', '2021-03-15', '2021-03-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b52000c', null, null, '2021', '13', '2021-03-22', '2021-03-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b61000d', null, null, '2021', '14', '2021-03-29', '2021-04-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b71000e', null, null, '2021', '15', '2021-04-05', '2021-04-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b82000f', null, null, '2021', '16', '2021-04-12', '2021-04-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59b910010', null, null, '2021', '17', '2021-04-19', '2021-04-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59ba00011', null, null, '2021', '18', '2021-04-26', '2021-05-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59bb20012', null, null, '2021', '19', '2021-05-03', '2021-05-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59bc30013', null, null, '2021', '20', '2021-05-10', '2021-05-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59bd20014', null, null, '2021', '21', '2021-05-17', '2021-05-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59be30015', null, null, '2021', '22', '2021-05-24', '2021-05-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59bf20016', null, null, '2021', '23', '2021-05-31', '2021-06-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c000017', null, null, '2021', '24', '2021-06-07', '2021-06-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c0f0018', null, null, '2021', '25', '2021-06-14', '2021-06-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c1e0019', null, null, '2021', '26', '2021-06-21', '2021-06-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c2f001a', null, null, '2021', '27', '2021-06-28', '2021-07-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c3f001b', null, null, '2021', '28', '2021-07-05', '2021-07-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c50001c', null, null, '2021', '29', '2021-07-12', '2021-07-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c5f001d', null, null, '2021', '30', '2021-07-19', '2021-07-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c6f001e', null, null, '2021', '31', '2021-07-26', '2021-08-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c7f001f', null, null, '2021', '32', '2021-08-02', '2021-08-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c8d0020', null, null, '2021', '33', '2021-08-09', '2021-08-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59c9b0021', null, null, '2021', '34', '2021-08-16', '2021-08-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59cab0022', null, null, '2021', '35', '2021-08-23', '2021-08-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59cbb0023', null, null, '2021', '36', '2021-08-30', '2021-09-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59cc90024', null, null, '2021', '37', '2021-09-06', '2021-09-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59cd80025', null, null, '2021', '38', '2021-09-13', '2021-09-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59ce70026', null, null, '2021', '39', '2021-09-20', '2021-09-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59cf70027', null, null, '2021', '40', '2021-09-27', '2021-10-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d070028', null, null, '2021', '41', '2021-10-04', '2021-10-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d170029', null, null, '2021', '42', '2021-10-11', '2021-10-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d28002a', null, null, '2021', '43', '2021-10-18', '2021-10-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d37002b', null, null, '2021', '44', '2021-10-25', '2021-10-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d47002c', null, null, '2021', '45', '2021-11-01', '2021-11-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d58002d', null, null, '2021', '46', '2021-11-08', '2021-11-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d67002e', null, null, '2021', '47', '2021-11-15', '2021-11-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d76002f', null, null, '2021', '48', '2021-11-22', '2021-11-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d850030', null, null, '2021', '49', '2021-11-29', '2021-12-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59d940031', null, null, '2021', '50', '2021-12-06', '2021-12-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59da30032', null, null, '2021', '51', '2021-12-13', '2021-12-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c59db20033', null, null, '2021', '52', '2021-12-20', '2021-12-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3000035', null, null, '2022', '1', '2021-12-27', '2022-01-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3130036', null, null, '2022', '2', '2022-01-03', '2022-01-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3270037', null, null, '2022', '3', '2022-01-10', '2022-01-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3380038', null, null, '2022', '4', '2022-01-17', '2022-01-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c34a0039', null, null, '2022', '5', '2022-01-24', '2022-01-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c35b003a', null, null, '2022', '6', '2022-01-31', '2022-02-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c36c003b', null, null, '2022', '7', '2022-02-07', '2022-02-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c37d003c', null, null, '2022', '8', '2022-02-14', '2022-02-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c38e003d', null, null, '2022', '9', '2022-02-21', '2022-02-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c39f003e', null, null, '2022', '10', '2022-02-28', '2022-03-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3b0003f', null, null, '2022', '11', '2022-03-07', '2022-03-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3c00040', null, null, '2022', '12', '2022-03-14', '2022-03-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3d10041', null, null, '2022', '13', '2022-03-21', '2022-03-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3e30042', null, null, '2022', '14', '2022-03-28', '2022-04-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c3f40043', null, null, '2022', '15', '2022-04-04', '2022-04-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4050044', null, null, '2022', '16', '2022-04-11', '2022-04-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4180045', null, null, '2022', '17', '2022-04-18', '2022-04-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4280046', null, null, '2022', '18', '2022-04-25', '2022-05-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4380047', null, null, '2022', '19', '2022-05-02', '2022-05-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4490048', null, null, '2022', '20', '2022-05-09', '2022-05-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c45e0049', null, null, '2022', '21', '2022-05-16', '2022-05-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c471004a', null, null, '2022', '22', '2022-05-23', '2022-05-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c485004b', null, null, '2022', '23', '2022-05-30', '2022-06-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c497004c', null, null, '2022', '24', '2022-06-06', '2022-06-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4ab004d', null, null, '2022', '25', '2022-06-13', '2022-06-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4c0004e', null, null, '2022', '26', '2022-06-20', '2022-06-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4d2004f', null, null, '2022', '27', '2022-06-27', '2022-07-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4e80050', null, null, '2022', '28', '2022-07-04', '2022-07-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c4fc0051', null, null, '2022', '29', '2022-07-11', '2022-07-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c50c0052', null, null, '2022', '30', '2022-07-18', '2022-07-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c51f0053', null, null, '2022', '31', '2022-07-25', '2022-07-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5320054', null, null, '2022', '32', '2022-08-01', '2022-08-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5430055', null, null, '2022', '33', '2022-08-08', '2022-08-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5530056', null, null, '2022', '34', '2022-08-15', '2022-08-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5640057', null, null, '2022', '35', '2022-08-22', '2022-08-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5750058', null, null, '2022', '36', '2022-08-29', '2022-09-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5880059', null, null, '2022', '37', '2022-09-05', '2022-09-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c599005a', null, null, '2022', '38', '2022-09-12', '2022-09-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5aa005b', null, null, '2022', '39', '2022-09-19', '2022-09-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5bb005c', null, null, '2022', '40', '2022-09-26', '2022-10-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5cc005d', null, null, '2022', '41', '2022-10-03', '2022-10-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5e0005e', null, null, '2022', '42', '2022-10-10', '2022-10-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c5f5005f', null, null, '2022', '43', '2022-10-17', '2022-10-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c6080060', null, null, '2022', '44', '2022-10-24', '2022-10-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c61a0061', null, null, '2022', '45', '2022-10-31', '2022-11-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c62c0062', null, null, '2022', '46', '2022-11-07', '2022-11-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c63f0063', null, null, '2022', '47', '2022-11-14', '2022-11-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c6530064', null, null, '2022', '48', '2022-11-21', '2022-11-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c6670065', null, null, '2022', '49', '2022-11-28', '2022-12-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c67a0066', null, null, '2022', '50', '2022-12-05', '2022-12-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c68d0067', null, null, '2022', '51', '2022-12-12', '2022-12-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c5c6a00068', null, null, '2022', '52', '2022-12-19', '2022-12-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c9409b0107', null, null, '2023', '1', '2022-12-26', '2023-01-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c9409b0109', null, null, '2023', '2', '2023-01-02', '2023-01-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c940bb010a', null, null, '2023', '3', '2023-01-09', '2023-01-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c940d7010b', null, null, '2023', '4', '2023-01-16', '2023-01-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c940eb010c', null, null, '2023', '5', '2023-01-23', '2023-01-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c940fd010d', null, null, '2023', '6', '2023-01-30', '2023-02-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c9410f010e', null, null, '2023', '7', '2023-02-06', '2023-02-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94122010f', null, null, '2023', '8', '2023-02-13', '2023-02-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941340110', null, null, '2023', '9', '2023-02-20', '2023-02-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941450111', null, null, '2023', '10', '2023-02-27', '2023-03-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941570112', null, null, '2023', '11', '2023-03-06', '2023-03-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941670113', null, null, '2023', '12', '2023-03-13', '2023-03-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941760114', null, null, '2023', '13', '2023-03-20', '2023-03-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941850115', null, null, '2023', '14', '2023-03-27', '2023-04-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941960116', null, null, '2023', '15', '2023-04-03', '2023-04-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941a70117', null, null, '2023', '16', '2023-04-10', '2023-04-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941b80118', null, null, '2023', '17', '2023-04-17', '2023-04-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941c50119', null, null, '2023', '18', '2023-04-24', '2023-04-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941d4011a', null, null, '2023', '19', '2023-05-01', '2023-05-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941e3011b', null, null, '2023', '20', '2023-05-08', '2023-05-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c941f4011c', null, null, '2023', '21', '2023-05-15', '2023-05-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94205011d', null, null, '2023', '22', '2023-05-22', '2023-05-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94215011e', null, null, '2023', '23', '2023-05-29', '2023-06-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94224011f', null, null, '2023', '24', '2023-06-05', '2023-06-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942350120', null, null, '2023', '25', '2023-06-12', '2023-06-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942450121', null, null, '2023', '26', '2023-06-19', '2023-06-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942550122', null, null, '2023', '27', '2023-06-26', '2023-07-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942680123', null, null, '2023', '28', '2023-07-03', '2023-07-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942780124', null, null, '2023', '29', '2023-07-10', '2023-07-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c9428b0125', null, null, '2023', '30', '2023-07-17', '2023-07-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c9429a0126', null, null, '2023', '31', '2023-07-24', '2023-07-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942a80127', null, null, '2023', '32', '2023-07-31', '2023-08-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942b60128', null, null, '2023', '33', '2023-08-07', '2023-08-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942c60129', null, null, '2023', '34', '2023-08-14', '2023-08-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942d4012a', null, null, '2023', '35', '2023-08-21', '2023-08-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942e2012b', null, null, '2023', '36', '2023-08-28', '2023-09-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c942f0012c', null, null, '2023', '37', '2023-09-04', '2023-09-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94301012d', null, null, '2023', '38', '2023-09-11', '2023-09-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94311012e', null, null, '2023', '39', '2023-09-18', '2023-09-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c9431f012f', null, null, '2023', '40', '2023-09-25', '2023-10-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943310130', null, null, '2023', '41', '2023-10-02', '2023-10-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943430131', null, null, '2023', '42', '2023-10-09', '2023-10-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943530132', null, null, '2023', '43', '2023-10-16', '2023-10-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943640133', null, null, '2023', '44', '2023-10-23', '2023-10-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943740134', null, null, '2023', '45', '2023-10-30', '2023-11-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943840135', null, null, '2023', '46', '2023-11-06', '2023-11-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943940136', null, null, '2023', '47', '2023-11-13', '2023-11-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943a60137', null, null, '2023', '48', '2023-11-20', '2023-11-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943bb0138', null, null, '2023', '49', '2023-11-27', '2023-12-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943cc0139', null, null, '2023', '50', '2023-12-04', '2023-12-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943e0013a', null, null, '2023', '51', '2023-12-11', '2023-12-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c943f1013b', null, null, '2023', '52', '2023-12-18', '2023-12-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94403013c', null, null, '2023', '53', '2023-12-25', '2023-12-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59c53e016f59c94418013d', null, null, '2024', '1', '2024-01-01', '2024-01-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021520036', null, null, '2024', '2', '2024-01-08', '2024-01-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021640037', null, null, '2024', '3', '2024-01-15', '2024-01-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021740038', null, null, '2024', '4', '2024-01-22', '2024-01-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021830039', null, null, '2024', '5', '2024-01-29', '2024-02-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d02192003a', null, null, '2024', '6', '2024-02-05', '2024-02-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021a1003b', null, null, '2024', '7', '2024-02-12', '2024-02-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021b1003c', null, null, '2024', '8', '2024-02-19', '2024-02-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021c0003d', null, null, '2024', '9', '2024-02-26', '2024-03-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021cf003e', null, null, '2024', '10', '2024-03-04', '2024-03-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021de003f', null, null, '2024', '11', '2024-03-11', '2024-03-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d021ef0040', null, null, '2024', '12', '2024-03-18', '2024-03-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022020041', null, null, '2024', '13', '2024-03-25', '2024-03-31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022120042', null, null, '2024', '14', '2024-04-01', '2024-04-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022220043', null, null, '2024', '15', '2024-04-08', '2024-04-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022330044', null, null, '2024', '16', '2024-04-15', '2024-04-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022440045', null, null, '2024', '17', '2024-04-22', '2024-04-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022540046', null, null, '2024', '18', '2024-04-29', '2024-05-05', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022640047', null, null, '2024', '19', '2024-05-06', '2024-05-12', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022740048', null, null, '2024', '20', '2024-05-13', '2024-05-19', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022850049', null, null, '2024', '21', '2024-05-20', '2024-05-26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d02295004a', null, null, '2024', '22', '2024-05-27', '2024-06-02', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022a6004b', null, null, '2024', '23', '2024-06-03', '2024-06-09', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022b8004c', null, null, '2024', '24', '2024-06-10', '2024-06-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022cb004d', null, null, '2024', '25', '2024-06-17', '2024-06-23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022da004e', null, null, '2024', '26', '2024-06-24', '2024-06-30', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022e9004f', null, null, '2024', '27', '2024-07-01', '2024-07-07', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d022f90050', null, null, '2024', '28', '2024-07-08', '2024-07-14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023090051', null, null, '2024', '29', '2024-07-15', '2024-07-21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023190052', null, null, '2024', '30', '2024-07-22', '2024-07-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0232b0053', null, null, '2024', '31', '2024-07-29', '2024-08-04', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0233c0054', null, null, '2024', '32', '2024-08-05', '2024-08-11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0234c0055', null, null, '2024', '33', '2024-08-12', '2024-08-18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023610056', null, null, '2024', '34', '2024-08-19', '2024-08-25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023740057', null, null, '2024', '35', '2024-08-26', '2024-09-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023870058', null, null, '2024', '36', '2024-09-02', '2024-09-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0239d0059', null, null, '2024', '37', '2024-09-09', '2024-09-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023b1005a', null, null, '2024', '38', '2024-09-16', '2024-09-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023c1005b', null, null, '2024', '39', '2024-09-23', '2024-09-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023d3005c', null, null, '2024', '40', '2024-09-30', '2024-10-06', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023e8005d', null, null, '2024', '41', '2024-10-07', '2024-10-13', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d023f9005e', null, null, '2024', '42', '2024-10-14', '2024-10-20', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0240b005f', null, null, '2024', '43', '2024-10-21', '2024-10-27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0241b0060', null, null, '2024', '44', '2024-10-28', '2024-11-03', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0242c0061', null, null, '2024', '45', '2024-11-04', '2024-11-10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0243c0062', null, null, '2024', '46', '2024-11-11', '2024-11-17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d0244d0063', null, null, '2024', '47', '2024-11-18', '2024-11-24', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d024610064', null, null, '2024', '48', '2024-11-25', '2024-12-01', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d024710065', null, null, '2024', '49', '2024-12-02', '2024-12-08', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d024850066', null, null, '2024', '50', '2024-12-09', '2024-12-15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d024980067', null, null, '2024', '51', '2024-12-16', '2024-12-22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d024ab0068', null, null, '2024', '52', '2024-12-23', '2024-12-29', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `calendar_index_copy` VALUES ('8a80800a6f59cec6016f59d024be0069', null, null, '2025', '1', '2024-12-30', '2025-01-05', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for dic_meetroom
-- ----------------------------
DROP TABLE IF EXISTS `dic_meetroom`;
CREATE TABLE `dic_meetroom` (
  `row_id` varchar(255) NOT NULL,
  `mt_name` varchar(255) DEFAULT NULL,
  `mt_number` varchar(255) DEFAULT NULL,
  `mt_org` varchar(255) DEFAULT NULL,
  `dic_function_id` varchar(255) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dic_meetroom
-- ----------------------------
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f88733feb0000', '4楼会议室A', '1401', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f88735fbd0001', '4楼会议室B', '1402', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f887375ec0002', '4楼会议室C', '1403', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f8873bf4f0003', '所街208室', '2208', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f8873d8230004', '所街306室', '2306', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f8873ecf60005', '所街401室', '2401', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f887401c60006', '所街410室', '2410', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f887418a50007', '所街205室', '2205', null, 'xzbg-meetroom', null, null, null, null, '开放', null);
INSERT INTO `dic_meetroom` VALUES ('8a80800a6f883307016f8875b6640016', '所街213室', '2213', null, 'xzbg-meetroom', null, null, null, null, '开放', null);

-- ----------------------------
-- Table structure for file_record
-- ----------------------------
DROP TABLE IF EXISTS `file_record`;
CREATE TABLE `file_record` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `arrangement_id` varchar(40) DEFAULT NULL COMMENT '关联表ID',
  `file_name` varchar(100) DEFAULT NULL COMMENT '附件名称',
  `file_type` varchar(100) DEFAULT NULL COMMENT '附件类型',
  `file_identify_name` varchar(100) DEFAULT NULL COMMENT '附件上传后保存名',
  `file_path` varchar(100) DEFAULT NULL COMMENT '附件路径',
  `upload_user_id` varchar(40) DEFAULT NULL COMMENT '上传人ID',
  `upload_user_name` varchar(40) DEFAULT NULL COMMENT '上传人姓名',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` varchar(40) DEFAULT NULL COMMENT '排序',
  `data_delete` varchar(40) DEFAULT NULL COMMENT '删除',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件记录表';

-- ----------------------------
-- Records of file_record
-- ----------------------------
INSERT INTO `file_record` VALUES ('8a80800a6f412f89016f4134b3be0000', '8a80800a6f412f89016f4134c0760001', '水表异常状态.docx', 'application/octet-stream', 'f4d3ad94-2562-4b2d-b986-e98bce09089c.docx', 'C:\\njdtjsis\\weeklyWork\\f4d3ad94-2562-4b2d-b986-e98bce09089c.docx', 'admin', 'admin', '2019-12-26 15:56:11', null, null, null);
INSERT INTO `file_record` VALUES ('8a80800a6f5ac3e9016f5adf7de20000', '8a80800a6f5ac3e9016f5adf8e270003', '水表异常状态.docx', 'application/octet-stream', '8b833acb-0947-49f7-8785-531ac67c20d4.docx', 'C:\\njdtjsis\\weeklyWork\\8b833acb-0947-49f7-8785-531ac67c20d4.docx', 'admin', 'admin', '2019-12-31 15:33:14', null, null, null);
INSERT INTO `file_record` VALUES ('8a80800a6f5b13bf016f5b1c22780000', '8a80800a6f5b13bf016f5b1c27db0002', '水表异常状态.docx', 'application/octet-stream', '6b1af836-6d73-4e5d-ac59-feaef385c956.docx', 'C:\\njdtjsis\\weeklyWork\\6b1af836-6d73-4e5d-ac59-feaef385c956.docx', 'admin', 'admin', '2019-12-31 16:39:28', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa717e0016fa7199d680000', '8a80808d6fa717e0016fa719a3820001', 'filec67fea5a-21ae-418f-957b-0ca8fe73c1b0.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\filec67fea5a-21ae-418f-957b-0ca8fe73c1b0.', null, null, '2020-01-15 10:47:51', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa72078016fa721a51f0000', '8a80808d6fa72078016fa721b15f0001', 'file76c689a8-f4c3-4d4e-9556-7c19b2577e2b.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file76c689a8-f4c3-4d4e-9556-7c19b2577e2b.', null, null, '2020-01-15 10:56:38', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa72078016fa7260e020002', '8a80808d6fa72078016fa72637970003', 'file66769b99-f05b-49f1-ad0b-478c1b10479c.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file66769b99-f05b-49f1-ad0b-478c1b10479c.', null, null, '2020-01-15 11:01:27', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa72078016fa72b9f870004', null, 'fileb92166e8-ef64-4acc-a667-7659a76d1792.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\fileb92166e8-ef64-4acc-a667-7659a76d1792.', null, null, '2020-01-15 11:07:32', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa7318a016fa731ffc90000', null, 'file4872a0d1-8172-48e7-b723-a4366b5b5933.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file4872a0d1-8172-48e7-b723-a4366b5b5933.', null, null, '2020-01-15 11:14:29', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa7f3a3016fa7fcc4420000', null, 'file3fbd8400-b468-4d0d-bd73-ec3104fd8761.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file3fbd8400-b468-4d0d-bd73-ec3104fd8761.', null, null, '2020-01-15 14:55:58', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa8019e016fa802e3540000', null, 'file646f9688-4048-4277-8359-9d87a11e4b10.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file646f9688-4048-4277-8359-9d87a11e4b10.', null, null, '2020-01-15 15:02:39', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa8179e016fa81840290000', null, 'file328c79c1-8c86-4ff3-a174-2580bd695fb9.', 'image/jpeg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file328c79c1-8c86-4ff3-a174-2580bd695fb9.', null, null, '2020-01-15 15:25:59', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa88462016facfe73cf0006', null, 'file93f30fc3-429d-4a56-b40a-d4e8b1b457ba.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file93f30fc3-429d-4a56-b40a-d4e8b1b457ba.jpg', null, null, '2020-01-16 14:15:55', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fa88462016fad04aecc0007', null, 'file993fe6b9-3a20-4809-84c9-d2f31d5171e3.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file993fe6b9-3a20-4809-84c9-d2f31d5171e3.jpg', null, null, '2020-01-16 14:22:43', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fad9a36016fad9bd2a30000', '8a80808d6fad9a36016fad9bda770001', 'file2025b99d-37ef-4a95-9d3a-6d65f744e59a.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file2025b99d-37ef-4a95-9d3a-6d65f744e59a.jpg', null, null, '2020-01-16 17:07:48', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fad9a36016fada06e5d0002', '8a80808d6fad9a36016fada0894b0003', 'filefe93b176-3ed7-496d-b43e-85a5245e9dc0.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\filefe93b176-3ed7-496d-b43e-85a5245e9dc0.jpg', null, null, '2020-01-16 17:12:50', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fb29ccb016fb2ae47100000', null, 'file2d17eb62-03fa-4e79-80c5-ace46ac95a64.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file2d17eb62-03fa-4e79-80c5-ace46ac95a64.jpg', null, null, '2020-01-17 16:46:04', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fb2b710016fb2bfede80000', '8a80808d6fb2b710016fb2bff4fd0001', 'fileb817ccf5-50f0-4d6b-a17d-fc0cded8f57b.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\fileb817ccf5-50f0-4d6b-a17d-fc0cded8f57b.jpg', null, null, '2020-01-17 17:05:20', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fb2b710016fb2c96ca00003', '8a80808d6fb2b710016fb2cb27ff0005', 'fileb0fb836f-95d3-4098-bece-d94fa8433214.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\fileb0fb836f-95d3-4098-bece-d94fa8433214.jpg', null, null, '2020-01-17 17:15:43', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fb2b710016fb2cb1d300004', null, 'file5ef54332-03e0-4763-becd-b4c86f553a78.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file5ef54332-03e0-4763-becd-b4c86f553a78.jpg', null, null, '2020-01-17 17:17:33', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fb2b710016fb2cd62eb0006', '8a80808d6fb2b710016fb2cdd32f0007', 'file7b7788c9-2789-4f1a-9919-84d89cd85c10.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file7b7788c9-2789-4f1a-9919-84d89cd85c10.jpg', null, null, '2020-01-17 17:20:02', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fb2b710016fb2d0b2d40008', null, 'fileb8bc4a43-31d3-45e3-9428-866f2dde87d7.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\fileb8bc4a43-31d3-45e3-9428-866f2dde87d7.jpg', null, null, '2020-01-17 17:23:39', null, null, null);
INSERT INTO `file_record` VALUES ('8a80808d6fb2d403016fbb9cc6750000', null, 'filec060ac4f-91c4-4750-ae81-de1a0d33705e.jpg', 'image/jpg', null, 'C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\filec060ac4f-91c4-4750-ae81-de1a0d33705e.jpg', null, null, '2020-01-19 10:23:31', null, null, null);

-- ----------------------------
-- Table structure for gx_oa_mobile_role
-- ----------------------------
DROP TABLE IF EXISTS `gx_oa_mobile_role`;
CREATE TABLE `gx_oa_mobile_role` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `role_name` varchar(80) DEFAULT NULL COMMENT '角色名称',
  `role_id` varchar(80) DEFAULT NULL COMMENT '角色ID',
  `role_intro` varchar(40) DEFAULT NULL COMMENT '角色说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(40) DEFAULT NULL COMMENT '修改人ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` bigint(11) DEFAULT NULL COMMENT '排序',
  `parent_role_id` varchar(40) DEFAULT NULL COMMENT '父角色ID',
  `parent_role_name` varchar(80) DEFAULT NULL COMMENT '父角色名称',
  `role_type` varchar(40) DEFAULT NULL COMMENT '角色类别',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of gx_oa_mobile_role
-- ----------------------------

-- ----------------------------
-- Table structure for gx_sys_dic_index
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_dic_index`;
CREATE TABLE `gx_sys_dic_index` (
  `ROW_ID` varchar(40) NOT NULL DEFAULT '',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATE_USER_ID` varchar(40) DEFAULT NULL COMMENT '创建用户id',
  `DIC_FUNCTION_NAME` varchar(80) DEFAULT NULL COMMENT '索引名称',
  `DIC_FUNCTION_ID` varchar(40) DEFAULT NULL COMMENT '索引功能ID',
  `DIC_FUNCTION_DEC` varchar(220) DEFAULT NULL COMMENT '索引显示内容',
  `DIC_FUNCTION_TYPE` varchar(10) DEFAULT NULL COMMENT '索引类型',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '字典状态',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '最后更新时间',
  `ORDER_NUM` bigint(22) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ROW_ID`),
  UNIQUE KEY `PK_SYS_DIC_INDEX` (`ROW_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gx_sys_dic_index
-- ----------------------------

-- ----------------------------
-- Table structure for gx_sys_dic_record
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_dic_record`;
CREATE TABLE `gx_sys_dic_record` (
  `ROW_ID` varchar(40) NOT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_USER_ID` varchar(40) DEFAULT NULL,
  `DIC_NAME` varchar(40) DEFAULT NULL,
  `DIC_ID` varchar(40) DEFAULT NULL,
  `DIC_SHOW_VAL` varchar(100) DEFAULT NULL,
  `DIC_VALUE` varchar(100) DEFAULT NULL,
  `DIC_TYPE` varchar(100) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `ORDER_NUM` bigint(22) DEFAULT NULL,
  `DIC_FUNCTION` varchar(10) DEFAULT NULL,
  `TABLE_ID` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(40) DEFAULT NULL,
  `PARENT_NAME` varchar(40) DEFAULT NULL,
  `FLAG_ZM` varchar(40) DEFAULT NULL,
  `FLAG_RQ` varchar(40) DEFAULT NULL,
  `FLAG_NUM` varchar(40) DEFAULT NULL,
  `FLAG_WRITE` varchar(40) DEFAULT NULL,
  `max_status` varchar(40) DEFAULT NULL COMMENT '是否启用最大值配置（1启用，0否）',
  `max_id` varchar(40) DEFAULT NULL COMMENT '最大值的ID',
  PRIMARY KEY (`ROW_ID`),
  UNIQUE KEY `PK_SYS_DIC_RECORD` (`ROW_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gx_sys_dic_record
-- ----------------------------
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5c6f3020001', '2019-05-11 15:24:00', null, '南京环网电力设备有限公司', 'zl-sb-1', '南京环网电力设备有限公司', '1', 'zl-sb', '1', null, '1', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5c7622f0002', '2019-05-11 15:24:29', null, '南京德亮建筑工程有限公司', 'zl-sb-2', '南京德亮建筑工程有限公司', '1', 'zl-sb', '1', null, '2', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5c7c7e30003', '2019-05-11 15:24:55', null, '南京旭通起重有限公司', 'zl-sb-3', '南京旭通起重有限公司', '1', 'zl-sb', '1', null, '3', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5c820b70004', '2019-05-11 15:25:17', null, '南京市雨花台区吴朋机械租赁服务部', 'zl-sb-4', '南京市雨花台区吴朋机械租赁服务部', '1', 'zl-sb', '1', null, '4', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5c8f56b0005', '2019-05-11 15:26:12', null, '南京市秦淮区明友工程机械经营部', 'zl-sb-5', '南京市秦淮区明友工程机械经营部', '1', 'zl-sb', '1', null, '5', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5c9552d0006', '2019-05-11 15:26:36', null, '南京世宏土石方工程有限公司', 'zl-sb-6', '南京世宏土石方工程有限公司', '1', 'zl-sb', '1', null, '6', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5c9d47d0007', '2019-05-11 15:27:09', null, '南京隆霆工程机械有限公司', 'zl-sb-7', '南京隆霆工程机械有限公司', '1', 'zl-sb', '1', null, '7', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5ca3f7c0008', '2019-05-11 15:27:36', null, '南京诺金基础工程有限公司', 'zl-sb-8', '南京诺金基础工程有限公司', '1', 'zl-sb', '1', null, '8', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5ca9b330009', '2019-05-11 15:28:00', null, '南京铭裕建筑工程有限公司', 'zl-sb-9', '南京铭裕建筑工程有限公司', '1', 'zl-sb', '1', null, '9', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5c2cd016aa5cafb8b000a', '2019-05-11 15:28:24', null, '南京玄武胜特威机械租赁服务部', 'zl-sb-10', '南京玄武胜特威机械租赁服务部', '1', 'zl-sb', '1', null, '10', null, '8a80805d6aa5c2cd016aa5c3a9f70000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5ce92016aa5de5aa10001', '2019-05-11 15:49:34', null, '江苏洪大建筑工程有限公司', 'xzDw-sb-1', '江苏洪大建筑工程有限公司', '1', 'xzDw-sb', '1', null, '1', null, '8a80805d6aa5ce92016aa5ddbf950000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5ce92016aa5deae190002', '2019-05-11 15:49:55', null, '江苏金地建设工程有限公司', 'xzDw-sb-2', '江苏金地建设工程有限公司', '1', 'xzDw-sb', '1', null, '2', null, '8a80805d6aa5ce92016aa5ddbf950000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5ce92016aa5df2dcd0003', '2019-05-11 15:50:28', null, '江苏洪大建筑工程有限公司', 'xsDw-sb-3', '江苏洪大建筑工程有限公司', '1', 'xzDw-sb', '1', null, '3', null, '8a80805d6aa5ce92016aa5ddbf950000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a80805d6aa5ce92016aa5df6e640004', '2019-05-11 15:50:45', null, '江苏涟盛建筑劳务有限公司', 'xsDw-sb-4', '江苏涟盛建筑劳务有限公司', '1', 'xzDw-sb', '1', null, '4', null, '8a80805d6aa5ce92016aa5ddbf950000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a8080e24f29d308014f29da7cdc0001', '2015-08-14 09:37:09', null, '知识栏目1', '1', '知识栏目1', '1', '2', '1', null, '1', null, '8a8080e24f29d308014f29d462cf0000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a8080e24f29d308014f29dac68e0002', '2015-08-14 09:37:28', null, '知识栏目2', '2', '知识栏目2', '2', '2', '1', null, '2', null, '8a8080e24f29d308014f29d462cf0000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a8080e24f29d308014f29db94970003', '2015-08-14 09:38:20', null, '知识栏目3', '3', '知识栏目3', '3', '2', '1', null, '3', null, '8a8080e24f29d308014f29d462cf0000', null, null, null, null, null, null, '0', null);
INSERT INTO `gx_sys_dic_record` VALUES ('8a8080e24f29fb5b014f29fcec0d0000', '2015-08-14 10:14:46', null, '默认分栏', '0', '默认分栏', '0', '2', '1', '2015-08-14 10:18:52', '0', null, '8a8080e24f29d308014f29d462cf0000', null, null, null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for gx_sys_function
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_function`;
CREATE TABLE `gx_sys_function` (
  `row_id` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `function_name` varchar(80) NOT NULL COMMENT '菜单名称',
  `function_show_name` varchar(180) DEFAULT NULL COMMENT '菜单显示名称',
  `function_en_name` varchar(580) DEFAULT NULL COMMENT '菜单英文名称',
  `function_intro` varchar(40) DEFAULT NULL COMMENT '菜单说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(40) DEFAULT NULL COMMENT '修改人ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` bigint(11) DEFAULT NULL COMMENT '排序',
  `parent_function_id` varchar(40) DEFAULT NULL COMMENT '父菜单ID',
  `parent_function_name` varchar(80) DEFAULT NULL COMMENT '父菜单名称',
  `function_type` varchar(40) DEFAULT NULL COMMENT '菜单类别',
  `is_main_page` varchar(40) DEFAULT NULL COMMENT '是否为为主页图标',
  `function_icon` varchar(80) DEFAULT NULL COMMENT '菜单图标',
  `main_page_icon` varchar(40) DEFAULT NULL COMMENT '主页图标',
  `main_function_name` varchar(80) DEFAULT NULL COMMENT '主页显示名称',
  `main_order` int(11) DEFAULT NULL COMMENT '主页排序位',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4009 DEFAULT CHARSET=utf8 COMMENT='系统权限菜单表';

-- ----------------------------
-- Records of gx_sys_function
-- ----------------------------
INSERT INTO `gx_sys_function` VALUES ('1006', '系统管理', null, null, null, null, null, null, null, '1', '12', 'root', null, '1', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('2010', '机构人员管理', null, null, null, null, null, null, null, '1', '1', '1006', null, '2', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('2011', '角色权限管理', '', '', null, null, null, null, null, '1', '2', '1006', null, '2', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('2014', '数据字典管理', null, null, null, null, null, null, null, '1', '5', '1006', null, '2', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('2021', '菜单管理', null, '', null, null, null, null, null, '1', '8', '1006', null, '2', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('3019', '角色管理', null, 'role/role-list.do', null, null, null, null, null, '1', '1', '2011', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('3032', '数据字典管理', null, 'dic/dic-index-list.do', null, null, null, null, null, '1', '1', '2014', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('3044', '组织管理', null, 'sysorg/org-list.do', null, null, null, null, null, '1', '2', '2010', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('3045', '人员管理', null, 'sysuser/user-manager-page.do', null, null, null, null, null, '1', '3', '2010', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('3046', '角色人员组织管理', null, 'roleuserorg/role-list.do', null, null, null, null, null, '1', '1', '2010', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('3074', '手机端角色管理', '', 'role/mobile-role-list.do', '', '2016-04-01 15:24:06', '', '2016-04-01 15:24:20', '', '1', '2', '2011', '', '3', '', '', '', '', null);
INSERT INTO `gx_sys_function` VALUES ('3086', '菜单管理', null, 'menu/sysmenu-list.do', null, null, null, null, null, '1', '1', '2021', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4001', '一周工作安排', null, null, null, null, null, null, null, '1', '1', 'root', null, '1', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4002', '一周工作安排', null, null, null, null, null, null, null, '1', '1', '4001', null, '2', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4003', '一周工作安排管理', null, 'weeklyWork/list-new.do', null, null, null, null, null, null, '1', '4002', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4004', '一周工作安排查看', null, 'weeklyWork/list.do', null, null, null, null, null, null, '2', '4002', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4005', '会议室', null, null, null, null, null, null, null, '1', '2', '4001', null, '2', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4006', '会议室管理', null, 'meetingRoom/list.do', null, null, null, null, null, '1', '1', '4005', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4007', '一周工作安排查看列表', null, 'weeklyView/list.do', null, null, null, null, null, null, '3', '4002', null, '3', null, null, null, null, null);
INSERT INTO `gx_sys_function` VALUES ('4008', '一周工作安排添加', null, 'weeklyView/list-old.do', null, null, null, null, null, null, '4', '4002', null, '3', null, null, null, null, null);

-- ----------------------------
-- Table structure for gx_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_org`;
CREATE TABLE `gx_sys_org` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `org_name` varchar(80) DEFAULT NULL COMMENT '组织名称',
  `org_show_name` varchar(180) DEFAULT NULL COMMENT '组织显示名称',
  `org_en_name` varchar(80) DEFAULT NULL COMMENT '菜单英文名称',
  `org_intro` varchar(40) DEFAULT NULL COMMENT '组织说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(40) DEFAULT NULL COMMENT '修改人ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` bigint(11) DEFAULT NULL COMMENT '排序',
  `parent_org_id` varchar(40) DEFAULT NULL COMMENT '父组织ID',
  `parent_org_name` varchar(80) DEFAULT NULL COMMENT '父组织名称',
  `org_type` varchar(40) DEFAULT NULL COMMENT '组织类别',
  `is_main_page` varchar(40) DEFAULT NULL COMMENT '是否为虚拟组织',
  `org_bd_id` varchar(40) DEFAULT NULL,
  `org_bd_name` varchar(240) DEFAULT NULL,
  `org_com_id` varchar(40) DEFAULT NULL COMMENT '组织所属单位ID',
  `is_show` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统组织单位';

-- ----------------------------
-- Records of gx_sys_org
-- ----------------------------
INSERT INTO `gx_sys_org` VALUES ('01', '南京地铁建设', null, null, null, null, null, '2019-05-22 16:51:17', null, '1', '1', '', '', '0', null, null, null, '01', '0');
INSERT INTO `gx_sys_org` VALUES ('010101', '办公室', '', '', '', '2019-04-23 15:20:46', '', '2019-05-06 16:30:56', '', '1', '1', '01', '中铁三局', '2', '', null, '南京地铁1号线北延工程土建施工D1N-Td01标', '01', '0');
INSERT INTO `gx_sys_org` VALUES ('010102', '计材处', null, null, null, '2019-06-24 14:01:09', null, null, null, '1', '2', '01', '业主', '2', null, '010201', null, null, '0');
INSERT INTO `gx_sys_org` VALUES ('010103', '合约处', '', '', '', '2019-04-23 15:20:46', '', '2019-05-06 16:30:56', '', '1', '3', '01', '', '2', '', '010802', '南京地铁1号线北延工程土建施工D1N-TA01标', null, '0');
INSERT INTO `gx_sys_org` VALUES ('010104', '用地处', null, null, null, null, null, null, null, null, '4', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010105', '总工办', '', '', '', '2019-04-23 15:20:46', '', '2019-05-06 16:30:56', '', '1', '5', '01', '', '2', '', '010301', '南京地铁1号线北延工程土建施工D1N-TA01标', '01', '0');
INSERT INTO `gx_sys_org` VALUES ('010106', '质安处', '', '', '', '2019-04-23 15:20:46', '', '2019-05-06 16:30:56', '', '1', '6', '01', '', '2', '', '010401', '南京地铁1号线北延工程土建施工D1N-TA01标', null, '0');
INSERT INTO `gx_sys_org` VALUES ('010107', '车站处', null, null, null, null, null, null, null, null, '7', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010108', '车辆处', '', '', '', '2019-04-23 15:20:46', '', '2019-05-06 16:30:56', '', '1', '8', '01', '', '2', '', '010501', '南京地铁1号线北延工程土建施工D1N-TA01标', null, '0');
INSERT INTO `gx_sys_org` VALUES ('010109', '通号处', null, null, null, null, null, null, null, null, '9', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010110', '财务处', null, null, null, null, null, null, null, null, '10', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010111', '1号线', null, null, null, null, null, null, null, null, '11', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010112', '2号线', null, null, null, null, null, null, null, null, '12', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010113', '5号线', null, null, null, null, null, null, null, null, '13', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010114', '6号线', null, null, null, null, null, null, null, null, '14', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010115', '7号线', null, null, null, null, null, null, null, null, '15', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010116', '宁句线', null, null, null, null, null, null, null, null, '16', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010117', '4号线', null, null, null, null, null, null, null, null, '17', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010118', '10号线', null, null, null, null, null, null, null, null, '19', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010119', '领导班子', null, null, null, null, null, null, null, null, '22', '01', null, null, null, null, null, null, null);
INSERT INTO `gx_sys_org` VALUES ('010120', '监察室', null, null, null, null, null, null, null, null, '20', '01', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for gx_sys_org_role_has_user
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_org_role_has_user`;
CREATE TABLE `gx_sys_org_role_has_user` (
  `row_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `data_status` varchar(255) DEFAULT NULL,
  `data_order` bigint(20) DEFAULT NULL,
  `rl_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gx_sys_org_role_has_user
-- ----------------------------
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa2158c190000', 'pei_sx', 'pei_sx', '2020-01-14 11:25:19', null, null, null, '0');
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa21f185b0013', 'wang_cn', 'wang_cn', '2020-01-14 11:35:44', null, null, null, '0');
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa21f4b430014', 'wang_t', 'wang_t', '2020-01-14 11:35:57', null, null, null, '0');
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa21f86ab0015', 'chen_zl', 'chen_zn', '2020-01-14 11:36:13', null, null, null, '0');
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa21fb57d0016', 'li_h', 'li_h', '2020-01-14 11:36:25', null, null, null, '0');
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa22038a40017', 'yu_l', 'yu_l', '2020-01-14 11:36:58', null, null, null, '0');
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa221002a0019', 'li_q', 'li_q', '2020-01-14 11:37:49', null, null, null, '0');
INSERT INTO `gx_sys_org_role_has_user` VALUES ('2c948a826fa21531016fa2212672001a', 'jin_m', 'jin_m', '2020-01-14 11:37:59', null, null, null, '0');

-- ----------------------------
-- Table structure for gx_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_role`;
CREATE TABLE `gx_sys_role` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `role_name` varchar(80) DEFAULT NULL COMMENT '角色名称',
  `role_id` varchar(80) DEFAULT NULL COMMENT '角色ID',
  `role_intro` varchar(40) DEFAULT NULL COMMENT '角色说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(40) DEFAULT NULL COMMENT '修改人ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` bigint(11) DEFAULT NULL COMMENT '排序',
  `parent_role_id` varchar(40) DEFAULT NULL COMMENT '父角色ID',
  `parent_role_name` varchar(80) DEFAULT NULL COMMENT '父角色名称',
  `role_type` varchar(40) DEFAULT NULL COMMENT '角色类别',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of gx_sys_role
-- ----------------------------
INSERT INTO `gx_sys_role` VALUES ('8a8080e24f449cb0014f44a00f520000', '基本角色权限', 'basic-role', '基本角色权限', '2015-08-19 14:23:05', null, '2015-08-19 15:17:08', null, null, '1', 'root', 'root', '0');
INSERT INTO `gx_sys_role` VALUES ('8a8080e24f449cb0014f44b3efb2001b', '系统管理角色权限', 'sys-manager-role', '', '2015-08-19 14:44:47', null, '2019-04-23 13:56:30', null, null, '2', 'root', 'root', '1');

-- ----------------------------
-- Table structure for gx_sys_role_has_function
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_role_has_function`;
CREATE TABLE `gx_sys_role_has_function` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `function_id` bigint(80) NOT NULL COMMENT '菜单ID',
  `role_id` varchar(80) NOT NULL COMMENT '角色ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` bigint(11) DEFAULT NULL COMMENT '排序',
  `rl_type` varchar(40) DEFAULT NULL COMMENT '关系类别',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色与权限关系表（注意关系表不存在更新操作）';

-- ----------------------------
-- Records of gx_sys_role_has_function
-- ----------------------------
INSERT INTO `gx_sys_role_has_function` VALUES ('297eb8df6fa717a4016fa719ca7a0000', '4008', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('4', '3019', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('40289fd36fa1bb41016fa1c28ada0000', '3046', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80800a6f3c1aab016f3c383f340000', '4001', 'basic-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80800a6f3c1aab016f3c383f700001', '4002', 'basic-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80800a6fa7d50f016fa7f69cbe0016', '4007', 'basic-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca581d000d', '3044', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca582d000e', '3045', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca586c0014', '3032', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca586c0015', '2021', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca587c0016', '3086', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca587c0017', '4001', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca588b0018', '4002', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca58aa001b', '4005', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a80808d6f642238016f64ca58aa001c', '4006', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a8080e24f449cb0014f44b41dd8001c', '1006', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a8080e24f449cb0014f44b41dec001d', '2010', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a8080e24f449cb0014f44b41e100020', '2011', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a8080e24f449cb0014f44b41e590026', '2014', 'sys-manager-role', null, null, null, null, null);
INSERT INTO `gx_sys_role_has_function` VALUES ('8a8080e66f9d6356016f9d677a470000', '4007', 'sys-manager-role', null, null, null, null, null);

-- ----------------------------
-- Table structure for gx_sys_role_has_user
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_role_has_user`;
CREATE TABLE `gx_sys_role_has_user` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `user_id` varchar(80) NOT NULL COMMENT '用户ID',
  `role_id` varchar(80) NOT NULL COMMENT '角色ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` bigint(11) DEFAULT NULL COMMENT '排序',
  `rl_type` varchar(40) DEFAULT NULL COMMENT '关系类别',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统人员与角色关系表（注意关系表不存在更新操作）';

-- ----------------------------
-- Records of gx_sys_role_has_user
-- ----------------------------
INSERT INTO `gx_sys_role_has_user` VALUES ('1123123', 'admin', 'sys-manager-role', null, null, null, null, '1');
INSERT INTO `gx_sys_role_has_user` VALUES ('123', 'yang_fl', 'basic-role', null, null, null, null, '1');
INSERT INTO `gx_sys_role_has_user` VALUES ('123123', 'luo_xd', 'basic-role', null, null, null, null, '1');
INSERT INTO `gx_sys_role_has_user` VALUES ('23', 'li_y', 'basic-role', null, null, null, null, '1');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7e2fc7d0000', 'ji_j', 'sys-manager-role', '2020-01-15 14:27:48', null, null, null, '1');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f64857000b', 'chen_zl', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f64881000c', 'wang_cn', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f648a5000d', 'wang_t', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f648c4000e', 'pei_sx', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f648ec000f', 'li_h', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f649180010', 'yu_l', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f6493f0011', 'li_q', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f6496d0012', 'jin_m', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f6499c0013', 'ji_j', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f649c90014', 'wang_wj', 'basic-role', '2020-01-15 14:48:53', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80800a6fa7d50f016fa7f660b60015', 'admin', 'basic-role', '2020-01-15 14:48:59', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468b9e60003', 'song_z1', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba050004', 'liao_h', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba150005', 'zhang_xh', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba150006', 'cheng_l', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba250007', 'guo_yx', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba340008', 'zhou_ll', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba340009', 'lv_yg', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba44000a', 'liang_mt', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba44000b', 'hu_yr', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');
INSERT INTO `gx_sys_role_has_user` VALUES ('8a80808d6f642238016f6468ba53000c', 'liang_xy', 'basic-role', '2020-01-02 11:59:43', null, null, null, '0');

-- ----------------------------
-- Table structure for gx_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_user`;
CREATE TABLE `gx_sys_user` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `user_name` varchar(80) DEFAULT NULL COMMENT '用户名称',
  `user_show_name` varchar(180) DEFAULT NULL COMMENT '用户别名',
  `user_en_name` varchar(80) DEFAULT NULL COMMENT '用户英文名称',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户帐号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(40) DEFAULT NULL COMMENT '修改人ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` int(11) DEFAULT NULL COMMENT '排序',
  `user_mobile_num` varchar(40) DEFAULT NULL COMMENT '手机号',
  `user_sex` varchar(80) DEFAULT NULL COMMENT '性别',
  `user_type` varchar(40) DEFAULT NULL COMMENT '用户类型',
  `user_photo` varchar(80) DEFAULT NULL COMMENT '用户头像',
  `user_mail` varchar(80) DEFAULT NULL COMMENT '邮件',
  `user_level` varchar(80) DEFAULT NULL COMMENT '学历',
  `power_level` int(11) DEFAULT NULL COMMENT '用户鉴权级别',
  `user_card_id` varchar(80) DEFAULT NULL COMMENT '身份证',
  `sys_color_id` varchar(80) DEFAULT NULL COMMENT '系统皮肤',
  `client_id` varchar(80) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `nickName` varchar(40) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `openid` varchar(80) DEFAULT NULL,
  `avatarUrl` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `gxsysuseri1` (`row_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of gx_sys_user
-- ----------------------------
INSERT INTO `gx_sys_user` VALUES ('1', '陈志宁', '123', '123', 'chen_zl', null, null, null, null, null, '1', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('2', '王长宁', '123', '123', 'wang_cn', null, null, null, null, null, '2', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('3', '王霆', '123', '123', 'wang_t', null, null, null, null, null, '3', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('4', '裴顺鑫', '123', '123', 'pei_sx', null, null, null, null, null, '4', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('5', '李慧', '123', '123', 'li_h', null, null, null, null, null, '5', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('6', '郁犁', '123', '123', 'yu_l', null, null, null, null, null, '6', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('7', '黎庆', '123', '123', 'li_q', null, null, null, null, null, '7', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('8', '金明', '123', '123', 'jin_m', null, null, null, null, null, '8', null, null, null, null, null, '100', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `gx_sys_user` VALUES ('8a80808d6fb25ea1016fb2931add0000', '管理员', null, null, 'admin1', '2020-01-17 16:16:23', null, null, null, null, null, null, '男', null, null, null, null, null, null, null, null, 'China', 'Nanjing', 'zh_CN', 'J', 'Jiangsu', 'oqCt55H3p8W04nyK2Z_jkFYfm-uk', 'https://wx.qlogo.cn/mmopen/vi_32/luGOSzjhPgmIudYTXRJz7NmeSkKQBCBwohqIiayEJsd0Pib2s27p3VRqZsMu76byRl4HOClvDwZknWxpjXozKsAg/132', null);
INSERT INTO `gx_sys_user` VALUES ('8a80808d6fb2b710016fb2c84ca40002', '管理员2', null, null, 'admin2', '2020-01-17 17:14:29', null, null, null, null, null, null, '女', null, null, null, null, null, null, null, null, 'China', 'Nanjing', 'zh_CN', '雨晨', 'Jiangsu', 'oqCt55LCMbbAun35qQUpMkfJLw04', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJBw3QsIfF3XLeJF38R9KBTkpjU2VSYrMJWVDTicibIic6iby6bZDz7m7uS7Y4PP10B4rlczzFxq5JU7A/132', null);
INSERT INTO `gx_sys_user` VALUES ('902809816ad824a3016ad8267ce10004', 'admin', '11bb', '1232123', 'admin', '2019-05-21 10:09:22', null, '2019-04-23 17:16:42', null, null, '9', '1', '1', '', null, null, '1', null, '1', null, '3f2e1978d4bca2c7084f3930cfb0d1f4', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for gx_sys_user_in_org
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_user_in_org`;
CREATE TABLE `gx_sys_user_in_org` (
  `row_id` varchar(40) NOT NULL COMMENT '主键',
  `user_id` varchar(80) NOT NULL COMMENT '用户ID',
  `org_id` varchar(80) NOT NULL COMMENT '组织ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建者ID',
  `data_status` varchar(40) DEFAULT NULL COMMENT '状态',
  `data_order` int(11) DEFAULT NULL COMMENT '排序',
  `rl_type` varchar(40) DEFAULT NULL COMMENT '关系类别',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统组织与人员关系表（注意关系表不存在更新操作）';

-- ----------------------------
-- Records of gx_sys_user_in_org
-- ----------------------------
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497b2c1e0001', 'song_wf', '01050101', '2019-04-23 17:16:10', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497c261a0003', 'zhou_t', '01050101', '2019-04-23 17:17:14', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497ccf5b0007', 'yang_fl', '01050106', '2019-04-23 17:17:57', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497d1b1d0009', 'luo_xd', '01050101', '2019-04-23 17:18:17', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497d65ae000b', 'li_y', '01050106', '2019-04-23 17:18:36', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497de528000d', 'song_z1', '01050104', '2019-04-23 17:19:08', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497e263f000f', 'liao_h', '01050102', '2019-04-23 17:19:25', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497e62ac0011', 'zhang_xh', '01050105', '2019-04-23 17:19:41', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497eb3a40013', 'cheng_l', '01050102', '2019-04-23 17:20:01', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497f01e10015', 'guo_yx', '01050103', '2019-04-23 17:20:21', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497f47f00017', 'zhou_ll', '01050101', '2019-04-23 17:20:39', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a497f9d4c0019', 'lv_yg', '01050107', '2019-04-23 17:21:01', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a498004dc001b', 'liang_mt', '01050101', '2019-04-23 17:21:28', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a49805850001d', 'hu_yr', '01050101', '2019-04-23 17:21:49', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a4980b5f7001f', 'liang_xy', '01050106', '2019-04-23 17:22:13', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a4980fd2e0021', 'he_m1', '01050105', '2019-04-23 17:22:31', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a498156a40023', 'zheng_ds', '01050106', '2019-04-23 17:22:54', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('297e60466a4962b8016a4981ff080025', 'li_z', '01050106', '2019-04-23 17:23:37', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('402809816bb0b9a3016bb0e739990002', 'si_sy', '01030111', '2019-07-02 12:17:52', 'admin', null, '64', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6a8c9cc5016a8cd35b7a0001', 'xiang_aj', '01030111', '2019-05-06 19:07:03', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ab92147016ab92d7ce40001', 'gong_hx', '010101', '2019-05-15 09:48:47', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ab92147016ab92ed7540003', 'gao_z', '010101', '2019-05-15 09:50:15', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ab92147016ab9307eaa000d', 'liu_y', '010101', '2019-05-15 09:52:04', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba8b8adb002b', 'fu_yz', '01040107', '2019-05-15 16:11:08', 'zhu_cz', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba8be2ef002f', 'dong_ll', '01040107', '2019-05-15 16:11:31', 'zhu_cz', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba8ccecd0037', 'xie_yz', '01040107', '2019-05-15 16:12:31', 'zhu_cz', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba8eebc60039', 'liang_lx', '01040107', '2019-05-15 16:14:50', 'zhu_cz', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba91e80b003b', 'he_jr', '01040107', '2019-05-15 16:18:05', 'zhu_cz', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba924503003d', 'yang_lp', '01040107', '2019-05-15 16:18:29', 'zhu_cz', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba92b58e003f', 'liu_my', '01040103', '2019-05-15 16:18:58', 'zhu_cz', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba935bf20041', 'wang_y1', '01040103', '2019-05-15 16:19:40', 'zhu_cz', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba93c3310044', 'liu_dx', '01040108', '2019-05-15 16:20:07', 'zhu_cz', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba94283d0047', 'ye_xj', '01040108', '2019-05-15 16:20:33', 'zhu_cz', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba950de5004b', 'li_j', '01040106', '2019-05-15 16:21:32', 'zhu_cz', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba956432004d', 'luo_yy', '01040106', '2019-05-15 16:21:54', 'zhu_cz', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba96b6930055', 'jin_z', '01040106', '2019-05-15 16:23:20', 'zhu_cz', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba98ba740057', 'wang_l', '01040106', '2019-05-15 16:25:32', 'zhu_cz', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba991b9c0059', 'tao_gm', '01040106', '2019-05-15 16:25:57', 'zhu_cz', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba99a396005b', 'han_y1', '01040104', '2019-05-15 16:26:32', 'zhu_cz', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba99f4f8005d', 'shi_zf', '01040104', '2019-05-15 16:26:53', 'zhu_cz', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba4d1a016aba9a681e005f', 'guo_p', '01040104', '2019-05-15 16:27:22', 'zhu_cz', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016aba9dfcb30001', 'wang_ay', '01040102', '2019-05-15 16:31:17', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016aba9e81c10003', 'jin_yl', '01040102', '2019-05-15 16:31:51', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016aba9ed13e0005', 'yu_jl', '01040102', '2019-05-15 16:32:11', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016aba9f49240007', 'zhu_b', '01040102', '2019-05-15 16:32:42', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016aba9fde1f0009', 'zhu_yq', '01040102', '2019-05-15 16:33:20', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa063ee000b', 'he_j', '01040102', '2019-05-15 16:33:55', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa0c91c000d', 'chen_hh', '01040105', '2019-05-15 16:34:20', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa131b8000f', 'deng_rw', '01040105', '2019-05-15 16:34:47', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa3b8e90011', 'tao_sj', '01040111', '2019-05-15 16:37:33', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa419bb0013', 'li_zg1', '01040111', '2019-05-15 16:37:58', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa46f190015', 'wu_hc', '01040111', '2019-05-15 16:38:20', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa553320017', 'luo_zb', '01040111', '2019-05-15 16:39:18', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa5b1fa0019', 'zhao_q', '01040111', '2019-05-15 16:39:42', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa61c0e001b', 'chen_gq', '01040111', '2019-05-15 16:40:09', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa6cfb7001d', 'jin_n', '01040103', '2019-05-15 16:40:55', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa72de5001f', 'liu_yy', '01040108', '2019-05-15 16:41:19', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaa96c290021', 'li_zl', '01040111', '2019-05-15 16:43:46', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaaa04800023', 'li_t', '01040111', '2019-05-15 16:44:25', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaaa5b270025', 'li_xz', '01040111', '2019-05-15 16:44:48', 'admin', null, '9', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaaabc970027', 'fu_z', '01040111', '2019-05-15 16:45:13', 'admin', null, '10', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaab0e990029', 'su_xy', '01040111', '2019-05-15 16:45:34', 'admin', null, '11', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaab694b002b', 'ma_gy', '01040111', '2019-05-15 16:45:57', 'admin', null, '12', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaacf4ae0031', 'liu_qx', '01040111', '2019-05-15 16:47:38', 'admin', null, '15', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaad588e0033', 'li_zg', '01040111', '2019-05-15 16:48:03', 'admin', null, '16', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaada2be0035', 'wang_ly', '01040111', '2019-05-15 16:48:22', 'admin', null, '17', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaadf9760037', 'li_g', '01040111', '2019-05-15 16:48:45', 'admin', null, '18', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaaeee820039', 'pang_km', '01040111', '2019-05-15 16:49:48', 'admin', null, '19', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaaf491d003b', 'li_gq', '01040111', '2019-05-15 16:50:11', 'admin', null, '20', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abaaf91a1003d', 'li_yy', '01040111', '2019-05-15 16:50:29', 'admin', null, '21', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab02b01003f', 'chen_sn', '01040111', '2019-05-15 16:51:08', 'admin', null, '22', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab0ab2b0041', 'chen_y1', '01040111', '2019-05-15 16:51:41', 'admin', null, '23', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab10d0c0043', 'chen_sc', '01040111', '2019-05-15 16:52:06', 'admin', null, '24', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab157200045', 'xu_hm', '01040111', '2019-05-15 16:52:25', 'admin', null, '25', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab1ade20047', 'chen_sw', '01040111', '2019-05-15 16:52:48', 'admin', null, '26', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab1ff420049', 'he_wt', '01040111', '2019-05-15 16:53:08', 'admin', null, '27', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab23f66004b', 'chen_zj', '01040111', '2019-05-15 16:53:25', 'admin', null, '28', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab2a783004d', 'chen_lf', '01040111', '2019-05-15 16:53:51', 'admin', null, '29', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab2f2f8004f', 'chen_zt', '01040111', '2019-05-15 16:54:11', 'admin', null, '30', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab33bdb0051', 'wu_xy', '01040111', '2019-05-15 16:54:29', 'admin', null, '31', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab395770053', 'fang_gm', '01040111', '2019-05-15 16:54:52', 'admin', null, '32', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab4113a0055', 'he_wy', '01040111', '2019-05-15 16:55:24', 'admin', null, '33', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab4908a0057', 'luo_hz', '01040111', '2019-05-15 16:55:57', 'admin', null, '34', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab4d18f0059', 'fan_sx', '01040111', '2019-05-15 16:56:13', 'admin', null, '35', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab527a9005b', 'ran_xb', '01040111', '2019-05-15 16:56:35', 'admin', null, '36', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab5742b005d', 'wang_zc1', '01040111', '2019-05-15 16:56:55', 'admin', null, '37', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab6f839005f', 'che_cm', '01040111', '2019-05-15 16:58:34', 'admin', null, '38', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab742d70061', 'li_mc', '01040111', '2019-05-15 16:58:53', 'admin', null, '39', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab7a97d0063', 'han_xh', '01040111', '2019-05-15 16:59:20', 'admin', null, '40', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab7fc660065', 'han_jt', '01040111', '2019-05-15 16:59:41', 'admin', null, '41', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab99df30067', 'cao_k', '01040111', '2019-05-15 17:01:28', 'admin', null, '42', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abab9e58f0069', 'wang_zc', '01040111', '2019-05-15 17:01:46', 'admin', null, '43', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababa2fb0006b', 'tian_wf', '01040111', '2019-05-15 17:02:05', 'admin', null, '44', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababb0503006d', 'yan_c', '01040111', '2019-05-15 17:03:00', 'admin', null, '45', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababb58ba006f', 'li_dj', '01040111', '2019-05-15 17:03:21', 'admin', null, '46', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababbbf0c0071', 'zhang_zq', '01040111', '2019-05-15 17:03:47', 'admin', null, '47', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababc10800073', 'deng_jq', '01040111', '2019-05-15 17:04:08', 'admin', null, '48', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababd5fe90075', 'zhang_xl', '01040111', '2019-05-15 17:05:34', 'admin', null, '49', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababdb0e80077', 'zhao_c', '01040111', '2019-05-15 17:05:55', 'admin', null, '50', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababe01450079', 'luo_xc', '01040111', '2019-05-15 17:06:15', 'admin', null, '51', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababe4079007b', 'yang_m', '01040111', '2019-05-15 17:06:32', 'admin', null, '52', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababe83fe007d', 'huang_qj', '01040111', '2019-05-15 17:06:49', 'admin', null, '53', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababed323007f', 'zhang_y', '01040111', '2019-05-15 17:07:09', 'admin', null, '54', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababf2b150081', 'yan_sp', '01040111', '2019-05-15 17:07:32', 'admin', null, '55', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababf76820083', 'bao_x', '01040111', '2019-05-15 17:07:51', 'admin', null, '56', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016ababfc8cc0085', 'luo_xq', '01040111', '2019-05-15 17:08:12', 'admin', null, '57', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac01f820087', 'hu_rt', '01040111', '2019-05-15 17:08:34', 'admin', null, '58', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac12ebc0089', 'hu_cb', '01040111', '2019-05-15 17:09:44', 'admin', null, '59', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac18771008b', 'wang_zh', '01040111', '2019-05-15 17:10:06', 'admin', null, '60', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac1f71b008d', 'fu_hj', '01040111', '2019-05-15 17:10:35', 'admin', null, '61', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac2556f008f', 'luo_xy', '01040111', '2019-05-15 17:10:59', 'admin', null, '62', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac2a02c0091', 'chen_wh', '01040111', '2019-05-15 17:11:18', 'admin', null, '63', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac349750093', 'he_lq', '01040111', '2019-05-15 17:12:01', 'admin', null, '64', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac3aaaa0095', 'chen_zy1', '01040111', '2019-05-15 17:12:26', 'admin', null, '65', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac45eee0097', 'ding_gt', '01040111', '2019-05-15 17:13:12', 'admin', null, '66', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac49b9f0099', 'su_l', '01040111', '2019-05-15 17:13:28', 'admin', null, '67', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac4e55c009b', 'han_fc', '01040111', '2019-05-15 17:13:47', 'admin', null, '68', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac52b09009d', 'cao_hs', '01040111', '2019-05-15 17:14:05', 'admin', null, '69', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac59456009f', 'deng_xg', '01040111', '2019-05-15 17:14:32', 'admin', null, '70', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6aba9ace016abac5e9d600a1', 'yang_mg', '01040111', '2019-05-15 17:14:54', 'admin', null, '71', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfea9dec0009', 'wang_b', '01040111', '2019-05-16 17:13:05', 'admin', null, '153', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfeaf18a000b', 'wu_km', '01040111', '2019-05-16 17:13:26', 'admin', null, '154', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfeb9157000d', 'ma_gh', '01040111', '2019-05-16 17:14:07', 'admin', null, '155', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfebd752000f', 'yuan_jy', '01040111', '2019-05-16 17:14:25', 'admin', null, '156', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfec2a380011', 'zhong_xy', '01040111', '2019-05-16 17:14:47', 'admin', null, '157', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfec844d0013', 'guo_ay', '01040111', '2019-05-16 17:15:10', 'admin', null, '158', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfeccc920015', 'lu_xm', '01040111', '2019-05-16 17:15:28', 'admin', null, '159', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfed12940017', 'wang_qm', '01040111', '2019-05-16 17:15:46', 'admin', null, '160', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfed5f6b0019', 'li_lib', '01040111', '2019-05-16 17:16:05', 'admin', null, '161', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfedaed3001b', 'luo_cq', '01040111', '2019-05-16 17:16:26', 'admin', null, '162', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfee0f8d001d', 'hu_jb', '01040111', '2019-05-16 17:16:51', 'admin', null, '163', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfee5634001f', 'sun_z', '01040111', '2019-05-16 17:17:09', 'admin', null, '164', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfee93120021', 'lu_xp', '01040111', '2019-05-16 17:17:24', 'admin', null, '165', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6abf946b016abfeee7f40023', 'deng_yh', '01040111', '2019-05-16 17:17:46', 'admin', null, '166', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac3c158016ac3c1d56a0000', 'yuan_cy', '01030101', '2019-05-17 11:07:01', 'zhu_cz', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c19f0f1100', 'wang_bx', '01080215', '2019-05-17 15:46:25', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c1c08f1101', 'sheng_my', '01080215', '2019-05-17 15:46:33', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c1f5761102', 'wang_jh', '01080215', '2019-05-17 15:46:47', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c226d51103', 'yang_gy', '01080215', '2019-05-17 15:46:59', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c246dc1104', 'xiao_yy', '01080215', '2019-05-17 15:47:07', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c26c211105', 'gu_yp', '01080215', '2019-05-17 15:47:17', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c290d61106', 'liu_zd', '01080215', '2019-05-17 15:47:26', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c2bd431107', 'xiong_j', '01080215', '2019-05-17 15:47:38', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ac4b1bb016ac4c2ded21108', 'chen_yx', '01080215', '2019-05-17 15:47:46', 'admin', null, '9', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ad33984016ad33fa0030001', 'liu_kk', '01030111', '2019-05-20 11:18:43', 'admin', null, '54', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ad33984016ad34773cd000a', 'zhu_zz', '01030111', '2019-05-20 11:27:16', 'admin', null, '57', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ad34e7b016ad35082220001', 'yang_l', '01030111', '2019-05-20 11:37:10', 'admin', null, '59', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ad34e7b016ad3be8e120003', 'chen_yj', '01030111', '2019-05-20 13:37:22', 'admin', null, '60', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ad34e7b016ad3c053d90006', 'ma_c', '01030111', '2019-05-20 13:39:18', 'admin', null, '61', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ad93d0d016ad97d60340000', 'song_z', '01030111', '2019-05-21 16:23:54', 'admin', null, '63', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae3f5cc016ae4072ae30001', 'admin', '010101', '2019-05-23 17:30:36', 'admin', null, '9', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7aaa76a0000', 'wang_xx', '01040110', '2019-05-24 10:28:02', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7aad5280001', 'feng_p', '01040110', '2019-05-24 10:28:14', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7ab00b00002', 'zhu_bq', '01040110', '2019-05-24 10:28:25', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7ab2b150003', 'ma_yg', '01040110', '2019-05-24 10:28:36', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7ab56160004', 'liu_bo', '01040110', '2019-05-24 10:28:47', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7ab82470005', 'zhao_f', '01040110', '2019-05-24 10:28:58', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7abba240006', 'zhu_jq', '01040110', '2019-05-24 10:29:12', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6ae77821016ae7abe95b0007', 'zhang_xq', '01040110', '2019-05-24 10:29:24', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfd70a8016bfdfa978a0021', 'lv_bh', '01080207', '2019-08-02 10:59:40', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76d3960002', 'xu_kx', '01080211', '2019-08-02 10:57:30', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76d3df0003', 'wang_jt', '01080211', '2019-08-02 10:57:41', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76d4270004', 'hu_sl', '01080208', '2019-08-02 10:58:13', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76d4780005', 'pei_zy', '01080208', '2019-08-02 10:58:00', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76d4c20006', 'zhang_jy', '01080207', '2019-08-02 11:00:09', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76d5050007', 'duan_zh', '01080213', '2019-08-02 11:00:47', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76d54d0008', 'xu_zp', '01080210', '2019-08-02 10:58:57', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76fd820009', 'sun_xf', '01080210', '2019-08-02 10:59:10', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76fdc8000a', 'wang_z', '01080214', '2019-08-02 11:01:37', 'admin', null, '10', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76fe10000b', 'chen_x', '01080214', '2019-08-02 11:01:31', 'admin', null, '9', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76fe55000c', 'chen_b', '01080214', '2019-08-02 11:01:25', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6bfe74a5016bfe76fe99000d', 'chao_yf', '01080214', '2019-08-02 11:01:15', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6c040f5e016c0441830c000d', 'zhang_jj', '01030120', '2019-07-18 16:44:58', 'chen_w', null, '22200019', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6c2c6350016c2c6882fc0005', 'zheng_wf', '01030120', '2019-07-26 11:52:22', 'chen_w', null, '5003', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6c2c6350016c2c68d1410009', 'han_c', '01030120', '2019-07-26 11:52:42', 'chen_w', null, '5004', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6c2c6350016c2c690d2a000d', 'shao_zm', '01030120', '2019-07-26 11:52:58', 'chen_w', null, '5005', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6c459af7016c461d5c45001f', 'zan_he', '01030120', '2019-07-31 11:40:25', 'chen_w', null, '24110021', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6c459af7016c461dcc9a0023', 'zan_ww', '01030120', '2019-07-31 11:40:54', 'chen_w', null, '24110022', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6c459af7016c461e54590027', 'feng_cj', '01030120', '2019-07-31 11:41:28', 'chen_w', null, '24110023', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6b8140001', 'chen_zl', '010101', '2020-01-15 14:31:53', 'admin', null, '10', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6b8b20002', 'wang_cn', '010101', '2020-01-15 14:31:53', 'admin', null, '11', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6b92a0003', 'wang_t', '010101', '2020-01-15 14:31:53', 'admin', null, '12', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6b9c70004', 'pei_sx', '010101', '2020-01-15 14:31:53', 'admin', null, '13', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6ba540005', 'li_h', '010101', '2020-01-15 14:31:53', 'admin', null, '14', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6bad80006', 'yu_l', '010101', '2020-01-15 14:31:53', 'admin', null, '15', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6bb7e0007', 'li_q', '010101', '2020-01-15 14:31:53', 'admin', null, '16', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6bc070008', 'jin_m', '010101', '2020-01-15 14:31:53', 'admin', null, '17', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6bcab0009', 'ji_j', '010101', '2020-01-15 14:31:53', 'admin', null, '18', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80800a6fa7d50f016fa7e6bd57000a', 'wang_wj', '010101', '2020-01-15 14:31:53', 'admin', null, '19', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ea89c090001', 'dong_jj', '01080201', '2019-04-24 17:23:54', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ea9093c0003', 'wang_mf', '01080202', '2019-04-24 17:24:22', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ea97b500005', 'chen_wc', '01080203', '2019-04-24 17:24:51', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ea9ebfc0007', 'fan_gw', '01080204', '2019-04-24 17:25:20', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eaa49380009', 'liu_xg', '01080205', '2019-04-24 17:25:44', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eaab929000b', 'jin_ch', '01080206', '2019-04-24 17:26:12', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eab0f63000d', 'guo_ld', '01080206', '2019-04-24 17:26:35', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eab65dc000f', 'zhou_w', '01080206', '2019-04-24 17:26:57', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eabb8100011', 'bai_zx', '01080206', '2019-04-24 17:27:18', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eac211f0013', 'du_w', '01080206', '2019-04-24 17:27:45', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eacd6980015', 'yang_yl', '01080207', '2019-04-24 17:28:31', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ead2ca30017', 'zhang_sy', '01080207', '2019-04-24 17:28:53', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ead84920019', 'zhao_yq', '01080207', '2019-04-24 17:29:16', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eadd39b001b', 'tang_mx', '01080207', '2019-04-24 17:29:36', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eae3d26001d', 'xu_xl', '01080208', '2019-04-24 17:30:03', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eafc70d0023', 'zhao_zw', '01080209', '2019-04-24 17:31:44', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb08c8c0027', 'zhang_j1', '01080210', '2019-04-24 17:32:34', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb11c1e0029', 'zhai_wp', '01080210', '2019-04-24 17:33:11', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb194e5002b', 'liu_j', '01080211', '2019-04-24 17:33:42', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb1fdb5002d', 'du_e', '01080211', '2019-04-24 17:34:09', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb25640002f', 'zhao_ry', '01080212', '2019-04-24 17:34:31', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb29e670031', 'gao_yj', '01080212', '2019-04-24 17:34:50', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb2e7c50033', 'wang_gh', '01080212', '2019-04-24 17:35:09', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb333940035', 'xiang_zl', '01080212', '2019-04-24 17:35:28', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb3a1530037', 'li_l', '01080213', '2019-04-24 17:35:56', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb3ff3b0039', 'wang_h', '01080213', '2019-04-24 17:36:20', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb452e6003b', 'shen_c', '01080213', '2019-04-24 17:36:42', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb4a4bd003d', 'hu_hy', '01080214', '2019-04-24 17:37:03', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb5039e003f', 'ji_ty', '01080214', '2019-04-24 17:37:27', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb553810041', 'wang_hr', '01080214', '2019-04-24 17:37:47', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb5a5680043', 'zhang_lf', '01080214', '2019-04-24 17:38:08', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb5fa890045', 'zhang_cy1', '01080214', '2019-04-24 17:38:30', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb6f09a0047', 'ai_jh', '01080214', '2019-04-24 17:39:33', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb7e1da0049', 'yu_gw', '01080216', '2019-04-24 17:40:35', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb82d5b004b', 'wang_gf', '01080216', '2019-04-24 17:40:54', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb86a0d004d', 'wang_sm', '01080216', '2019-04-24 17:41:10', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb8b0bd004f', 'hou_hl', '01080216', '2019-04-24 17:41:28', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb92bb50051', 'li_xh', '01080216', '2019-04-24 17:41:59', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb984020053', 'hou_ht', '01080216', '2019-04-24 17:42:22', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eb9c19e0055', 'zhou_mh', '01080216', '2019-04-24 17:42:38', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eba0be60057', 'li_zt', '01080216', '2019-04-24 17:42:57', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eba57470059', 'yang_yh', '01080216', '2019-04-24 17:43:16', 'admin', null, '9', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4eba95bd005b', 'li_hz', '01080216', '2019-04-24 17:43:32', 'admin', null, '10', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ebaef9f005d', 'kong_xx', '01080216', '2019-04-24 17:43:55', 'admin', null, '11', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ebb3018005f', 'zhou_mf', '01080216', '2019-04-24 17:44:11', 'admin', null, '12', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ebb77260061', 'zhou_yb', '01080216', '2019-04-24 17:44:30', 'admin', null, '13', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ebbb1960063', 'zhou_bb', '01080216', '2019-04-24 17:44:45', 'admin', null, '14', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a4ea583016a4ebbf1440065', 'chen_hj', '01080216', '2019-04-24 17:45:01', 'admin', null, '15', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c551ee90001', 'feng_sq', '01030101', '2019-06-11 17:03:57', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c56802a0007', 'gao_pp', '01030101', '2019-05-06 16:50:40', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c56d25f0009', 'meng_xm', '01030101', '2019-05-06 16:51:01', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c590688000b', 'lu_j', '01030101', '2019-05-06 16:53:26', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c5fd79a000d', 'gu_ad', '01030102', '2019-05-06 17:00:52', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c624c8a000f', 'yang_y', '01030102', '2019-05-06 17:03:33', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c635a110011', 'huai_xg', '01030102', '2019-05-06 17:04:42', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c63a5910013', 'hu_b', '01030102', '2019-05-06 17:05:02', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c63e0cc0015', 'zhao_sj', '01030102', '2019-05-06 17:05:17', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6418310017', 'zhang_xy', '01030102', '2019-05-06 17:05:31', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6465950019', 'yao_zz', '01030102', '2019-05-06 17:05:51', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c64f610001b', 'feng_lq', '01030102', '2019-05-06 17:06:28', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6920c7001d', 'liu_cx', '01030102', '2019-05-06 17:11:01', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6a9b62001f', 'xu_yh', '01030102', '2019-05-06 17:12:38', 'admin', null, '10', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6b2ce70023', 'guo_zj', '01030102', '2019-05-06 17:13:15', 'admin', null, '11', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6b80530025', 'mu_tl', '01030103', '2019-05-06 17:13:37', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6bc33c0027', 'zhao_nw', '01030103', '2019-05-06 17:13:54', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6c0de20029', 'jing_hr', '01030103', '2019-05-06 17:14:13', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6c6d30002b', 'liu_wq', '01030104', '2019-05-06 17:14:37', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6cb3f0002d', 'li_wn', '01030104', '2019-05-06 17:14:55', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6cfeb5002f', 'ren_yy', '01030105', '2019-05-06 17:15:14', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6d3c610031', 'he_r', '01030105', '2019-05-06 17:15:30', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6df1ba0033', 'weng_yz', '01030105', '2019-05-06 17:16:17', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6e753b0037', 'yu_j', '01030106', '2019-05-06 17:16:50', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6ed1ac0039', 'liu_zq', '01030106', '2019-05-06 17:17:14', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6f12e0003b', 'zhang_sw', '01030106', '2019-05-06 17:17:31', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c6fa723003f', 'guo_ln', '01030107', '2019-05-06 17:18:09', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c701fcb0041', 'cao_zc', '01030107', '2019-05-06 17:18:40', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c711e260043', 'song_jm', '01030104', '2019-05-16 17:16:16', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c71ef2a0047', 'zang_xm', '01030107', '2019-05-06 17:20:38', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c72c5c9004b', 'yu_jx', '01030108', '2019-05-06 17:21:33', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c730374004d', 'he_c', '01030108', '2019-05-06 17:21:49', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c736208004f', 'xue_j', '01030108', '2019-05-06 17:22:13', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c73bcd40051', 'liu_zl', '01030109', '2019-05-06 17:22:36', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c7403c20053', 'yu_qc', '01030109', '2019-05-06 17:22:55', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c745b440055', 'cheng_cs', '01030109', '2019-05-06 17:23:17', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c749f170057', 'zhu_cz', '01030109', '2019-05-06 17:23:34', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c74f16a0059', 'gong_d', '01030109', '2019-05-06 17:23:55', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c7541cb005b', 'fu_wj', '01030109', '2019-05-06 17:24:16', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c75cdc4005f', 'chen_l', '01030110', '2019-05-06 17:24:52', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c76095d0061', 'peng_hc', '01030110', '2019-05-06 17:25:07', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c7647b40063', 'liu_yc', '01030110', '2019-05-06 17:25:23', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a86a605016a8c7777c8006b', 'wang_fm', '01030110', '2019-05-06 17:26:41', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a915a82690001', 'li_xk', '01030111', '2019-05-07 16:13:09', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9162497a0005', 'sun_ph', '01030111', '2019-05-07 16:21:39', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916328150009', 'liu_gq', '01030111', '2019-05-07 16:22:36', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a91638fb3000b', 'ding_zy', '01030111', '2019-05-07 16:23:02', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9166a143000f', 'jiang_rm', '01030111', '2019-05-07 16:26:23', 'admin', null, '9', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9166e7200011', 'zhou_hg', '01030111', '2019-05-07 16:26:41', 'admin', null, '10', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a91672c920013', 'lv_jg', '01030111', '2019-05-07 16:26:59', 'admin', null, '11', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a91676e2c0015', 'zhu_qc', '01030111', '2019-05-07 16:27:16', 'admin', null, '12', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9167b2680017', 'zhou_y', '01030111', '2019-05-07 16:27:33', 'admin', null, '13', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9168585a001b', 'zhou_l', '01030111', '2019-05-07 16:28:16', 'admin', null, '15', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9168a597001d', 'zhao_b', '01030111', '2019-05-07 16:28:36', 'admin', null, '16', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9168f894001f', 'he_b', '01030111', '2019-05-07 16:28:57', 'admin', null, '17', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916948890021', 'chen_y', '01030111', '2019-05-07 16:29:17', 'admin', null, '18', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a91699c3a0023', 'hou_hm', '01030111', '2019-05-07 16:29:39', 'admin', null, '19', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9169e8570025', 'zhang_cm', '01030111', '2019-05-07 16:29:58', 'admin', null, '20', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916a5a3f0027', 'wang_s', '01030111', '2019-05-07 16:30:27', 'admin', null, '21', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916aa1f90029', 'meng_j', '01030111', '2019-05-07 16:30:46', 'admin', null, '22', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916ae5b4002b', 'yan_jl', '01030111', '2019-05-07 16:31:03', 'admin', null, '23', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916b254f002d', 'chen_zy', '01030111', '2019-05-07 16:31:19', 'admin', null, '24', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916eb596002f', 'zhang_al', '01030111', '2019-05-07 16:35:13', 'admin', null, '25', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916eebde0031', 'ma_cj', '01030111', '2019-05-07 16:35:27', 'admin', null, '26', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916f1a1f0033', 'gu_xl', '01030111', '2019-05-07 16:35:39', 'admin', null, '27', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916f6fbb0035', 'zhang_sx', '01030111', '2019-05-07 16:36:00', 'admin', null, '28', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a916fbfc10037', 'li_jh1', '01030111', '2019-05-07 16:36:21', 'admin', null, '29', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917006b20039', 'li_jw', '01030111', '2019-05-07 16:36:39', 'admin', null, '30', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917053d9003b', 'tang_y', '01030111', '2019-05-07 16:36:59', 'admin', null, '31', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a91708468003d', 'cheng_j', '01030111', '2019-05-07 16:37:11', 'admin', null, '32', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9170c58e003f', 'tian_jl', '01030111', '2019-05-07 16:37:28', 'admin', null, '33', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917121a30041', 'guo_jl', '01030111', '2019-05-07 16:37:52', 'admin', null, '34', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917168ea0043', 'qiu_hd', '01030111', '2019-05-07 16:38:10', 'admin', null, '35', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9171d42e0045', 'liu_sh', '01030111', '2019-05-07 16:38:37', 'admin', null, '36', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9172185e0047', 'guo_jy', '01030111', '2019-05-07 16:38:55', 'admin', null, '37', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917290a8004b', 'liao_qw', '01030111', '2019-05-07 16:39:26', 'admin', null, '39', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9172cb1c004d', 'qiu_fx', '01030111', '2019-05-07 16:39:41', 'admin', null, '40', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9173babc0053', 'zhang_cj', '01030111', '2019-05-07 16:40:42', 'admin', null, '43', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917470c30055', 'ma_sh', '01030111', '2019-05-07 16:41:28', 'admin', null, '44', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9174ba600057', 'ma_yq', '01030111', '2019-05-07 16:41:47', 'admin', null, '45', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917519160059', 'ma_hl', '01030111', '2019-05-07 16:42:12', 'admin', null, '46', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9176202b005b', 'yi_jf', '01030111', '2019-05-07 16:43:19', 'admin', null, '47', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9176652f005d', 'hu_x', '01030111', '2019-05-07 16:43:37', 'admin', null, '48', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9176a00d005f', 'ma_yb', '01030111', '2019-05-07 16:43:52', 'admin', null, '49', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9176dc3b0061', 'tao_x', '01030111', '2019-05-07 16:44:07', 'admin', null, '50', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a9177281d0063', 'tao_hr', '01030111', '2019-05-07 16:44:26', 'admin', null, '51', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6a913a41016a917767a20065', 'chen_yj1', '01030111', '2019-05-07 16:44:43', 'admin', null, '52', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016aba29a5a0007f', 'yang_zx', '01040101', '2019-05-15 14:24:12', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016aba328a510081', 'lan_hb', '01040101', '2019-05-15 14:33:55', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016aba331f200083', 'liu_j1', '01040101', '2019-05-15 14:34:33', 'admin', null, '2', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016aba33fffc0085', 'yin_yp', '01040101', '2019-05-15 14:35:31', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016aba3628b00087', 'jia_jf', '01040101', '2019-05-15 14:37:53', 'admin', null, '3', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016aba3936080089', 'shen_jc', '01040106', '2019-05-15 14:41:13', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016aba39a9c0008b', 'he_zb', '01040104', '2019-05-15 14:41:42', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac73247008d', 'zhang_jh', '01040111', '2019-05-15 17:16:18', 'admin', null, '72', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac7867e008f', 'lv_c', '01040111', '2019-05-15 17:16:39', 'admin', null, '73', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac7e30f0091', 'kang_yj', '01040111', '2019-05-15 17:17:03', 'admin', null, '74', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac82e220093', 'li_bq', '01040111', '2019-05-15 17:17:22', 'admin', null, '75', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac873a90095', 'cao_xb', '01040111', '2019-05-15 17:17:40', 'admin', null, '76', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac8b98f0097', 'jiang_cx', '01040111', '2019-05-15 17:17:58', 'admin', null, '77', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac911010099', 'jian_hy', '01040111', '2019-05-15 17:18:20', 'admin', null, '78', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac95c43009b', 'su_xs', '01040111', '2019-05-15 17:18:40', 'admin', null, '79', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abac9ccd0009d', 'han_yz', '01040111', '2019-05-15 17:19:08', 'admin', null, '80', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaca16bb009f', 'han_zs', '01040111', '2019-05-15 17:19:27', 'admin', null, '81', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaca80f200a1', 'tang_xh', '01040111', '2019-05-15 17:19:54', 'admin', null, '82', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abacac5be00a3', 'huang_wy', '01040111', '2019-05-15 17:20:12', 'admin', null, '83', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abace52c000a5', 'luo_xm', '01040111', '2019-05-15 17:24:05', 'admin', null, '84', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaceafae00a7', 'ma_yy', '01040111', '2019-05-15 17:24:29', 'admin', null, '85', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad0b8e100a9', 'li_l1', '01040111', '2019-05-15 17:26:42', 'admin', null, '86', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad1ccdd00ab', 'qiu_j', '01040111', '2019-05-15 17:27:53', 'admin', null, '87', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad2186d00ad', 'liu_df', '01040111', '2019-05-15 17:28:12', 'admin', null, '88', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad26d1200af', 'chen_p', '01040111', '2019-05-15 17:28:34', 'admin', null, '89', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad2c44500b1', 'yu_h', '01040111', '2019-05-15 17:28:56', 'admin', null, '90', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad31d8b00b3', 'yang_q', '01040111', '2019-05-15 17:29:19', 'admin', null, '91', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad3877400b5', 'hou_wd', '01040111', '2019-05-15 17:29:46', 'admin', null, '92', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abad9df7100b7', 'fu_j', '01040111', '2019-05-15 17:36:42', 'admin', null, '93', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abada3edf00b9', 'ma_lz', '01040111', '2019-05-15 17:37:06', 'admin', null, '94', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadab4d800bb', 'pu_rl', '01040111', '2019-05-15 17:37:36', 'admin', null, '95', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadb01cf00bd', 'ma_jg', '01040111', '2019-05-15 17:37:56', 'admin', null, '96', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadb45a200bf', 'li_jx', '01040111', '2019-05-15 17:38:13', 'admin', null, '97', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadb92f600c1', 'yang_bc', '01040111', '2019-05-15 17:38:33', 'admin', null, '98', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadc958500c3', 'zha_ry', '01040111', '2019-05-15 17:39:39', 'admin', null, '99', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadcddac00c5', 'zhang_px', '01040111', '2019-05-15 17:39:58', 'admin', null, '100', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadd3d8700c7', 'zhang_hl', '01040111', '2019-05-15 17:40:22', 'admin', null, '101', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadd8e7300c9', 'huang_c', '01040111', '2019-05-15 17:40:43', 'admin', null, '102', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaddd97700cb', 'qi_sc', '01040111', '2019-05-15 17:41:02', 'admin', null, '103', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abade20c300cd', 'he_zj', '01040111', '2019-05-15 17:41:20', 'admin', null, '104', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abade6b0b00cf', 'xu_yw', '01040111', '2019-05-15 17:41:40', 'admin', null, '105', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadec2ac00d1', 'liao_zs', '01040111', '2019-05-15 17:42:02', 'admin', null, '106', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadf05f300d3', 'ding_xy', '01040111', '2019-05-15 17:42:19', 'admin', null, '107', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadf592100d5', 'xu_xj', '01040111', '2019-05-15 17:42:40', 'admin', null, '108', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abadfbe2a00d7', 'lu_hy', '01040111', '2019-05-15 17:43:06', 'admin', null, '109', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae00ac300d9', 'zhang_lj', '01040111', '2019-05-15 17:43:26', 'admin', null, '110', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae059bd00db', 'yang_tp', '01040111', '2019-05-15 17:43:46', 'admin', null, '111', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae0b32200dd', 'zhang_my', '01040111', '2019-05-15 17:44:09', 'admin', null, '112', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae1204500df', 'shao_zl', '01040111', '2019-05-15 17:44:37', 'admin', null, '113', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae1718000e1', 'yu_zr', '01040111', '2019-05-15 17:44:58', 'admin', null, '114', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae1c9ec00e3', 'zhang_kc', '01040111', '2019-05-15 17:45:20', 'admin', null, '115', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae2175000e5', 'zhang_qm', '01040111', '2019-05-15 17:45:40', 'admin', null, '116', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae25cb800e7', 'yang_fh', '01040111', '2019-05-15 17:45:58', 'admin', null, '117', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae2b71700e9', 'zhu_kx', '01040111', '2019-05-15 17:46:21', 'admin', null, '118', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae31c3000eb', 'li_jh', '01040111', '2019-05-15 17:46:47', 'admin', null, '119', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae3622400ed', 'lv_lq', '01040111', '2019-05-15 17:47:05', 'admin', null, '120', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae3b2a400ef', 'zhang_xg', '01040111', '2019-05-15 17:47:26', 'admin', null, '121', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae4013100f1', 'zhou_sh', '01040111', '2019-05-15 17:47:46', 'admin', null, '122', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae469e100f3', 'fu_qk', '01040111', '2019-05-15 17:48:12', 'admin', null, '123', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae4c6c000f5', 'zhao_gj', '01040111', '2019-05-15 17:48:36', 'admin', null, '124', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae514df00f7', 'yang_my', '01040111', '2019-05-15 17:48:56', 'admin', null, '125', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae5a8e400f9', 'he_m', '01040111', '2019-05-15 17:49:34', 'admin', null, '126', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae615b900fb', 'han_bj', '01040111', '2019-05-15 17:50:02', 'admin', null, '127', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae6e6ae00fd', 'wang_yf', '01040111', '2019-05-15 17:50:55', 'admin', null, '128', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae739ad00ff', 'jin_wx', '01040111', '2019-05-15 17:51:17', 'admin', null, '129', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae7832b0101', 'chen_dq', '01040111', '2019-05-15 17:51:36', 'admin', null, '130', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae7e8530103', 'niu_hh', '01040111', '2019-05-15 17:52:01', 'admin', null, '131', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae82e860105', 'niu_yb', '01040111', '2019-05-15 17:52:19', 'admin', null, '132', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae88af70107', 'he_l', '01040111', '2019-05-15 17:52:43', 'admin', null, '133', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae8f0100109', 'yang_zp', '01040111', '2019-05-15 17:53:09', 'admin', null, '134', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae93846010b', 'huang_yf', '01040111', '2019-05-15 17:53:27', 'admin', null, '135', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae9880a010d', 'han_bp', '01040111', '2019-05-15 17:53:48', 'admin', null, '136', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abae9e601010f', 'chen_xg', '01040111', '2019-05-15 17:54:12', 'admin', null, '137', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaea8c4e0113', 'lang_lc', '01040111', '2019-05-15 17:54:55', 'admin', null, '139', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaecb11c0115', 'feng_xw', '01040111', '2019-05-15 17:57:15', 'admin', null, '140', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaed1a780117', 'zhu_jp', '01040111', '2019-05-15 17:57:42', 'admin', null, '141', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaed6db60119', 'liu_x', '01040111', '2019-05-15 17:58:03', 'admin', null, '142', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaede13f011b', 'li_jl', '01040111', '2019-05-15 17:58:33', 'admin', null, '143', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaee6bc2011d', 'li_tc', '01040111', '2019-05-15 17:59:08', 'admin', null, '144', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaeeb687011f', 'lv_yk', '01040111', '2019-05-15 17:59:27', 'admin', null, '145', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaef52970121', 'lv_ls', '01040111', '2019-05-15 18:00:07', 'admin', null, '146', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaefa7a90123', 'wang_xh', '01040111', '2019-05-15 18:00:29', 'admin', null, '147', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaeff9ce0125', 'zheng_xg', '01040111', '2019-05-15 18:00:50', 'admin', null, '148', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaf047030127', 'zhu_ml', '01040111', '2019-05-15 18:01:10', 'admin', null, '149', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaf0ae0e0129', 'zhu_jq1', '01040111', '2019-05-15 18:01:36', 'admin', null, '150', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaf14b56012b', 'cao_y', '01040111', '2019-05-15 18:02:17', 'admin', null, '151', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6ab5d4be016abaf1a5b5012d', 'zhang_j', '01040111', '2019-05-15 18:02:40', 'admin', null, '152', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6abb4098016abf98cfd40134', 'gao_xy', '01030107', '2019-05-16 15:43:44', 'feng_lq', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6abb4098016abfb163e20136', 'liu_cs', '01030105', '2019-05-16 16:10:35', 'feng_lq', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6b1b35e2016b1c6880420000', 'chen_w', '010102', '2019-06-03 16:15:39', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6b1d06e8016b218ac991010a', 'an_jy', '01030102', '2019-06-04 16:11:12', 'yu_j', null, '14', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6b3f7bf1016b40759a590002', 'zhao_zy', '01030110', '2019-06-10 16:16:17', 'liu_yc', null, '12', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6b8795f0016b881223260000', 'chen_c', '010105', '2019-06-24 14:00:18', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6b8795f0016b8817e4450002', 'nie_hf', '010103', '2019-06-24 14:06:36', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6b8795f0016b881854010003', 'yin_q', '010104', '2019-06-24 14:07:04', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6bd5d60c016bd5d989350012', 'zhang_md', '01020110', '2019-07-09 16:40:22', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6bfecebe016bff3c99420033', 'song_ec', '01030120', '2019-07-17 17:21:30', 'feng_lq', null, '22200017', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6bfecebe016bff3cfdfd0037', 'han_yf', '01030120', '2019-07-17 17:21:56', 'feng_lq', null, '22200018', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c042376016c044ef3a60026', 'gu_tc', '01030120', '2019-07-18 16:59:39', 'feng_lq', null, '22200020', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c042376016c076a1ca100f9', 'li_xt', '01030120', '2019-07-19 07:28:10', 'feng_lq', null, '8200006', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c042376016c076b0bbf00fd', 'sheng_yq', '01030120', '2019-07-19 07:29:11', 'feng_lq', null, '8200007', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c042376016c07be55060120', 'zhu_xf', '01030120', '2019-07-19 09:00:10', 'feng_lq', null, '8200008', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c07e14d016c07fb622e0149', 'ren_xq', '01030120', '2019-07-19 10:06:51', 'feng_lq', null, '22200021', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c07e14d016c07fc58fa014d', 'cheng_x', '01030120', '2019-07-19 10:07:54', 'feng_lq', null, '22200022', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c090eabb40030', 'liu_zp', '01030120', '2019-07-19 15:07:32', 'feng_lq', null, '8200009', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c090f75d50035', 'zhang_wl', '01030120', '2019-07-19 15:08:24', 'feng_lq', null, '8200010', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c091098ee003b', 'tang_jm', '01030120', '2019-07-19 15:09:38', 'feng_lq', null, '8200011', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c0910f6f50040', 'wang_c', '01030120', '2019-07-19 15:10:02', 'feng_lq', null, '8200012', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c091142660044', 'hu_zx', '01030120', '2019-07-19 15:10:22', 'feng_lq', null, '8200013', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c09118fda0048', 'yang_sy', '01030120', '2019-07-19 15:10:42', 'feng_lq', null, '8200014', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c09121213004c', 'shu_l', '01030120', '2019-07-19 15:11:15', 'feng_lq', null, '8200015', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c0912965f0050', 'zheng_lq', '01030120', '2019-07-19 15:11:49', 'feng_lq', null, '8200016', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c084af8016c09130d620054', 'wu_gf', '01030120', '2019-07-19 15:12:19', 'feng_lq', null, '8200017', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c1d8a27016c1d93d24b0007', 'beng_gf', '01030120', '2019-07-23 14:45:22', 'feng_lq', null, '22200027', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c1d8a27016c1d947db6000b', 'ren_bb', '01030120', '2019-07-23 14:46:06', 'feng_lq', null, '22200028', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c266e31c6036f', 'zhao_yf1', '01080206', '2019-08-02 10:52:25', 'du_w', null, '10', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26acf2540384', 'niu_lp', '01030120', '2019-07-25 09:09:24', 'admin', null, '22200029', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26ae74fa0389', 'qi_bc', '01030120', '2019-07-25 09:11:03', 'admin', null, '22200030', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b0e3d2038d', 'zhang_cy', '01030120', '2019-07-25 09:13:42', 'admin', null, '22200031', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b234fd0392', 'zhao_xh', '01030120', '2019-07-25 09:15:09', 'admin', null, '22200032', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b55191039a', 'gong_cq', '01030120', '2019-07-25 09:18:33', 'feng_lq', null, '9110008', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b5b062039e', 'yu_cb', '01030120', '2019-07-25 09:18:57', 'feng_lq', null, '9110009', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b72f1303a3', 'zhou_zy1', '01030120', '2019-07-25 09:20:35', 'feng_lq', null, '9110010', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b7e00903a7', 'cao_cw', '01030120', '2019-07-25 09:21:20', 'feng_lq', null, '9110011', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b83a2903ab', 'yuan_fq', '01030120', '2019-07-25 09:21:43', 'feng_lq', null, '9110012', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b8896103b1', 'li_w', '01030120', '2019-07-25 09:22:04', 'feng_lq', null, '9110013', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26b9d45503c1', 'xu_ch', '01030120', '2019-07-25 09:23:28', 'feng_lq', null, '9110017', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26ba32ba03c5', 'tian_zy', '01030120', '2019-07-25 09:23:53', 'feng_lq', null, '9110018', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26ba92b403c9', 'xu_hx', '01030120', '2019-07-25 09:24:17', 'feng_lq', null, '9110019', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26bb0a7203cd', 'wang_yq', '01030120', '2019-07-25 09:24:48', 'feng_lq', null, '9110020', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26bb98cb03d2', 'cui_xz', '01030120', '2019-07-25 09:25:24', 'feng_lq', null, '9110021', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26bc0ee403d6', 'xu_jl', '01030120', '2019-07-25 09:25:54', 'feng_lq', null, '9110022', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26bdbf9c03da', 'chen_xz', '01030120', '2019-07-25 09:27:45', 'feng_lq', null, '9110023', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26be864403de', 'chun_h', '01030120', '2019-07-25 09:28:36', 'feng_lq', null, '22200033', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c0146f03e3', 'chun_zx', '01030120', '2019-07-25 09:30:18', 'feng_lq', null, '22200034', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c05d0203e7', 'ding_sj', '01030120', '2019-07-25 09:30:37', 'feng_lq', null, '22200035', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c1a65103ec', 'hao_xl', '01030120', '2019-07-25 09:32:01', 'feng_lq', null, '22200037', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c2090903f0', 'li_zy', '01030120', '2019-07-25 09:32:26', 'feng_lq', null, '22200038', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c2523903f4', 'shi_zc', '01030120', '2019-07-25 09:32:45', 'feng_lq', null, '22200039', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c2d4df03f8', 'xiao_x', '01030120', '2019-07-25 09:33:18', 'feng_lq', null, '22200040', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c3220503fc', 'yang_zt', '01030120', '2019-07-25 09:33:38', 'feng_lq', null, '22200041', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c3784e0400', 'zhang_dw', '01030120', '2019-07-25 09:34:00', 'feng_lq', null, '22200042', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c3d6b30404', 'zhang_wx', '01030120', '2019-07-25 09:34:24', 'feng_lq', null, '22200043', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c6cd6f0409', 'zhao_gc', '01030120', '2019-07-25 09:37:39', 'feng_lq', null, '22200044', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c8ee950411', 'tong_zq', '01030120', '2019-07-25 09:39:58', 'feng_lq', null, '22200046', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2356de016c26c984ab0416', 'tong_xt', '01030120', '2019-07-25 09:40:37', 'feng_lq', null, '22200047', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c26e66d016c26f42fdc0029', 'wen_tw', '01080220', '2019-07-25 10:27:13', 'du_w', null, '6080002', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c26e66d016c26f8f4be004d', 'zhang_z', '01080206', '2019-08-02 10:56:59', 'du_w', null, '11', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2835c1016c2be43eb903e3', 'chen_sy', '01030120', '2019-07-26 09:27:54', 'chen_w', null, '22200045', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2835c1016c2be5405e03e7', 'shen_br', '01030120', '2019-07-26 09:29:00', 'chen_w', null, '22200046', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2835c1016c2be7a91d03ec', 'zhuo_hb', '01030120', '2019-07-26 09:31:38', 'chen_w', null, '22200047', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2835c1016c2c5609370439', 'wang_wg', '01030120', '2019-07-26 11:32:12', 'chen_w', null, '9110024', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2835c1016c2c5822af043e', 'han_xt', '01030120', '2019-07-26 11:34:29', 'chen_w', null, '22200048', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2835c1016c2c5883d10442', 'sun_gh', '01030120', '2019-07-26 11:34:54', 'chen_w', null, '22200049', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2835c1016c2c58d1450447', 'liu_yg', '01030120', '2019-07-26 11:35:14', 'chen_w', null, '22200050', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2de1f6016c3b6a2cf50c9f', 'zhao_f1', '01030120', '2019-07-29 09:48:29', 'chen_w', null, '24110019', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c2de1f6016c3b6b15bd0ca3', 'liu_y1', '01030120', '2019-07-29 09:49:29', 'chen_w', null, '24110020', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c5032c4680020', 'tan_zx', '01030110', '2019-08-02 10:40:00', 'admin', null, '13', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c503334490022', 'lu_ke', '01030110', '2019-08-02 10:40:29', 'admin', null, '14', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c50336d620023', 'dang_zq', '01030110', '2019-08-02 10:40:43', 'admin', null, '15', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c5035e30e0024', 'hou_tq', '01030102', '2019-08-02 10:43:25', 'admin', null, '15', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c50360eee0025', 'xiao_c', '01030102', '2019-08-02 10:43:36', 'admin', null, '16', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c503636990026', 'hu_zy', '01030102', '2019-08-02 10:43:46', 'admin', null, '17', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c50365de70027', 'li_h', '01030102', '2019-08-02 10:43:56', 'admin', null, '18', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c50367fc90028', 'liu_r', '01030102', '2019-08-02 10:44:05', 'admin', null, '19', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c5036c6a80029', 'meng_fq', '01030104', '2019-08-02 10:44:23', 'admin', null, '4', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c50371f32002a', 'wang_yc', '01030104', '2019-08-02 10:44:45', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c503772af002c', 'shao_wd', '01030106', '2019-08-02 10:45:07', 'admin', null, '5', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c50379ce9002d', 'wang_h1', '01030106', '2019-08-02 10:45:18', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c503987a4002e', 'hu_yf', '01080206', '2019-08-02 10:47:23', 'admin', null, '6', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c503a12d3002f', 'yuan_zb', '01080206', '2019-08-02 10:47:59', 'admin', null, '7', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c503a3ca00030', 'jiao_y', '01080206', '2019-08-02 10:48:10', 'admin', null, '8', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c503a845a0031', 'lin_y', '01080206', '2019-08-02 10:48:28', 'admin', null, '9', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c501330016c566116ad04f2', 'wang_jc', '01080220', '2019-08-03 15:28:19', 'du_w', null, '20200019', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c5f84dc016c5f8ae0f10005', 'yao_fl', '01030120', '2019-08-05 10:10:33', 'chen_w', null, '22200051', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c609927016c60d6090a001c', 'tao_cw', '01030120', '2019-08-05 16:12:15', 'chen_w', null, '23050011', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c609927016c60d9fd340021', 'zhang_yc', '01030120', '2019-08-05 16:16:34', 'chen_w', null, '23050012', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c609927016c60da76fe0025', 'lu_yx', '01030120', '2019-08-05 16:17:06', 'chen_w', null, '23050013', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c609927016c60db27970029', 'liu_xq', '01030120', '2019-08-05 16:17:51', 'chen_w', null, '23050014', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c64bbc1016c74b30a6a0dd6', 'zhou_zh', '01030120', '2019-08-09 12:46:26', 'feng_lq', null, '9110025', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c64bbc1016c74b374ef0dda', 'wen_jy', '01030120', '2019-08-09 12:46:54', 'feng_lq', null, '9110026', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c64bbc1016c74b3f1ac0dde', 'yuna_q', '01030120', '2019-08-09 12:47:26', 'feng_lq', null, '9110027', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c64bbc1016c74b46daf0de2', 'cui_np', '01030120', '2019-08-09 12:47:57', 'feng_lq', null, '9110028', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c64bbc1016c74b501070de6', 'wang_zm', '01030120', '2019-08-09 12:48:35', 'feng_lq', null, '9110029', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c64bbc1016c74b561fb0dea', 'cui_j', '01030120', '2019-08-09 12:49:00', 'feng_lq', null, '9110030', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c750627016c764a212e006a', 'chai_p', '01080220', '2019-08-09 20:11:05', 'du_w', null, '2120007', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cb91204e324e3', 'fang_ew', '01030120', '2019-08-22 19:24:22', 'feng_lq', null, '23050012', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cb912b3e624e8', 'shi_xh', '01030120', '2019-08-22 19:25:06', 'feng_lq', null, '999999997', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cb913225224ec', 'ma_hy', '01030120', '2019-08-22 19:25:35', 'feng_lq', null, '999999998', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cb913d0d824f1', 'ma_ly', '01030120', '2019-08-22 19:26:19', 'feng_lq', null, '999999999', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cb91416cd24f5', 'wang_hy', '01030120', '2019-08-22 19:26:37', 'feng_lq', null, '1000000000', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cc6ddc6463226', 'ren_lx', '01030120', '2019-08-25 11:41:59', 'feng_lq', null, '8200018', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cc6f0760f3230', 'fan_h', '01030120', '2019-08-25 12:02:23', 'feng_lq', null, '8200019', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb207fe73679', 'huang_bx', '01030120', '2019-08-26 07:33:20', 'feng_lq', null, '24110024', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb20e7dc367d', 'wang_df', '01030120', '2019-08-26 07:33:47', 'feng_lq', null, '24110025', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb2146213681', 'wang_f', '01030120', '2019-08-26 07:34:11', 'feng_lq', null, '24110026', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb21c86a3685', 'zhang_jb', '01030120', '2019-08-26 07:34:45', 'feng_lq', null, '24110027', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb223762368c', 'chang_yx', '01030120', '2019-08-26 07:35:13', 'feng_lq', null, '24110028', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb229b423690', 'kong_sw', '01030120', '2019-08-26 07:35:38', 'feng_lq', null, '24110029', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb230a883694', 'ma_s', '01030120', '2019-08-26 07:36:07', 'feng_lq', null, '24110030', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb2371173698', 'yuan_jf', '01030120', '2019-08-26 07:36:33', 'feng_lq', null, '24110031', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb23cb09369c', 'tian_f', '01030120', '2019-08-26 07:36:56', 'feng_lq', null, '24110032', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb241e4636a0', 'wang_zw', '01030120', '2019-08-26 07:37:18', 'feng_lq', null, '24110033', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb24753b36a4', 'cheng_xx', '01030120', '2019-08-26 07:37:40', 'feng_lq', null, '24110034', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb24c9ef36a8', 'chu_yb', '01030120', '2019-08-26 07:38:02', 'feng_lq', null, '24110035', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb25e30a36ac', 'xin_mj', '01030120', '2019-08-26 07:39:13', 'feng_lq', null, '8200020', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb29ce6136b3', 'chu_fm', '01030120', '2019-08-26 07:43:30', 'feng_lq', null, '24110035', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb2a36a436b7', 'li_hy', '01030120', '2019-08-26 07:43:57', 'feng_lq', null, '24110036', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb2a9bbd36bb', 'mao_jw', '01030120', '2019-08-26 07:44:23', 'feng_lq', null, '24110037', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccb2cd26636c0', 'yang_yq', '01030120', '2019-08-26 07:46:48', 'feng_lq', null, '24110038', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cccdfc77e3768', 'wang_sq', '01030120', '2019-08-26 15:41:53', 'feng_lq', null, '2013', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccce95c893783', 'tian_jt', '01030120', '2019-08-26 15:52:21', 'feng_lq', null, '6110004', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016ccce9e2993787', 'liu_el', '01030120', '2019-08-26 15:52:56', 'feng_lq', null, '6110005', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cd6c55bec412a', 'ma_j', '010102', '2019-08-28 13:49:14', 'admin', null, '1011', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cd6c5d530412e', 'lu_qx', '010106', '2019-10-22 13:50:51', 'admin', null, '1', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cd74fed97415d', 'zhao_wj', '01030120', '2019-08-28 16:20:35', 'feng_lq', null, '8200023', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cdb33006945d1', 'tang_gx', '01030120', '2019-08-29 10:27:28', 'feng_lq', null, '1000000001', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cdb33441d45d5', 'zhu_gl', '01030120', '2019-08-29 10:27:46', 'feng_lq', null, '1000000002', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6c8f6e52016cdb3394cb45d9', 'cheng_dy', '01030120', '2019-08-29 10:28:06', 'feng_lq', null, '1000000003', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cdb8536016cdb973a5f000a', 'cao_ym', '01030120', '2019-08-29 12:16:56', 'feng_lq', null, '2014', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cdc009d016ce5162acf0952', 'zheng_k', '01030120', '2019-08-31 08:32:11', 'feng_lq', null, '3180005', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d0955154e17d4', 'wu_d', '01030120', '2019-09-07 09:27:14', 'feng_lq', null, '24110039', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d0956077817d8', 'xu_ks', '01030120', '2019-09-07 09:28:16', 'feng_lq', null, '24110040', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d0956532717dc', 'wang_qj', '01030120', '2019-09-07 09:28:35', 'feng_lq', null, '24110041', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d0956a9af17e0', 'wang_yj', '01030120', '2019-09-07 09:28:57', 'feng_lq', null, '24110042', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d09575c2c17e4', 'jin_bj', '01030120', '2019-09-07 09:29:43', 'feng_lq', null, '24110043', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f0686d62be0', 'cai_sj', '01030120', '2019-09-11 14:33:04', 'feng_lq', null, '1000000005', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f06fa212be4', 'fan_y', '01030120', '2019-09-11 14:33:34', 'feng_lq', null, '1000000006', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f075e402be8', 'li_wd', '01030120', '2019-09-11 14:33:59', 'feng_lq', null, '1000000007', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f07b7672bec', 'lu_wh', '01030120', '2019-09-11 14:34:22', 'feng_lq', null, '1000000008', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f303d3d2bfa', '1241', '01030120', '2019-09-11 15:18:38', 'feng_lq', null, '24110044', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f307cbc2bfe', '4213', '01030120', '2019-09-11 15:18:54', 'feng_lq', null, '24110045', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f30c2052c02', '43214', '01030120', '2019-09-11 15:19:12', 'feng_lq', null, '24110046', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f3101842c06', '4324', '01030120', '2019-09-11 15:19:28', 'feng_lq', null, '24110047', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f3143f02c0a', '3123', '01030120', '2019-09-11 15:19:45', 'feng_lq', null, '24110048', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d1f3185c02c0e', '423421', '01030120', '2019-09-11 15:20:02', 'feng_lq', null, '24110049', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d345d2b043f9d', '312321', '01030120', '2019-09-15 17:59:44', 'feng_lq', null, '1000000009', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d345d6e5a3fa2', '312312', '01030120', '2019-09-15 18:00:01', 'feng_lq', null, '1000000010', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d345db1c03fa6', '432134', '01030120', '2019-09-15 18:00:19', 'feng_lq', null, '1000000011', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d345df7a53faa', '5431', '01030120', '2019-09-15 18:00:36', 'feng_lq', null, '1000000012', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d345e30ed3fae', '4134', '01030120', '2019-09-15 18:00:51', 'feng_lq', null, '1000000013', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016d345e754c3fb4', '3124', '01030120', '2019-09-15 18:01:09', 'feng_lq', null, '1000000014', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6cf01ba3016db366754539c7', 'liu_yz', '01030120', '2019-10-10 10:01:39', 'cao_zc', null, '2015', null);
INSERT INTO `gx_sys_user_in_org` VALUES ('8a80808c6dc9375c016dca3553fe00ab', 'chenc', '01030120', '2019-10-14 20:19:15', 'gao_pp', null, '1060003', null);

-- ----------------------------
-- Table structure for gx_sys_user_org_role
-- ----------------------------
DROP TABLE IF EXISTS `gx_sys_user_org_role`;
CREATE TABLE `gx_sys_user_org_role` (
  `row_id` varchar(255) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `role_intro` varchar(255) DEFAULT NULL COMMENT '角色说明',
  `create_time` datetime DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `data_order` bigint(20) DEFAULT NULL,
  `role_type` varchar(255) DEFAULT NULL COMMENT '0/人 1/部门 2/职称',
  `ext` varchar(255) DEFAULT NULL,
  `ext2` date DEFAULT NULL,
  `ext3` datetime DEFAULT NULL,
  `ext4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gx_sys_user_org_role
-- ----------------------------
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21315016fa213bea90000', '裴顺鑫', 'pei_sx', '', '2020-01-14 11:23:21', null, '4', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21895120001', '金明', 'jin_m', '', '2020-01-14 11:28:38', null, '8', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa2190dc00002', '王霆', 'wang_t', '', '2020-01-14 11:29:08', null, '3', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21992310003', '陈志宁', 'chen_zn', '', '2020-01-14 11:29:42', null, '1', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa219c0030004', '王长宁', 'wang_cn', '', '2020-01-14 11:29:54', null, '2', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21b28980005', '李慧', 'li_h', '', '2020-01-14 11:31:26', null, '5', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21b59fd0006', '郁犁', 'yu_l', '', '2020-01-14 11:31:39', null, '6', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21b87840007', '黎庆', 'li_q', '', '2020-01-14 11:31:51', null, '7', '0', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21c13570008', '办公室', '010101', '', '2020-01-14 11:32:26', null, '21', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21c42090009', '计材处', '010102', '', '2020-01-14 11:32:38', null, '22', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21c6f27000a', '合约处', '010103', '', '2020-01-14 11:32:50', null, '23', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21d5e0f000c', '用地处', '010104', '', '2020-01-14 11:33:51', null, '24', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21d9e24000d', '总工办', '010105', '', '2020-01-14 11:34:08', null, '25', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21dfff3000e', '质安处', '010106', '', '2020-01-14 11:34:33', null, '26', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21e4076000f', '车站处', '010107', '', '2020-01-14 11:34:49', null, '27', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21e75cf0010', '车辆处', '010108', '', '2020-01-14 11:35:03', null, '28', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21ea42a0011', '通号处', '010109', '', '2020-01-14 11:35:15', null, '29', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('2c948a826fa21531016fa21eddc80012', '财务处', '010110', '', '2020-01-14 11:35:29', null, '30', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf7532d0002', '1号线', '010111', '', '2020-01-19 16:42:03', null, '31', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf785550003', '2号线', '010112', '', '2020-01-19 16:42:16', null, '32', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf7dd350004', '5号线', '010113', '', '2020-01-19 16:42:38', null, '33', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf7f4fb0005', '6号线', '10114', '', '2020-01-19 16:42:44', null, '34', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf802450006', '7号线', '010115', '', '2020-01-19 16:42:48', null, '35', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf810bd0007', '宁句线', '010116', '', '2020-01-19 16:42:51', null, '36', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf81e9f0008', '4号线', '010117', '', '2020-01-19 16:42:55', null, '37', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf82ba90009', '10号线', '010118', '', '2020-01-19 16:42:58', null, '38', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf91337000a', '领导班子', '010119', '', '2020-01-19 16:43:58', null, '39', '1', null, null, null, null);
INSERT INTO `gx_sys_user_org_role` VALUES ('8a80800a6fbcc689016fbcf9257c000b', '监察室', '010120', '', '2020-01-19 16:44:02', null, '40', '1', null, null, null, null);

-- ----------------------------
-- Table structure for meeting_arrangement
-- ----------------------------
DROP TABLE IF EXISTS `meeting_arrangement`;
CREATE TABLE `meeting_arrangement` (
  `row_id` varchar(120) NOT NULL COMMENT '主键',
  `title` varchar(120) DEFAULT NULL COMMENT '内容',
  `apply_date` datetime DEFAULT NULL,
  `period` varchar(120) DEFAULT NULL COMMENT '周期',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `meeting_room_id` varchar(120) DEFAULT NULL COMMENT '会议室id',
  `meeting_room_name` varchar(120) DEFAULT NULL COMMENT '会议室地址',
  `remark` varchar(120) DEFAULT NULL COMMENT '备注',
  `use_org_id` varchar(120) DEFAULT NULL COMMENT '部门',
  `use_org_name` varchar(120) DEFAULT NULL COMMENT '部门id',
  `is_send` varchar(255) DEFAULT NULL COMMENT '是否发出',
  `is_back` varchar(255) DEFAULT NULL COMMENT '是否办结',
  `call_leader_id` varchar(120) DEFAULT NULL COMMENT '召集领导id',
  `call_leader_name` varchar(120) DEFAULT NULL COMMENT '召集领导',
  `call_users_id` varchar(255) DEFAULT NULL COMMENT '会议参加人员',
  `call_users_name` varchar(255) DEFAULT NULL COMMENT '召集人员',
  `call_orgs_id` varchar(255) DEFAULT NULL COMMENT '召集组织',
  `call_orgs_name` varchar(255) DEFAULT NULL COMMENT '召集组织',
  `create_user_id` varchar(120) DEFAULT NULL COMMENT '填报人',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '承办人',
  `create_org_id` varchar(255) DEFAULT NULL COMMENT '承办组织',
  `create_org_name` varchar(255) DEFAULT NULL COMMENT '承办组织',
  `year` varchar(120) DEFAULT NULL COMMENT '年',
  `day_of_week` varchar(255) DEFAULT NULL COMMENT '星期几',
  `week` varchar(255) DEFAULT NULL COMMENT '第几周',
  `ext` date DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL COMMENT '1显示 非1微信显示',
  `ext3` varchar(255) DEFAULT NULL COMMENT 'open_id',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_arrangement
-- ----------------------------
INSERT INTO `meeting_arrangement` VALUES ('8a80800a6fad9991016fada37e230001', '到省自然资源厅沟通用地报批工作', null, null, '2020-01-13 09:00:00', '2020-01-13 11:30:00', null, '省自然资源厅', null, null, '建设用地管理处', null, null, null, '王长宁', null, '建设用地管理处,市规划资源局,管理员', null, null, null, null, null, null, '2020', '星期一', '3', null, '1', null);
INSERT INTO `meeting_arrangement` VALUES ('8a80800a6fad9991016fada508fe0003', '集团领导一周工作例会', null, null, '2020-01-13 10:30:00', '2020-01-13 11:30:00', null, '2408室', null, null, '集团办公室', null, null, null, '佘才高', null, '集团领导,办公室,管理员', null, null, null, null, null, null, '2020', '星期一', '3', null, '1', null);
INSERT INTO `meeting_arrangement` VALUES ('8a80800a6fad9991016fadade9080006', '安全生产节前检查', null, null, '2020-01-14 09:00:00', '2020-01-17 17:30:00', null, '现场', null, null, '质量安全处', null, null, null, '郁犁', null, '详见通知,管理员', null, null, null, null, null, null, '2020', '星期二', '3', null, '1', null);
INSERT INTO `meeting_arrangement` VALUES ('8a80800a6fad9991016fadafff540009', '10号线二期概算拆分研究', null, null, '2020-01-14 10:30:00', '2020-01-15 11:30:00', null, '4B会议室', null, null, '合约预算处', null, null, null, '金明', null, '合约预算处,省交咨询公司,管理员', null, null, null, null, null, null, '2020', '星期二', '3', null, '1', null);

-- ----------------------------
-- Table structure for meetroom_use
-- ----------------------------
DROP TABLE IF EXISTS `meetroom_use`;
CREATE TABLE `meetroom_use` (
  `row_id` varchar(255) NOT NULL,
  `index_id` varchar(255) DEFAULT NULL,
  `meeting_room_id` varchar(255) DEFAULT NULL,
  `meeting_room_name` varchar(255) DEFAULT NULL,
  `monday` varchar(255) DEFAULT NULL,
  `tuesday` varchar(255) DEFAULT NULL,
  `wednesday` varchar(255) DEFAULT NULL,
  `thursday` varchar(255) DEFAULT NULL,
  `friday` varchar(255) DEFAULT NULL,
  `saturday` varchar(255) DEFAULT NULL,
  `sunday` varchar(255) DEFAULT NULL,
  `morning` varchar(255) DEFAULT NULL,
  `afternoon` varchar(255) DEFAULT NULL,
  `meeting_room_status` varchar(255) DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `data_status` varchar(255) DEFAULT NULL,
  `data_order` varchar(255) DEFAULT NULL,
  `data_deleted` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetroom_use
-- ----------------------------
INSERT INTO `meetroom_use` VALUES ('8a80800a6fad9991016fada37df20000', '8a80800a6f555b96016f555c80140002', null, '省自然资源厅', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fad9991016fada508ee0002', '8a80800a6f555b96016f555c80140002', null, '2408室', '0', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fad9991016fadade7b00004', '8a80800a6f555b96016f555c80140002', null, '现场', null, '1', '1', '1', '1', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fad9991016fadade7d80005', '8a80800a6f555b96016f555c80140002', null, '现场', null, '1', '1', '1', '1', null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fad9991016fadaffeea0007', '8a80800a6f555b96016f555c80140002', null, '4B会议室', null, '1', '1', null, null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fad9991016fadafff0f0008', '8a80800a6f555b96016f555c80140002', null, '4B会议室', null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fb1323d016fb132b2210000', '8a80800a6f555b96016f555c80140002', null, '1', null, null, null, null, '0', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fb1323d016fb13514d90002', '8a80800a6f555b96016f555c80140002', null, '4楼会议室A', null, null, null, null, '0', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fb1323d016fb1356a060004', '8a80800a6f555b96016f555c80140002', null, '4楼会议室B', null, null, null, null, '0', null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fb14f70016fb15437ad0000', '8a80800a6f555b96016f555c80140002', null, '4楼会议室A', null, null, null, null, '0', null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fb24e80016fb25995dc0000', '8a80800a6f555b96016f555c80140002', null, '2408室111', '0', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80800a6fb261df016fb267e47d0000', '8a80800a6f555b96016f555c80140002', null, '1', null, null, null, null, '0', null, '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80808d6fad9a36016fada0897c0004', '8a80800a6f414f65016f414fe1a80002', null, '所街208室', '1', null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80808d6fb1812e016fb2347c500000', '8a80800a6f555b96016f555c80140002', null, '4楼会议室B', null, '0', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `meetroom_use` VALUES ('8a80808d6fb1812e016fb235376b0002', '8a80800a6f555b96016f555c80140002', null, '4楼会议室B明', null, '0', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);

-- ----------------------------
-- View structure for v_org_role_user
-- ----------------------------
DROP VIEW IF EXISTS `v_org_role_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`njdtweb`@`%`  VIEW `v_org_role_user` AS SELECT
	concat(
		`r`.`role_id`,
		`u`.`user_id`
	) AS `v_role_user_key`,
	`u`.`row_id` AS `user_key`,
	`u`.`user_name` AS `user_name`,
	`u`.`user_show_name` AS `user_show_name`,
	`u`.`user_en_name` AS `user_en_name`,
	`u`.`user_id` AS `user_id`,
	`u`.`create_time` AS `create_time`,
	`u`.`create_user_id` AS `create_user_id`,
	`u`.`data_status` AS `data_status`,
	`u`.`data_order` AS `data_order`,
	`u`.`user_mobile_num` AS `user_mobile_num`,
	`u`.`user_sex` AS `user_sex`,
	`u`.`user_type` AS `user_type`,
	`r`.`row_id` AS `role_key`,
	`r`.`role_name` AS `role_name`,
	`r`.`role_id` AS `role_id`,
	`r`.`role_intro` AS `role_intro`,
	`r`.`create_time` AS `r_create_time`,
	`r`.`create_user_id` AS `r_create_user_id`,
	`r`.`data_order` AS `r_data_order`,
	`r`.`role_type` AS `role_type`,
	`ru`.`rl_type` AS `rl_type`,
	`ru`.`row_id` AS `rhu_id`
FROM
	(
		(
			`gx_sys_user_org_role` `r`
			JOIN `gx_sys_user` `u`
		)
		JOIN `gx_sys_org_role_has_user` `ru`
	)
WHERE
	(
		(
			`r`.`role_id` = `ru`.`role_id`
		)
		AND (
			`u`.`user_id` = `ru`.`user_id`
		)
	) ;

-- ----------------------------
-- View structure for v_role_user
-- ----------------------------
DROP VIEW IF EXISTS `v_role_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`njdtweb`@`%`  VIEW `v_role_user` AS select concat(`r`.`role_id`,`u`.`user_id`) AS `v_role_user_key`,`u`.`row_id` AS `user_key`,`u`.`user_name` AS `user_name`,`u`.`user_show_name` AS `user_show_name`,`u`.`user_en_name` AS `user_en_name`,`u`.`user_id` AS `user_id`,`u`.`create_time` AS `create_time`,`u`.`create_user_id` AS `create_user_id`,`u`.`modify_time` AS `modify_time`,`u`.`modify_user_id` AS `modify_user_id`,`u`.`data_status` AS `data_status`,`u`.`data_order` AS `data_order`,`u`.`user_mobile_num` AS `user_mobile_num`,`u`.`user_sex` AS `user_sex`,`u`.`user_type` AS `user_type`,`r`.`row_id` AS `role_key`,`r`.`role_name` AS `role_name`,`r`.`role_id` AS `role_id`,`r`.`role_intro` AS `role_intro`,`r`.`create_time` AS `r_create_time`,`r`.`create_user_id` AS `r_create_user_id`,`r`.`modify_time` AS `r_modify_time`,`r`.`modify_user_id` AS `r_modify_user_id`,`r`.`data_status` AS `r_data_status`,`r`.`data_order` AS `r_data_order`,`r`.`parent_role_id` AS `parent_role_id`,`r`.`parent_role_name` AS `parent_role_name`,`r`.`role_type` AS `role_type`,`ru`.`rl_type` AS `rl_type`,`ru`.`row_id` AS `rhu_id` from ((`gx_sys_role` `r` join `gx_sys_user` `u`) join `gx_sys_role_has_user` `ru`) where ((`r`.`role_id` = `ru`.`role_id`) and (`u`.`user_id` = `ru`.`user_id`)) ;

-- ----------------------------
-- View structure for v_sys_dic
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_dic`;
CREATE ALGORITHM=UNDEFINED DEFINER=`njdtweb`@`%`  VIEW `v_sys_dic` AS SELECT
	concat(
		`d`.`ROW_ID`,
		'_',
		`i`.`ROW_ID`
	) AS `v_sys_dic_key`,
	`i`.`DIC_FUNCTION_NAME` AS `index_dic_name`,
	`i`.`DIC_FUNCTION_ID` AS `index_dic_id`,
	`i`.`DIC_FUNCTION_DEC` AS `index_dic_desc`,
	`d`.`DIC_NAME` AS `record_dic_name`,
	`d`.`DIC_ID` AS `record_dic_id`,
	`d`.`DIC_SHOW_VAL` AS `DIC_SHOW_VAL`,
	`d`.`DIC_VALUE` AS `DIC_VALUE`,
	`d`.`DIC_TYPE` AS `DIC_TYPE`,
	`d`.`ORDER_NUM` AS `ORDER_NUM`,
	`d`.`max_status` AS `max_status`,
	`d`.`max_id` AS `max_id`
FROM
	(
		`gx_sys_dic_index` `i`
		JOIN `gx_sys_dic_record` `d`
	)
WHERE
	(
		`i`.`ROW_ID` = `d`.`TABLE_ID`
	) ;

-- ----------------------------
-- View structure for v_user
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`njdtweb`@`%`  VIEW `v_user` AS SELECT
	concat(`o`.`row_id`, `u`.`user_id`) AS `v_user_key`,
	`o`.`org_name` AS `org_name`,
	`o`.`parent_org_id` AS `p_org_id`,
	`o`.`parent_org_name` AS `p_org_name`,
	`o`.`org_type` AS `org_type`,
	`o`.`row_id` AS `org_id`,
	`u`.`user_name` AS `user_name`,
	`u`.`user_en_name` AS `user_password`,
	`u`.`user_id` AS `user_id`,
	`u`.`user_type` AS `user_type`,
	`u`.`user_mobile_num` AS `user_mobile_num`,
	`u`.`data_status` AS `user_status`,
	`u`.`sys_color_id` AS `sys_color_id`,
	`u`.`user_card_id` AS `user_card_id`,
	`o`.`org_com_id` AS `com_org_id`,
	`o`.`org_bd_id` AS `com_bd_id`,
	`uio`.`data_order` AS `data_order`,
	uio.row_id as uio_row_id,
	u.row_id AS user_row_id,
u.client_id AS client_id
FROM
	(
		(
			`gx_sys_org` `o`
			JOIN `gx_sys_user` `u`
		)
		JOIN `gx_sys_user_in_org` `uio`
	)
WHERE
	(
		(
			`o`.`row_id` = `uio`.`org_id`
		)
		AND (
			`u`.`user_id` = `uio`.`user_id`
		)
	)
ORDER BY
	`uio`.`data_order` ;

-- ----------------------------
-- View structure for w_vo
-- ----------------------------
DROP VIEW IF EXISTS `w_vo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`njdtweb`@`%` SQL SECURITY DEFINER  VIEW `w_vo` AS SELECT
	meeting_arrangement.row_id,
	meeting_arrangement.start_time,
	meeting_arrangement.apply_date,
	meeting_arrangement.call_leader_name,
	meeting_arrangement.call_orgs_name,
	meeting_arrangement.end_time,
	file_record.file_name,
	meeting_arrangement.meeting_room_name,
	meeting_arrangement.call_users_name,
	meeting_arrangement.title
FROM
	meeting_arrangement
LEFT JOIN file_record ON meeting_arrangement.row_id = file_record.arrangement_id ;
