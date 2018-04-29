/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : report

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-29 21:03:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dimension_browser
-- ----------------------------
DROP TABLE IF EXISTS `dimension_browser`;
CREATE TABLE `dimension_browser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `browser_name` varchar(45) NOT NULL DEFAULT '' COMMENT '浏览器名称',
  `browser_version` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='浏览器维度信息表';

-- ----------------------------
-- Records of dimension_browser
-- ----------------------------
INSERT INTO `dimension_browser` VALUES ('2', 'Chrome', '46.0.2490.71');
INSERT INTO `dimension_browser` VALUES ('3', 'Chrome', 'all');
INSERT INTO `dimension_browser` VALUES ('4', 'IE', '11.0');
INSERT INTO `dimension_browser` VALUES ('5', 'IE', 'all');
INSERT INTO `dimension_browser` VALUES ('6', 'IE', '10.0');
INSERT INTO `dimension_browser` VALUES ('7', 'IE', '9.0');
INSERT INTO `dimension_browser` VALUES ('8', 'Chrome', '45.0.125.2');
INSERT INTO `dimension_browser` VALUES ('9', 'Sogo', '11.0');
INSERT INTO `dimension_browser` VALUES ('10', 'Sogo', '10.0');
INSERT INTO `dimension_browser` VALUES ('11', 'Sogo', 'all');

-- ----------------------------
-- Table structure for dimension_currency_type
-- ----------------------------
DROP TABLE IF EXISTS `dimension_currency_type`;
CREATE TABLE `dimension_currency_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(10) DEFAULT NULL COMMENT '货币名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付货币类型维度信息表';

-- ----------------------------
-- Records of dimension_currency_type
-- ----------------------------
INSERT INTO `dimension_currency_type` VALUES ('1', 'RMB');
INSERT INTO `dimension_currency_type` VALUES ('2', 'all');

-- ----------------------------
-- Table structure for dimension_date
-- ----------------------------
DROP TABLE IF EXISTS `dimension_date`;
CREATE TABLE `dimension_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `calendar` date DEFAULT NULL,
  `type` enum('year','season','month','week','day') DEFAULT NULL COMMENT '日期格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='时间维度信息表';

-- ----------------------------
-- Records of dimension_date
-- ----------------------------
INSERT INTO `dimension_date` VALUES ('1', '2015', '4', '12', '50', '12', '2015-12-12', 'day');
INSERT INTO `dimension_date` VALUES ('2', '2015', '4', '12', '51', '13', '2015-12-13', 'day');
INSERT INTO `dimension_date` VALUES ('3', '2015', '4', '12', '51', '14', '2015-12-14', 'day');
INSERT INTO `dimension_date` VALUES ('4', '2015', '4', '12', '51', '15', '2015-12-15', 'day');
INSERT INTO `dimension_date` VALUES ('5', '2015', '4', '12', '50', '12', '2015-12-11', 'day');
INSERT INTO `dimension_date` VALUES ('6', '2015', '4', '12', '50', '8', '2015-12-08', 'day');
INSERT INTO `dimension_date` VALUES ('7', '2016', '1', '1', '2', '9', '2016-01-09', 'day');
INSERT INTO `dimension_date` VALUES ('8', '2016', '1', '1', '2', '10', '2016-01-10', 'day');

-- ----------------------------
-- Table structure for dimension_event
-- ----------------------------
DROP TABLE IF EXISTS `dimension_event`;
CREATE TABLE `dimension_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL COMMENT '事件种类category',
  `action` varchar(255) DEFAULT NULL COMMENT '事件action名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='事件维度信息表';

-- ----------------------------
-- Records of dimension_event
-- ----------------------------
INSERT INTO `dimension_event` VALUES ('1', '订单产生事件', '订单开始');
INSERT INTO `dimension_event` VALUES ('2', '订单产生事件', '添加购物车');
INSERT INTO `dimension_event` VALUES ('3', '订单产生事件', '确认订单信息');
INSERT INTO `dimension_event` VALUES ('4', '订单产生事件', '订单支付');

-- ----------------------------
-- Table structure for dimension_inbound
-- ----------------------------
DROP TABLE IF EXISTS `dimension_inbound`;
CREATE TABLE `dimension_inbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级外链id',
  `name` varchar(45) DEFAULT NULL COMMENT '外链名称',
  `url` varchar(255) DEFAULT NULL COMMENT '外链url',
  `type` int(11) DEFAULT NULL COMMENT '外链类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='外链源数据维度信息表';

-- ----------------------------
-- Records of dimension_inbound
-- ----------------------------
INSERT INTO `dimension_inbound` VALUES ('1', null, 'all', null, '1');
INSERT INTO `dimension_inbound` VALUES ('2', null, '其他外链', null, '1');
INSERT INTO `dimension_inbound` VALUES ('3', null, 'baidu', 'www.baidu.com', '0');
INSERT INTO `dimension_inbound` VALUES ('4', null, 'google', 'www.google.*', '0');
INSERT INTO `dimension_inbound` VALUES ('5', null, '搜狗', 'www.sogou.com', '0');
INSERT INTO `dimension_inbound` VALUES ('6', null, 'yahoo', '[\\w|.]+.yahoo.com', '0');
INSERT INTO `dimension_inbound` VALUES ('7', null, '搜搜', 'www.soso.com', '0');
INSERT INTO `dimension_inbound` VALUES ('8', null, '114', 'so.114.com.cn', '0');
INSERT INTO `dimension_inbound` VALUES ('9', null, '有道', 'www.youdao.com', '0');
INSERT INTO `dimension_inbound` VALUES ('10', null, '狗狗搜索', 'www.gougou.hk', '0');
INSERT INTO `dimension_inbound` VALUES ('11', null, 'bing', 'cn.bing.com', '0');
INSERT INTO `dimension_inbound` VALUES ('12', null, '360搜索', 'www.360sosou.com', '0');
INSERT INTO `dimension_inbound` VALUES ('13', null, '好搜', 'www.haosou.com', '0');

-- ----------------------------
-- Table structure for dimension_kpi
-- ----------------------------
DROP TABLE IF EXISTS `dimension_kpi`;
CREATE TABLE `dimension_kpi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kpi_name` varchar(45) DEFAULT NULL COMMENT 'kpi维度名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='kpi维度相关信息表';

-- ----------------------------
-- Records of dimension_kpi
-- ----------------------------
INSERT INTO `dimension_kpi` VALUES ('1', 'hourly_active_user');
INSERT INTO `dimension_kpi` VALUES ('2', 'hourly_sessions');
INSERT INTO `dimension_kpi` VALUES ('3', 'hourly_sessions_length');
INSERT INTO `dimension_kpi` VALUES ('4', 'view_depth_of_user');
INSERT INTO `dimension_kpi` VALUES ('5', 'view_depth_of_session');

-- ----------------------------
-- Table structure for dimension_location
-- ----------------------------
DROP TABLE IF EXISTS `dimension_location`;
CREATE TABLE `dimension_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) DEFAULT NULL COMMENT '国家名称',
  `province` varchar(45) DEFAULT NULL COMMENT '省份名称',
  `city` varchar(45) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='地域信息维度表';

-- ----------------------------
-- Records of dimension_location
-- ----------------------------
INSERT INTO `dimension_location` VALUES ('1', '中国', 'all', 'all');
INSERT INTO `dimension_location` VALUES ('2', '中国', '上海市', 'all');
INSERT INTO `dimension_location` VALUES ('3', '中国', '上海市', 'unknown');
INSERT INTO `dimension_location` VALUES ('4', '中国', '广东省', 'all');
INSERT INTO `dimension_location` VALUES ('5', '中国', '广东省', '广州市');

-- ----------------------------
-- Table structure for dimension_os
-- ----------------------------
DROP TABLE IF EXISTS `dimension_os`;
CREATE TABLE `dimension_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `os_name` varchar(45) NOT NULL DEFAULT '' COMMENT '操作系统名称',
  `os_version` varchar(45) NOT NULL DEFAULT '' COMMENT '操作系统版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='操作系统信息维度表';

-- ----------------------------
-- Records of dimension_os
-- ----------------------------

-- ----------------------------
-- Table structure for dimension_payment_type
-- ----------------------------
DROP TABLE IF EXISTS `dimension_payment_type`;
CREATE TABLE `dimension_payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) DEFAULT NULL COMMENT '支付方式名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付方式维度信息表';

-- ----------------------------
-- Records of dimension_payment_type
-- ----------------------------
INSERT INTO `dimension_payment_type` VALUES ('1', 'alipay');
INSERT INTO `dimension_payment_type` VALUES ('2', 'weixinpay');
INSERT INTO `dimension_payment_type` VALUES ('3', 'all');

-- ----------------------------
-- Table structure for dimension_platform
-- ----------------------------
DROP TABLE IF EXISTS `dimension_platform`;
CREATE TABLE `dimension_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(45) DEFAULT NULL COMMENT '平台名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='平台维度信息表';

-- ----------------------------
-- Records of dimension_platform
-- ----------------------------
INSERT INTO `dimension_platform` VALUES ('1', 'all');
INSERT INTO `dimension_platform` VALUES ('2', 'website');

-- ----------------------------
-- Table structure for event_info
-- ----------------------------
DROP TABLE IF EXISTS `event_info`;
CREATE TABLE `event_info` (
  `event_dimension_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `times` int(11) DEFAULT '0' COMMENT '触发次数',
  PRIMARY KEY (`event_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='描述event的属性信息，在本次项目中不会用到';

-- ----------------------------
-- Records of event_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_info
-- ----------------------------
DROP TABLE IF EXISTS `member_info`;
CREATE TABLE `member_info` (
  `member_id` varchar(32) NOT NULL DEFAULT '' COMMENT '会员id，是一个最多32位的字母数字字符串',
  `last_visit_date` date DEFAULT NULL COMMENT '最后访问日期',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_info
-- ----------------------------

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` varchar(50) NOT NULL DEFAULT '',
  `platform` varchar(50) NOT NULL DEFAULT 'unknown',
  `s_time` bigint(20) DEFAULT NULL,
  `currency_type` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '订单金额',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='描述订单的相关信息，该table在本次项目中的主要目标就是为了去重数据';

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('201601010001', 'website', null, 'RMB', 'alipay', '100');
INSERT INTO `order_info` VALUES ('201601010002', 'website', null, 'RMB', 'alipay', '200');
INSERT INTO `order_info` VALUES ('201601010003', 'website', null, 'RMB', 'weixinpay', '250');
INSERT INTO `order_info` VALUES ('201601020001', 'website', null, 'RMB', 'weixinpay', '130');
INSERT INTO `order_info` VALUES ('201601020002', 'website', null, 'RMB', 'alipay', '120');
INSERT INTO `order_info` VALUES ('201601020003', 'website', null, 'RMB', 'alipay', '110');
INSERT INTO `order_info` VALUES ('201601020004', 'website', null, 'RMB', 'weixinpay', '78');

-- ----------------------------
-- Table structure for stats_device_browser
-- ----------------------------
DROP TABLE IF EXISTS `stats_device_browser`;
CREATE TABLE `stats_device_browser` (
  `date_dimension_id` int(11) NOT NULL,
  `platform_dimension_id` int(11) NOT NULL,
  `browser_dimension_id` int(11) NOT NULL DEFAULT '0',
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `new_install_users` int(11) DEFAULT '0' COMMENT '新增用户数',
  `total_install_users` int(11) DEFAULT '0' COMMENT '总用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `sessions_length` int(11) DEFAULT '0' COMMENT '会话长度',
  `total_members` int(11) unsigned DEFAULT '0' COMMENT '总会员数',
  `active_members` int(11) unsigned DEFAULT '0' COMMENT '活跃会员数',
  `new_members` int(11) unsigned DEFAULT '0' COMMENT '新增会员数',
  `pv` int(11) DEFAULT '0' COMMENT 'pv数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`browser_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计浏览器相关分析数据的统计表';

-- ----------------------------
-- Records of stats_device_browser
-- ----------------------------
INSERT INTO `stats_device_browser` VALUES ('7', '1', '2', '72', '72', '72', '164', '725', '18', '18', '18', '415', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '1', '3', '72', '72', '72', '164', '725', '18', '18', '18', '415', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '1', '4', '19', '19', '19', '44', '168', '6', '6', '6', '55', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '1', '5', '19', '19', '19', '44', '168', '6', '6', '6', '55', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '1', '9', '9', '9', '9', '27', '101', '3', '3', '3', '42', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '1', '11', '9', '9', '9', '27', '101', '3', '3', '3', '42', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '2', '74', '38', '110', '150', '330', '25', '15', '7', '234', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '3', '82', '46', '118', '195', '333', '28', '18', '10', '266', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '4', '29', '18', '37', '83', '986', '10', '8', '4', '254', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '5', '33', '18', '41', '90', '1025', '11', '9', '5', '277', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '6', '1', '1', '1', '2', '25', '0', '0', '0', '5', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '7', '3', '3', '3', '5', '14', '1', '1', '1', '18', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '8', '8', '8', '8', '19', '45', '3', '3', '3', '32', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '9', '67', '25', '34', '188', '938', '4', '3', '1', '361', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '10', '2', '2', '2', '5', '12', '0', '0', '0', '14', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '1', '11', '69', '27', '36', '200', '950', '4', '3', '1', '375', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('7', '2', '2', '72', '72', '72', '164', '725', '18', '18', '18', '415', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '2', '3', '72', '72', '72', '164', '725', '18', '18', '18', '415', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '2', '4', '19', '19', '19', '44', '168', '6', '6', '6', '55', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '2', '5', '19', '19', '19', '44', '168', '6', '6', '6', '55', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '2', '9', '9', '9', '9', '27', '101', '3', '3', '3', '42', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('7', '2', '11', '9', '9', '9', '27', '101', '3', '3', '3', '42', '2016-01-09');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '2', '74', '38', '110', '150', '330', '25', '15', '7', '234', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '3', '82', '46', '118', '195', '333', '28', '18', '10', '266', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '4', '29', '18', '37', '83', '986', '10', '8', '4', '254', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '5', '33', '18', '41', '90', '1025', '11', '9', '5', '277', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '6', '1', '1', '1', '2', '25', '0', '0', '0', '5', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '7', '3', '3', '3', '5', '14', '1', '1', '1', '18', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '8', '8', '8', '8', '19', '45', '3', '3', '3', '32', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '9', '67', '25', '34', '188', '938', '4', '3', '1', '361', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '10', '2', '2', '2', '5', '12', '0', '0', '0', '14', '2016-01-10');
INSERT INTO `stats_device_browser` VALUES ('8', '2', '11', '69', '27', '36', '200', '950', '4', '3', '1', '375', '2016-01-10');

-- ----------------------------
-- Table structure for stats_device_location
-- ----------------------------
DROP TABLE IF EXISTS `stats_device_location`;
CREATE TABLE `stats_device_location` (
  `date_dimension_id` int(11) NOT NULL,
  `platform_dimension_id` int(11) NOT NULL,
  `location_dimension_id` int(11) NOT NULL DEFAULT '0',
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `bounce_sessions` int(11) DEFAULT '0' COMMENT '跳出会话个数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`location_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计地域相关分析数据的统计表';

-- ----------------------------
-- Records of stats_device_location
-- ----------------------------
INSERT INTO `stats_device_location` VALUES ('7', '1', '1', '100', '235', '45', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '1', '2', '85', '187', '28', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '1', '3', '85', '187', '28', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '1', '4', '15', '48', '17', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '1', '5', '15', '48', '17', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('8', '1', '1', '184', '452', '78', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '1', '2', '168', '384', '64', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '1', '3', '168', '384', '64', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '1', '4', '16', '68', '14', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '1', '5', '16', '68', '14', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('7', '2', '1', '100', '235', '45', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '2', '2', '85', '187', '28', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '2', '3', '85', '187', '28', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '2', '4', '15', '48', '17', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('7', '2', '5', '15', '48', '17', '2016-01-09');
INSERT INTO `stats_device_location` VALUES ('8', '2', '1', '184', '452', '78', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '2', '2', '168', '384', '64', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '2', '3', '168', '384', '64', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '2', '4', '16', '68', '14', '2016-01-10');
INSERT INTO `stats_device_location` VALUES ('8', '2', '5', '16', '68', '14', '2016-01-10');

-- ----------------------------
-- Table structure for stats_event
-- ----------------------------
DROP TABLE IF EXISTS `stats_event`;
CREATE TABLE `stats_event` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL DEFAULT '0',
  `event_dimension_id` int(11) NOT NULL DEFAULT '0',
  `times` int(11) DEFAULT '0' COMMENT '触发次数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`event_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计事件相关分析数据的统计表';

-- ----------------------------
-- Records of stats_event
-- ----------------------------
INSERT INTO `stats_event` VALUES ('1', '7', '1', '251', '2016-01-09');
INSERT INTO `stats_event` VALUES ('1', '7', '2', '186', '2016-01-09');
INSERT INTO `stats_event` VALUES ('1', '7', '3', '23', '2016-01-09');
INSERT INTO `stats_event` VALUES ('1', '7', '4', '4', '2016-01-09');
INSERT INTO `stats_event` VALUES ('1', '8', '1', '243', '2016-01-10');
INSERT INTO `stats_event` VALUES ('1', '8', '2', '153', '2016-01-10');
INSERT INTO `stats_event` VALUES ('1', '8', '3', '18', '2016-01-10');
INSERT INTO `stats_event` VALUES ('1', '8', '4', '7', '2016-01-10');
INSERT INTO `stats_event` VALUES ('2', '7', '1', '251', '2016-01-09');
INSERT INTO `stats_event` VALUES ('2', '7', '2', '186', '2016-01-09');
INSERT INTO `stats_event` VALUES ('2', '7', '3', '23', '2016-01-09');
INSERT INTO `stats_event` VALUES ('2', '7', '4', '4', '2016-01-09');
INSERT INTO `stats_event` VALUES ('2', '8', '1', '243', '2016-01-10');
INSERT INTO `stats_event` VALUES ('2', '8', '2', '153', '2016-01-10');
INSERT INTO `stats_event` VALUES ('2', '8', '3', '18', '2016-01-10');
INSERT INTO `stats_event` VALUES ('2', '8', '4', '7', '2016-01-10');

-- ----------------------------
-- Table structure for stats_hourly
-- ----------------------------
DROP TABLE IF EXISTS `stats_hourly`;
CREATE TABLE `stats_hourly` (
  `platform_dimension_id` int(11) NOT NULL,
  `date_dimension_id` int(11) NOT NULL,
  `kpi_dimension_id` int(11) NOT NULL,
  `hour_00` int(11) DEFAULT '0',
  `hour_01` int(11) DEFAULT '0',
  `hour_02` int(11) DEFAULT '0',
  `hour_03` int(11) DEFAULT '0',
  `hour_04` int(11) DEFAULT '0',
  `hour_05` int(11) DEFAULT '0',
  `hour_06` int(11) DEFAULT '0',
  `hour_07` int(11) DEFAULT '0',
  `hour_08` int(11) DEFAULT '0',
  `hour_09` int(11) DEFAULT '0',
  `hour_10` int(11) DEFAULT '0',
  `hour_11` int(11) DEFAULT '0',
  `hour_12` int(11) DEFAULT '0',
  `hour_13` int(11) DEFAULT '0',
  `hour_14` int(11) DEFAULT '0',
  `hour_15` int(11) DEFAULT '0',
  `hour_16` int(11) DEFAULT '0',
  `hour_17` int(11) DEFAULT '0',
  `hour_18` int(11) DEFAULT '0',
  `hour_19` int(11) DEFAULT '0',
  `hour_20` int(11) DEFAULT '0',
  `hour_21` int(11) DEFAULT '0',
  `hour_22` int(11) DEFAULT '0',
  `hour_23` int(11) DEFAULT '0',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`kpi_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='按小时统计信息的统计表';

-- ----------------------------
-- Records of stats_hourly
-- ----------------------------
INSERT INTO `stats_hourly` VALUES ('1', '7', '1', '10', '1', '1', '1', '0', '1', '2', '3', '5', '23', '24', '28', '14', '29', '38', '27', '26', '28', '14', '25', '35', '23', '22', '21', '2016-01-09');
INSERT INTO `stats_hourly` VALUES ('1', '7', '2', '12', '2', '1', '1', '0', '1', '5', '6', '8', '30', '35', '40', '24', '65', '81', '62', '55', '72', '36', '60', '82', '45', '28', '26', '2016-01-09');
INSERT INTO `stats_hourly` VALUES ('1', '7', '3', '52', '5', '0', '0', '0', '0', '16', '23', '29', '140', '86', '98', '76', '180', '236', '135', '168', '256', '103', '216', '254', '125', '70', '54', '2016-01-09');
INSERT INTO `stats_hourly` VALUES ('1', '8', '1', '12', '1', '1', '0', '1', '0', '3', '2', '5', '25', '29', '31', '16', '31', '41', '43', '31', '27', '16', '18', '21', '22', '22', '19', '2016-01-10');
INSERT INTO `stats_hourly` VALUES ('1', '8', '2', '16', '2', '1', '0', '3', '0', '5', '4', '8', '45', '56', '72', '32', '72', '92', '102', '72', '58', '34', '36', '45', '48', '45', '38', '2016-01-10');
INSERT INTO `stats_hourly` VALUES ('1', '8', '3', '72', '15', '0', '0', '25', '0', '53', '59', '87', '451', '443', '568', '321', '689', '1021', '1125', '850', '620', '210', '250', '365', '380', '355', '340', '2016-01-10');
INSERT INTO `stats_hourly` VALUES ('2', '7', '1', '10', '1', '1', '1', '0', '1', '2', '3', '5', '23', '24', '28', '14', '29', '38', '27', '26', '28', '14', '25', '35', '23', '22', '21', '2016-01-09');
INSERT INTO `stats_hourly` VALUES ('2', '7', '2', '12', '2', '1', '1', '0', '1', '5', '6', '8', '30', '35', '40', '24', '65', '81', '62', '55', '72', '36', '60', '82', '45', '28', '26', '2016-01-09');
INSERT INTO `stats_hourly` VALUES ('2', '7', '3', '52', '5', '0', '0', '0', '0', '16', '23', '29', '140', '86', '98', '76', '180', '236', '135', '168', '256', '103', '216', '254', '125', '70', '54', '2016-01-09');
INSERT INTO `stats_hourly` VALUES ('2', '8', '1', '12', '1', '1', '0', '1', '0', '3', '2', '5', '25', '29', '31', '16', '31', '41', '43', '31', '27', '16', '18', '21', '22', '22', '19', '2016-01-10');
INSERT INTO `stats_hourly` VALUES ('2', '8', '2', '16', '2', '1', '0', '3', '0', '5', '4', '8', '45', '56', '72', '32', '72', '92', '102', '72', '58', '34', '36', '45', '48', '45', '38', '2016-01-10');
INSERT INTO `stats_hourly` VALUES ('2', '8', '3', '72', '15', '0', '0', '25', '0', '53', '59', '87', '451', '443', '568', '321', '689', '1021', '1125', '850', '620', '210', '250', '365', '380', '355', '340', '2016-01-10');

-- ----------------------------
-- Table structure for stats_inbound
-- ----------------------------
DROP TABLE IF EXISTS `stats_inbound`;
CREATE TABLE `stats_inbound` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL,
  `inbound_dimension_id` int(11) NOT NULL,
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `bounce_sessions` int(11) DEFAULT '0' COMMENT '跳出会话个数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`inbound_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计外链信息的统计表';

-- ----------------------------
-- Records of stats_inbound
-- ----------------------------
INSERT INTO `stats_inbound` VALUES ('1', '7', '1', '41', '77', '29', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('1', '7', '2', '1', '2', '1', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('1', '7', '3', '24', '53', '9', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('1', '7', '4', '15', '21', '18', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('1', '7', '12', '1', '1', '1', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('1', '8', '1', '45', '120', '33', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('1', '8', '2', '2', '2', '1', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('1', '8', '3', '28', '72', '19', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('1', '8', '4', '19', '37', '11', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('1', '8', '12', '3', '9', '2', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('2', '7', '1', '41', '77', '29', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('2', '7', '2', '1', '2', '1', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('2', '7', '3', '24', '53', '9', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('2', '7', '4', '15', '21', '18', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('2', '7', '12', '1', '1', '1', '2016-01-09');
INSERT INTO `stats_inbound` VALUES ('2', '8', '1', '45', '120', '33', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('2', '8', '2', '2', '2', '1', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('2', '8', '3', '28', '72', '19', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('2', '8', '4', '19', '37', '11', '2016-01-10');
INSERT INTO `stats_inbound` VALUES ('2', '8', '12', '3', '9', '2', '2016-01-10');

-- ----------------------------
-- Table structure for stats_order
-- ----------------------------
DROP TABLE IF EXISTS `stats_order`;
CREATE TABLE `stats_order` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL DEFAULT '0',
  `currency_type_dimension_id` int(11) NOT NULL DEFAULT '0',
  `payment_type_dimension_id` int(11) NOT NULL DEFAULT '0',
  `orders` int(11) DEFAULT '0' COMMENT '订单个数',
  `success_orders` int(11) DEFAULT '0' COMMENT '成功支付的订单个数',
  `refund_orders` int(11) DEFAULT '0' COMMENT '退款订单个数',
  `order_amount` int(11) DEFAULT '0' COMMENT '订单金额',
  `revenue_amount` int(11) DEFAULT '0' COMMENT '收入金额，也就是成功支付过的金额',
  `refund_amount` int(11) DEFAULT '0' COMMENT '退款金额',
  `total_revenue_amount` int(11) DEFAULT '0' COMMENT '迄今为止，总的订单交易额',
  `total_refund_amount` int(11) DEFAULT '0' COMMENT '迄今为止，总的退款金额',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`currency_type_dimension_id`,`payment_type_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计订单信息的统计表';

-- ----------------------------
-- Records of stats_order
-- ----------------------------
INSERT INTO `stats_order` VALUES ('1', '7', '1', '1', '2', '2', '0', '300', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('1', '7', '1', '2', '1', '0', '0', '250', '0', '0', '0', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('1', '7', '1', '3', '3', '2', '0', '550', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('1', '7', '2', '1', '2', '2', '0', '300', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('1', '7', '2', '2', '1', '0', '0', '250', '0', '0', '0', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('1', '7', '2', '3', '3', '2', '0', '550', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('1', '8', '1', '1', '2', '2', '2', '230', '230', '230', '530', '230', '2016-01-10');
INSERT INTO `stats_order` VALUES ('1', '8', '1', '2', '2', '2', '1', '208', '208', '78', '208', '78', '2016-01-10');
INSERT INTO `stats_order` VALUES ('1', '8', '1', '3', '4', '4', '3', '438', '438', '308', '738', '308', '2016-01-10');
INSERT INTO `stats_order` VALUES ('1', '8', '2', '1', '2', '2', '2', '230', '230', '230', '530', '230', '2016-01-10');
INSERT INTO `stats_order` VALUES ('1', '8', '2', '2', '2', '2', '1', '208', '208', '78', '208', '78', '2016-01-10');
INSERT INTO `stats_order` VALUES ('1', '8', '2', '3', '4', '4', '3', '438', '438', '308', '738', '308', '2016-01-10');
INSERT INTO `stats_order` VALUES ('2', '7', '1', '1', '2', '2', '0', '300', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('2', '7', '1', '2', '1', '0', '0', '250', '0', '0', '0', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('2', '7', '1', '3', '3', '2', '0', '550', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('2', '7', '2', '1', '2', '2', '0', '300', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('2', '7', '2', '2', '1', '0', '0', '250', '0', '0', '0', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('2', '7', '2', '3', '3', '2', '0', '550', '300', '0', '300', '0', '2016-01-09');
INSERT INTO `stats_order` VALUES ('2', '8', '1', '1', '2', '2', '2', '230', '230', '230', '530', '230', '2016-01-10');
INSERT INTO `stats_order` VALUES ('2', '8', '1', '2', '2', '2', '1', '208', '208', '78', '208', '78', '2016-01-10');
INSERT INTO `stats_order` VALUES ('2', '8', '1', '3', '4', '4', '3', '438', '438', '308', '738', '308', '2016-01-10');
INSERT INTO `stats_order` VALUES ('2', '8', '2', '1', '2', '2', '2', '230', '230', '230', '530', '230', '2016-01-10');
INSERT INTO `stats_order` VALUES ('2', '8', '2', '2', '2', '2', '1', '208', '208', '78', '208', '78', '2016-01-10');
INSERT INTO `stats_order` VALUES ('2', '8', '2', '3', '4', '4', '3', '438', '438', '308', '738', '308', '2016-01-10');

-- ----------------------------
-- Table structure for stats_user
-- ----------------------------
DROP TABLE IF EXISTS `stats_user`;
CREATE TABLE `stats_user` (
  `date_dimension_id` int(11) NOT NULL,
  `platform_dimension_id` int(11) NOT NULL,
  `active_users` int(11) DEFAULT '0' COMMENT '活跃用户数',
  `new_install_users` int(11) DEFAULT '0' COMMENT '新增用户数',
  `total_install_users` int(11) DEFAULT '0' COMMENT '总用户数',
  `sessions` int(11) DEFAULT '0' COMMENT '会话个数',
  `sessions_length` int(11) DEFAULT '0' COMMENT '会话长度',
  `total_members` int(11) unsigned DEFAULT '0' COMMENT '总会员数',
  `active_members` int(11) unsigned DEFAULT '0' COMMENT '活跃会员数',
  `new_members` int(11) unsigned DEFAULT '0' COMMENT '新增会员数',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='统计用户基本信息的统计表';

-- ----------------------------
-- Records of stats_user
-- ----------------------------
INSERT INTO `stats_user` VALUES ('7', '1', '100', '100', '100', '235', '994', '27', '27', '27', '2016-01-09');
INSERT INTO `stats_user` VALUES ('8', '1', '184', '95', '195', '452', '2350', '50', '30', '23', '2016-01-10');
INSERT INTO `stats_user` VALUES ('7', '2', '100', '100', '100', '235', '994', '27', '27', '27', '2016-01-09');
INSERT INTO `stats_user` VALUES ('8', '2', '184', '95', '195', '452', '2350', '50', '30', '23', '2016-01-10');

-- ----------------------------
-- Table structure for stats_view_depth
-- ----------------------------
DROP TABLE IF EXISTS `stats_view_depth`;
CREATE TABLE `stats_view_depth` (
  `platform_dimension_id` int(11) NOT NULL DEFAULT '0',
  `date_dimension_id` int(11) NOT NULL DEFAULT '0',
  `kpi_dimension_id` int(11) NOT NULL DEFAULT '0',
  `pv1` int(11) DEFAULT '0',
  `pv2` int(11) DEFAULT '0',
  `pv3` int(11) DEFAULT '0',
  `pv4` int(11) DEFAULT '0',
  `pv5_10` int(11) DEFAULT '0',
  `pv10_30` int(11) DEFAULT '0',
  `pv30_60` int(11) DEFAULT '0',
  `pv60_plus` int(11) DEFAULT '0',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`platform_dimension_id`,`date_dimension_id`,`kpi_dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计用户浏览深度相关分析数据的统计表';

-- ----------------------------
-- Records of stats_view_depth
-- ----------------------------
INSERT INTO `stats_view_depth` VALUES ('1', '7', '4', '12', '35', '38', '5', '3', '3', '1', '3', '2016-01-09');
INSERT INTO `stats_view_depth` VALUES ('1', '7', '5', '25', '79', '90', '13', '14', '7', '2', '5', '2016-01-09');
INSERT INTO `stats_view_depth` VALUES ('1', '8', '4', '21', '53', '70', '17', '13', '6', '3', '1', '2016-01-10');
INSERT INTO `stats_view_depth` VALUES ('1', '8', '5', '56', '142', '167', '45', '31', '8', '2', '1', '2016-01-10');
INSERT INTO `stats_view_depth` VALUES ('2', '7', '4', '12', '35', '38', '5', '3', '3', '1', '3', '2016-01-09');
INSERT INTO `stats_view_depth` VALUES ('2', '7', '5', '25', '79', '90', '13', '14', '7', '2', '5', '2016-01-09');
INSERT INTO `stats_view_depth` VALUES ('2', '8', '4', '21', '53', '70', '17', '13', '6', '3', '1', '2016-01-10');
INSERT INTO `stats_view_depth` VALUES ('2', '8', '5', '56', '142', '167', '45', '31', '8', '2', '1', '2016-01-10');
