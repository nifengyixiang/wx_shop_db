/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : wx_shop

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-13 18:02:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工申请表id',
  `business_id` int(11) NOT NULL COMMENT '商店id',
  `shopkeeper_id` int(11) NOT NULL COMMENT '店主id',
  `apply_id` int(11) NOT NULL COMMENT '申请人id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `apply_state` int(11) NOT NULL COMMENT '申请状态0:待审核、1:已通过、2:已拒绝',
  `aoperation_time` datetime DEFAULT NULL COMMENT '操作时间，允许、拒绝等',
  `apply_type` int(11) NOT NULL COMMENT '申请类型0:店主申请1:员工申请',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(5) NOT NULL COMMENT '权限名',
  `authority_desc` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `value` varchar(255) NOT NULL COMMENT '权限值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', 'root', '超级管理员权限', '-1');

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `name` varchar(255) NOT NULL COMMENT '店名',
  `business_desc` varchar(255) DEFAULT NULL COMMENT '简介',
  `pic_url` varchar(255) NOT NULL COMMENT '店铺图片链接',
  `longitude` double(10,6) DEFAULT NULL COMMENT '经度',
  `latitude` double(10,6) DEFAULT NULL COMMENT '纬度',
  `province` varchar(25) NOT NULL COMMENT '省份',
  `city` varchar(25) NOT NULL COMMENT '城市',
  `county` varchar(25) NOT NULL COMMENT '县',
  `area` varchar(255) NOT NULL COMMENT '区',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `business_type_id` int(10) NOT NULL COMMENT '商家分类标签id',
  `consumption_range` varchar(255) DEFAULT NULL COMMENT '消费区间',
  `qr_code_str` varchar(255) NOT NULL COMMENT '商家二维码字符串',
  `qr_code_url` varchar(255) NOT NULL COMMENT '商家二维码图片链接',
  `business_tel` varchar(255) NOT NULL COMMENT '联系电话',
  `shopkeeper_name` varchar(255) NOT NULL COMMENT '店主姓名',
  `create_time` datetime NOT NULL COMMENT '商家创建时间',
  `charge_id` int(11) NOT NULL COMMENT '收费标准id',
  `is_open` int(11) NOT NULL DEFAULT '1' COMMENT '是否营业0:不营业 1:营业',
  `open_time` datetime NOT NULL COMMENT '开始营业时间',
  `close_time` datetime NOT NULL COMMENT '关闭营业时间',
  `wifi_name` varchar(255) DEFAULT NULL COMMENT '店铺wifi名称',
  `wifi_pwd` varchar(255) DEFAULT NULL COMMENT '店铺wifi密码',
  `delivery_money` decimal(10,0) DEFAULT NULL COMMENT '满多少起送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------

-- ----------------------------
-- Table structure for business_type
-- ----------------------------
DROP TABLE IF EXISTS `business_type`;
CREATE TABLE `business_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家分类标签id',
  `type` varchar(255) DEFAULT NULL COMMENT '分类类别',
  `business_label` varchar(255) DEFAULT NULL COMMENT '店铺标签',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_type
-- ----------------------------

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家收费标准id',
  `name` varchar(255) NOT NULL COMMENT '收费类型名称',
  `value` int(11) NOT NULL COMMENT '收费类型值',
  `percent` int(11) DEFAULT NULL COMMENT '收费百分比',
  `money` decimal(10,0) DEFAULT NULL COMMENT '收费金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charge
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户评价id',
  `business_score` int(5) unsigned DEFAULT NULL COMMENT '评分',
  `business_id` int(11) NOT NULL COMMENT '商家id',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `comment_type` int(5) unsigned NOT NULL COMMENT '评分类型-0：商家评价，1：订单评价，2：商品评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '折扣id',
  `name` varchar(255) NOT NULL COMMENT '折扣名',
  `value` varchar(255) NOT NULL COMMENT '折扣类型值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discount
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `business_id` int(11) NOT NULL COMMENT '商家id',
  `type_id` int(11) NOT NULL COMMENT '分类id',
  `name` varchar(255) NOT NULL COMMENT '商品名',
  `img_url` varchar(255) NOT NULL COMMENT '商品图片',
  `goods_desc` varchar(255) DEFAULT NULL COMMENT '商品简介',
  `old_price` decimal(10,0) DEFAULT NULL COMMENT '原价',
  `price` decimal(10,0) NOT NULL COMMENT '现价',
  `discount_id` int(11) DEFAULT NULL COMMENT '折扣id',
  `number` int(11) NOT NULL COMMENT '库存数量',
  `tag` varchar(255) DEFAULT NULL COMMENT '商品标签',
  `comment_id` int(11) DEFAULT NULL COMMENT '商品评论id',
  `unit_id` int(11) NOT NULL COMMENT '单位id',
  `sales` int(11) NOT NULL COMMENT '销量',
  `praise` int(11) DEFAULT NULL COMMENT '点赞数',
  `standard` int(11) NOT NULL COMMENT '规格，0:大1:中2:小',
  `state` int(11) NOT NULL COMMENT '状态,0:上架1：下架',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `name` varchar(255) NOT NULL COMMENT '类别名',
  `type_desc` varchar(255) DEFAULT NULL COMMENT '类别描述',
  `t_type` varchar(255) DEFAULT NULL COMMENT '类别类型,A:大类，B:小类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES ('1', '推荐', '推荐商品', 'A');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_num` varchar(255) NOT NULL COMMENT '订单号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `order_type` int(11) NOT NULL COMMENT '订单类型0:堂食1:外卖',
  `remark` varchar(255) DEFAULT NULL COMMENT '客户备注',
  `business_id` int(11) NOT NULL,
  `courier_id` int(11) DEFAULT NULL COMMENT '快递员id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `address` varchar(255) DEFAULT NULL COMMENT '配送地址-类型为外卖时才有',
  `pay_type` int(11) NOT NULL COMMENT '付款方式0:现金1:支付宝2:微信3:其它',
  `comment_id` int(11) DEFAULT NULL COMMENT '订单评价',
  `meal_number` int(11) DEFAULT NULL COMMENT '取餐号，仅堂食有',
  `table_id` int(11) DEFAULT NULL COMMENT '桌子id，仅堂食有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单详情表id',
  `order_num` varchar(255) NOT NULL COMMENT '订单号',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `number` int(10) unsigned NOT NULL COMMENT '购买数量',
  `total_price` decimal(10,0) NOT NULL COMMENT '购买该商品总价',
  `old_total_price` decimal(10,0) DEFAULT NULL COMMENT '该商品未优惠总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for order_state
-- ----------------------------
DROP TABLE IF EXISTS `order_state`;
CREATE TABLE `order_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单状态id',
  `name` varchar(255) NOT NULL COMMENT '状态名',
  `order_state_desc` varchar(255) DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_state
-- ----------------------------

-- ----------------------------
-- Table structure for order_state_history
-- ----------------------------
DROP TABLE IF EXISTS `order_state_history`;
CREATE TABLE `order_state_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单状态历史id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_state_id` int(11) NOT NULL COMMENT '订单状态id',
  `create_time` datetime NOT NULL COMMENT '该条历史产生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_state_history
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工角色id',
  `name` varchar(10) NOT NULL COMMENT '角色名',
  `authority_ids` varchar(255) NOT NULL COMMENT '权限id组',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'root', '1', '超级管理员，最高权限');

-- ----------------------------
-- Table structure for table
-- ----------------------------
DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '餐桌id',
  `number` int(11) NOT NULL COMMENT '桌号',
  `table_desc` varchar(255) DEFAULT NULL COMMENT '餐桌描述',
  `seat_num` int(11) NOT NULL COMMENT '座位数',
  `business_id` int(11) NOT NULL COMMENT '商家id',
  `qr_code_str` varchar(255) NOT NULL COMMENT '桌子二维码字符串',
  `qr_code_img` varchar(255) DEFAULT NULL COMMENT '桌子二维码url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table
-- ----------------------------

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品单位id',
  `name` varchar(255) NOT NULL COMMENT '单位名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `open_id` varchar(255) DEFAULT NULL COMMENT '微信的openid',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `user_no` varchar(255) DEFAULT NULL COMMENT '用户账号',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `nick_name` varchar(255) NOT NULL,
  `sex` int(10) unsigned NOT NULL COMMENT '性别，0：未知，1：男，2：女',
  `head_img_url` varchar(255) NOT NULL COMMENT '用户头像链接',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `county` varchar(255) NOT NULL COMMENT '县',
  `area` varchar(255) NOT NULL COMMENT '区',
  `privilege` varchar(255) DEFAULT NULL COMMENT '特权信息',
  `user_desc` varchar(255) DEFAULT NULL COMMENT '用户描述，对角色、权限等描述',
  `create_time` datetime NOT NULL COMMENT '用户创建时间',
  `signin_time` datetime NOT NULL COMMENT '上次登录时间',
  `business_id` int(11) DEFAULT NULL COMMENT '商家用户关联商店id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_no` (`user_no`) USING BTREE COMMENT '用户账号唯一不可重复'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, null, 'root', null, 'root123', '1', 'big-boss', '1', 'https://www.baidu.com/img/bd_logo1.png', '上海', '上海', '浦东新区', '唐镇', null, '超级管理员，嘿嘿嘿', '2018-09-13 16:45:18', '2018-09-13 16:45:25', null);
