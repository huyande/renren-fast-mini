/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : homework

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 20/03/2023 17:33:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E910B5CA07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'huyande1679303366914', 1679304825015, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1643111160000, -1, 5, 'PAUSED', 'CRON', 1643111159000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E910B5CA07874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/1 * * * ?', 1, '参数测试', '2022-01-25 19:42:28');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 2, '2022-01-25 20:00:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 2, '2022-01-25 20:30:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 9, '2022-01-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 5, '2022-01-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 2, '2022-01-26 12:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 2, '2022-01-26 12:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 13:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 13:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 2, '2022-01-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 15, '2022-01-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2022-01-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 2, '2022-01-26 22:30:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 6, '2022-02-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 2, '2022-02-06 14:30:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 10, '2022-02-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 12, '2022-02-09 10:00:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 2, '2022-02-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 0, '2022-02-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2022-02-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 0, '2022-02-25 11:30:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 2, '2022-02-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 2, '2022-02-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 3, '2022-02-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2022-02-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 1, '2022-07-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 2, '2022-07-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 2, '2022-07-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 1, '2022-07-03 15:00:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2022-07-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 1, '2022-07-03 16:00:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2022-07-03 16:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2022-07-03 17:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2022-07-03 21:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 2, '2022-07-03 22:00:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 6, '2022-07-03 22:30:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2022-10-23 20:30:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 3, '2022-10-23 21:30:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2022-10-23 22:00:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 1, '2022-10-23 22:30:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 0, '2022-10-23 23:00:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2022-10-23 23:04:52');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 0, '2022-10-23 23:05:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2022-10-23 23:06:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
BEGIN;
INSERT INTO `sys_captcha` VALUES ('6a6fab68-2746-4871-89d7-96dfe5631809', 'ndemd', '2022-01-25 20:42:50');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` text COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
INSERT INTO `sys_config` VALUES (3, 'autojs_template', '/**\n * 自动化脚本模版js\n */\n /**\n *读取文件 将main_js进行替换 \n **/\n{{main_js}}\n\n/**\n *  开始执行\n * @param {*} callback\n * @param {*} op_app\n */\nfunction start(callback,op_app){\n    if(op_app){\n        toast(\'开始执行\')\n        vibrate(300)\n        sleep(1000)\n        launchApp(op_app);\n        sleep(3000)\n        callback()\n        toast(\'执行完成\')\n        vibrate(300)\n    }else{\n        confirm(\'脚本错误,未填写执行的app\' + \'!\')\n    }\n}\n\n/**\n * 到程序首页\n */\nfunction goHome(_text){\n    while(!textContains(_text).exists()){\n        back()\n        sleep(2000)\n    }\n    sleep(3000)\n}\n/**\n * 返回次数\n * @param {*} step\n */\nfunction backStep(step){\n    if(!step){\n        step =1\n    }\n    for(let i=0;i<step;i++){\n        back()\n        sleep(1000)\n    }\n}\n\n/**\n * 设备振动\n * @param {} duration\n */\nfunction vibrate(duration){\n    device.vibrate(duration);\n}\n\nfunction setLogs(text){\n    events.broadcast.emit(\'logs\', text);\n}', 1, '自动化脚本模版');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"zhangsan\",\"password\":\"f99a01433d6c3103bf80a3854dcad6b04e4f7e69aa6dada8b0a6d007691f2eb8\",\"salt\":\"uus9vOndPZuyg3vhvuyQ\",\"email\":\"zhangsan@163.com\",\"mobile\":\"18195556602\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Jan 25, 2022 8:06:31 PM\"}]', 337, '0:0:0:0:0:0:0:1', '2022-01-25 20:06:31');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"职员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[6,7,8,9,10,11,12,13,14,-666666,1],\"createTime\":\"Jan 25, 2022 8:37:10 PM\"}]', 162, '0:0:0:0:0:0:0:1', '2022-01-25 20:37:11');
INSERT INTO `sys_log` VALUES (3, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"zhangsan\",\"salt\":\"uus9vOndPZuyg3vhvuyQ\",\"email\":\"zhangsan@163.com\",\"mobile\":\"18195556602\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 37, '0:0:0:0:0:0:0:1', '2022-01-25 20:37:20');
INSERT INTO `sys_log` VALUES (4, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[[1]]', 30, '0:0:0:0:0:0:0:1', '2022-10-23 23:03:41');
INSERT INTO `sys_log` VALUES (5, 'admin', '修改定时任务', 'io.renren.modules.job.controller.ScheduleJobController.update()', '[{\"jobId\":1,\"beanName\":\"testTask\",\"params\":\"renren\",\"cronExpression\":\"0 0/1 * * * ?\",\"status\":0,\"remark\":\"参数测试\"}]', 94, '0:0:0:0:0:0:0:1', '2022-10-23 23:04:08');
INSERT INTO `sys_log` VALUES (6, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[1]]', 20, '0:0:0:0:0:0:0:1', '2022-10-23 23:04:52');
INSERT INTO `sys_log` VALUES (7, 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[[1]]', 8, '0:0:0:0:0:0:0:1', '2022-10-23 23:06:08');
INSERT INTO `sys_log` VALUES (8, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"自动化运营\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"daohang\",\"orderNum\":0,\"list\":[]}]', 36, '0:0:0:0:0:0:0:1', '2022-10-27 17:14:44');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"脚本管理\",\"url\":\"xmkj/script/list\",\"perms\":\"xmkj:script:list,xmkj:script:info,xmkj:script:save,xmkj:script:update,xmkj:script:delete\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2022-10-27 17:18:47');
INSERT INTO `sys_log` VALUES (10, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"脚本管理\",\"url\":\"xmkj/script\",\"perms\":\"xmkj:script:list,xmkj:script:info,xmkj:script:save,xmkj:script:update,xmkj:script:delete\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]', 16, '0:0:0:0:0:0:0:1', '2022-10-27 17:19:45');
INSERT INTO `sys_log` VALUES (11, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1,\"list\":[]}]', 3, '0:0:0:0:0:0:0:1', '2022-10-27 17:20:24');
INSERT INTO `sys_log` VALUES (12, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":0,\"list\":[]}]', 3, '0:0:0:0:0:0:0:1', '2022-10-27 17:20:34');
INSERT INTO `sys_log` VALUES (13, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"自动化运营\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"daohang\",\"orderNum\":1,\"list\":[]}]', 3, '0:0:0:0:0:0:0:1', '2022-10-27 17:20:38');
INSERT INTO `sys_log` VALUES (14, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"微信号\",\"url\":\"xmkj/wechatnumbers\",\"perms\":\"xmkj:wechatnumbers:list\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1,\"list\":[]}]', 99, '0:0:0:0:0:0:0:1', '2022-10-28 11:27:57');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"自动化运营\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"daohang\",\"orderNum\":0,\"list\":[]}]', 7, '0:0:0:0:0:0:0:1', '2022-10-28 13:15:05');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1,\"list\":[]}]', 5, '0:0:0:0:0:0:0:1', '2022-10-28 13:15:09');
INSERT INTO `sys_log` VALUES (17, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":2,\"paramKey\":\"autojs\",\"paramValue\":\"/**  * 自动化脚本模版js  */  /**  *读取文件 将main_js进行替换   **/ {{main_js}}  /**  *  开始执行  * @param {*} callback  * @param {*} op_app  */ function start(callback,op_app){     if(op_app){         toast(\\u0027开始执行\\u0027)         vibrate(300)         sleep(1000)         launchApp(op_app);         sleep(3000)         callback()         toast(\\u0027执行完成\\u0027)         vibrate(300)     }else{         confirm(\\u0027脚本错误,未填写执行的app\\u0027 + \\u0027!\\u0027)     } }  /**  * 到程序首页  */ function goHome(_text){     while(!textContains(_text).exists()){         back()         sleep(2000)     }     sleep(3000) } /**  * 返回次数  * @param {*} step  */ function backStep(step){     if(!step){         step \\u003d1     }     for(let i\\u003d0;i\\u003cstep;i++){         back()         sleep(1000)     } }  /**  * 设备振动  * @param {} duration  */ function vibrate(duration){     device.vibrate(duration); }  function setLogs(text){     events.broadcast.emit(\\u0027logs\\u0027, text); }\",\"remark\":\"自动化脚本模版\"}]', 82, '0:0:0:0:0:0:0:1', '2022-10-30 20:45:08');
INSERT INTO `sys_log` VALUES (18, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[2]]', 27, '0:0:0:0:0:0:0:1', '2022-10-30 21:25:17');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":3,\"paramKey\":\"autojs_template\",\"paramValue\":\"/**  * 自动化脚本模版js  */  /**  *读取文件 将main_js进行替换   **/ {{main_js}}  /**  *  开始执行  * @param {*} callback  * @param {*} op_app  */ function start(callback,op_app){     if(op_app){         toast(\\u0027开始执行\\u0027)         vibrate(300)         sleep(1000)         launchApp(op_app);         sleep(3000)         callback()         toast(\\u0027执行完成\\u0027)         vibrate(300)     }else{         confirm(\\u0027脚本错误,未填写执行的app\\u0027 + \\u0027!\\u0027)     } }  /**  * 到程序首页  */ function goHome(_text){     while(!textContains(_text).exists()){         back()         sleep(2000)     }     sleep(3000) } /**  * 返回次数  * @param {*} step  */ function backStep(step){     if(!step){         step \\u003d1     }     for(let i\\u003d0;i\\u003cstep;i++){         back()         sleep(1000)     } }  /**  * 设备振动  * @param {} duration  */ function vibrate(duration){     device.vibrate(duration); }  function setLogs(text){     events.broadcast.emit(\\u0027logs\\u0027, text); }\",\"remark\":\"自动化脚本模版\"}]', 144, '0:0:0:0:0:0:0:1', '2022-10-30 21:33:02');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改配置', 'io.renren.modules.sys.controller.SysConfigController.update()', '[{\"id\":3,\"paramKey\":\"autojs_template\",\"paramValue\":\"/**\\n * 自动化脚本模版js\\n */\\n /**\\n *读取文件 将main_js进行替换 \\n **/\\n{{main_js}}\\n\\n/**\\n *  开始执行\\n * @param {*} callback\\n * @param {*} op_app\\n */\\nfunction start(callback,op_app){\\n    if(op_app){\\n        toast(\\u0027开始执行\\u0027)\\n        vibrate(300)\\n        sleep(1000)\\n        launchApp(op_app);\\n        sleep(3000)\\n        callback()\\n        toast(\\u0027执行完成\\u0027)\\n        vibrate(300)\\n    }else{\\n        confirm(\\u0027脚本错误,未填写执行的app\\u0027 + \\u0027!\\u0027)\\n    }\\n}\\n\\n/**\\n * 到程序首页\\n */\\nfunction goHome(_text){\\n    while(!textContains(_text).exists()){\\n        back()\\n        sleep(2000)\\n    }\\n    sleep(3000)\\n}\\n/**\\n * 返回次数\\n * @param {*} step\\n */\\nfunction backStep(step){\\n    if(!step){\\n        step \\u003d1\\n    }\\n    for(let i\\u003d0;i\\u003cstep;i++){\\n        back()\\n        sleep(1000)\\n    }\\n}\\n\\n/**\\n * 设备振动\\n * @param {} duration\\n */\\nfunction vibrate(duration){\\n    device.vibrate(duration);\\n}\\n\\nfunction setLogs(text){\\n    events.broadcast.emit(\\u0027logs\\u0027, text);\\n}\",\"remark\":\"自动化脚本模版\"}]', 148, '0:0:0:0:0:0:0:1', '2022-10-30 21:37:28');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"zhangsan\",\"password\":\"f99a01433d6c3103bf80a3854dcad6b04e4f7e69aa6dada8b0a6d007691f2eb8\",\"salt\":\"uus9vOndPZuyg3vhvuyQ\",\"email\":\"zhangsan@163.com\",\"mobile\":\"18195556602\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', 121, '0:0:0:0:0:0:0:1', '2022-11-24 15:59:05');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"zhangsan\",\"salt\":\"uus9vOndPZuyg3vhvuyQ\",\"email\":\"zhangsan@163.com\",\"mobile\":\"18195556602\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 11, '0:0:0:0:0:0:0:1', '2022-11-24 15:59:27');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"职员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[6,7,8,9,10,11,12,13,14,31,32,33,-666666,1]}]', 55, '0:0:0:0:0:0:0:1', '2022-11-24 15:59:46');
INSERT INTO `sys_log` VALUES (24, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":31,\"name\":\"任务\",\"url\":\"xmkj/yyzstask\",\"perms\":\"xmkj:yyzstask:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 13, '0:0:0:0:0:0:0:1', '2022-11-24 16:24:11');
INSERT INTO `sys_log` VALUES (25, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":31,\"name\":\"任务\",\"url\":\"xmkj/yyzstask\",\"perms\":\"xmkj:yyzstask:list,xmkj:yyzstask:info,xmkj:yyzstask:save,xmkj:yyzstask:update,xmkj:yyzstask:delete\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 8, '0:0:0:0:0:0:0:1', '2022-11-24 16:25:38');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '自动化运营', '', '', 0, 'daohang', 0);
INSERT INTO `sys_menu` VALUES (32, 31, '脚本管理', 'xmkj/script', 'xmkj:script:list,xmkj:script:info,xmkj:script:save,xmkj:script:update,xmkj:script:delete', 1, 'bianji', 0);
INSERT INTO `sys_menu` VALUES (33, 31, '微信号', 'xmkj/wechatnumbers', 'xmkj:wechatnumbers:list', 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (34, 31, '任务', 'xmkj/yyzstask', 'xmkj:yyzstask:list,xmkj:yyzstask:info,xmkj:yyzstask:save,xmkj:yyzstask:update,xmkj:yyzstask:delete', 1, 'log', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '职员', '', 1, '2022-01-25 20:37:11');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (12, 1, 6);
INSERT INTO `sys_role_menu` VALUES (13, 1, 7);
INSERT INTO `sys_role_menu` VALUES (14, 1, 8);
INSERT INTO `sys_role_menu` VALUES (15, 1, 9);
INSERT INTO `sys_role_menu` VALUES (16, 1, 10);
INSERT INTO `sys_role_menu` VALUES (17, 1, 11);
INSERT INTO `sys_role_menu` VALUES (18, 1, 12);
INSERT INTO `sys_role_menu` VALUES (19, 1, 13);
INSERT INTO `sys_role_menu` VALUES (20, 1, 14);
INSERT INTO `sys_role_menu` VALUES (21, 1, 31);
INSERT INTO `sys_role_menu` VALUES (22, 1, 32);
INSERT INTO `sys_role_menu` VALUES (23, 1, 33);
INSERT INTO `sys_role_menu` VALUES (24, 1, -666666);
INSERT INTO `sys_role_menu` VALUES (25, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'zhangsan', 'f99a01433d6c3103bf80a3854dcad6b04e4f7e69aa6dada8b0a6d007691f2eb8', 'uus9vOndPZuyg3vhvuyQ', 'zhangsan@163.com', '18195556602', 1, 1, '2022-01-25 20:06:31');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (2, 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` VALUES (1, '64e5f534953a112c5e788760a8955568', '2022-11-28 09:58:04', '2022-11-27 21:58:04');
INSERT INTO `sys_user_token` VALUES (2, 'b7f02e29922298c97b0425d91422dc59', '2022-11-25 03:59:20', '2022-11-24 15:59:20');
COMMIT;

-- ----------------------------
-- Table structure for tb_class
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '班级名称',
  `preset_number` int(11) DEFAULT NULL COMMENT '班级预设人数',
  `grade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年级',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '班级码',
  `status` int(11) DEFAULT '0' COMMENT '状态 0 正常 1 删除',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
BEGIN;
INSERT INTO `tb_class` VALUES (11, 'o5e4344weFj2xYYJCeQHieidizX0', '1232', 10, '小学', '157907', -1, '2023-02-25 23:00:27', '2023-03-11 16:23:05');
INSERT INTO `tb_class` VALUES (12, 'o5e4344weFj2xYYJCeQHieidizX0', '大萨达', 11, '小学', '389419', 0, '2023-03-11 16:56:58', '2023-03-15 19:52:01');
INSERT INTO `tb_class` VALUES (15, 'o5e4344weFj2xYYJCeQHieidizX0', '2222', 10, '小学', '164112', 0, '2023-03-18 19:59:59', '2023-03-18 19:59:59');
COMMIT;

-- ----------------------------
-- Table structure for tb_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT '班级id',
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'openid',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色 admin、teacher、student、committee（班委）',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_member
-- ----------------------------
BEGIN;
INSERT INTO `tb_member` VALUES (10, 11, 'o5e4344weFj2xYYJCeQHieidizX0', 'xxx', 'admin', NULL, '2023-02-25 23:00:27', '2023-02-25 23:00:27');
INSERT INTO `tb_member` VALUES (11, 12, 'o5e4344weFj2xYYJCeQHieidizX0', '大萨达1', 'admin', NULL, '2023-03-11 16:56:58', '2023-03-15 20:22:51');
INSERT INTO `tb_member` VALUES (12, 12, 'o5e4343WUe6CJnYJqGulGlka6t30', '张三', 'student', NULL, '2023-03-13 22:47:50', '2023-03-13 22:47:50');
INSERT INTO `tb_member` VALUES (15, 15, 'o5e4344weFj2xYYJCeQHieidizX0', 'dada', 'admin', '', '2023-03-18 19:59:59', '2023-03-18 19:59:59');
COMMIT;

-- ----------------------------
-- Table structure for tb_notify
-- ----------------------------
DROP TABLE IF EXISTS `tb_notify`;
CREATE TABLE `tb_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_urls` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件列表',
  `visibility` int(11) DEFAULT '0' COMMENT '班委是否可以批改作业 0 不可以 1可以',
  `cut_off_time` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_notify
-- ----------------------------
BEGIN;
INSERT INTO `tb_notify` VALUES (4, 'dasd', 'dsada', 12, 'o5e4344weFj2xYYJCeQHieidizX0', NULL, 0, NULL, '2023-03-19 23:36:12', '2023-03-19 23:36:12');
INSERT INTO `tb_notify` VALUES (5, 'dasd', 'sadas', 12, 'o5e4344weFj2xYYJCeQHieidizX0', NULL, 1, NULL, '2023-03-19 23:37:08', '2023-03-19 23:37:08');
INSERT INTO `tb_notify` VALUES (6, 'dsa', 'dsa', 12, 'o5e4344weFj2xYYJCeQHieidizX0', NULL, 1, '2023-01-01 00:00:00', '2023-03-19 23:39:00', '2023-03-19 23:39:00');
INSERT INTO `tb_notify` VALUES (7, 'dsa', 'dsa', 12, 'o5e4344weFj2xYYJCeQHieidizX0', NULL, 1, '2023-01-01 00:00:00', '2023-03-19 23:39:34', '2023-03-19 23:39:34');
INSERT INTO `tb_notify` VALUES (8, 'dsa', 'das', 12, 'o5e4344weFj2xYYJCeQHieidizX0', '[\"f350516b-fd34-4c32-b489-7c946f0b8cc2.png\"]', 1, '2023-01-01 00:00:00', '2023-03-19 23:40:10', '2023-03-19 23:40:10');
INSERT INTO `tb_notify` VALUES (9, '打算', '阿斯达', 12, 'o5e4344weFj2xYYJCeQHieidizX0', '[\"c91bbdbb-4f16-46fb-aa26-f7781f96f2fb.png\"]', 1, '2023-01-01 00:02:00', '2023-03-19 23:42:09', '2023-03-19 23:42:09');
COMMIT;

-- ----------------------------
-- Table structure for tb_notify_submit
-- ----------------------------
DROP TABLE IF EXISTS `tb_notify_submit`;
CREATE TABLE `tb_notify_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_id` int(11) DEFAULT NULL COMMENT '发布任务的主键',
  `m_id` int(11) NOT NULL COMMENT '成员表的主键',
  `c_id` int(11) DEFAULT NULL COMMENT '班级表的主键',
  `openid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '当提交类型是文本时 此字段有值',
  `img_urls` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当提交类型是图片时，此字段有值，此字段存储一个字符串数组',
  `content` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grading` int(11) DEFAULT '0' COMMENT '设置批阅 100、90、80、70、60、59（小于60分）',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_notify_submit
-- ----------------------------
BEGIN;
INSERT INTO `tb_notify_submit` VALUES (1, 9, 12, 12, 'o5e4343WUe6CJnYJqGulGlka6t30', '[\"d60ecb7d-e055-42bc-8a7e-7acb1e310c71.png\"]', 'dasdasdasda', 100, '111222', '2023-03-20 15:18:09', '2023-03-20 17:26:46');
COMMIT;

-- ----------------------------
-- Table structure for tb_script
-- ----------------------------
DROP TABLE IF EXISTS `tb_script`;
CREATE TABLE `tb_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '脚本名称',
  `params` varchar(500) DEFAULT NULL,
  `content` text COMMENT '脚本内容',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='自动化脚本';

-- ----------------------------
-- Records of tb_script
-- ----------------------------
BEGIN;
INSERT INTO `tb_script` VALUES (1, 'sss', '[{\"ss\":\"sss\"}]', 'start(main,\'微信\')\n\n/**\n * 主方法\n */\nfunction main(){\n    setLogs(\'开始执行\')\n    sleep(1000)\n    setLogs(\'打开企业微信\')\n    sleep(1000)\n}  ', '2022-10-27 17:43:51');
INSERT INTO `tb_script` VALUES (3, '视频号', '[{\"label\":\"滑动次数\",relpace:\"count\",val:5},{\"label\":\"时间间隔(单位s)\",relpace:\"time\",val:5000}]', 'start(main,\'微信\')\n\nfunction main(){\n    goHome(\'发现\')\n    click(\'发现\')\n    sleep(1000)\n    click(\'视频号\')\n    setLogs(\'点击视频号\')\n    sleep(1000)\n    swipeStep(5,5000)\n    sleep(5000)\n    backStep(1)\n}\n/**\n * 滑动次数与时间\n * @param {*} num \n * @param {*} time \n */\nfunction swipeStep(num,time){\n    for(let i=0;i<num;i++){\n        setLogs(\'滑动第\'+i+\'次\')\n        swipe(500, 1500, 500, 100, 500)\n        sleep(time)\n    }\n}', '2022-10-31 12:10:42');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

-- ----------------------------
-- Table structure for tb_wxuser
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxuser`;
CREATE TABLE `tb_wxuser` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_wxuser
-- ----------------------------
BEGIN;
INSERT INTO `tb_wxuser` VALUES (4, 'o5e4344weFj2xYYJCeQHieidizX0', 'c96453a3-e914-4fb2-b7be-34b3ee099e9e.jpeg', NULL);
INSERT INTO `tb_wxuser` VALUES (5, 'o5e4343WUe6CJnYJqGulGlka6t30', 'ee9b8d05-e8bd-4f9d-a2e8-fd6827e71680.jpeg', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
