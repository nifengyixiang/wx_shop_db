-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-09-04 00:54:49
-- 服务器版本： 5.5.56-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wx_shop`
--

-- --------------------------------------------------------

--
-- 表的结构 `apply`
--

CREATE TABLE IF NOT EXISTS `apply` (
  `id` int(10) unsigned NOT NULL COMMENT '员工申请表id',
  `business_id` int(11) NOT NULL COMMENT '商店id',
  `shopkeeper_id` int(11) NOT NULL COMMENT '店主id',
  `apply_id` int(11) NOT NULL COMMENT '申请人id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `apply_state` int(11) NOT NULL COMMENT '申请状态0:待审核、1:已通过、2:已拒绝',
  `aoperation_time` datetime DEFAULT NULL COMMENT '操作时间，允许、拒绝等',
  `apply_type` int(11) NOT NULL COMMENT '申请类型0:店主申请1:员工申请'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `authority`
--

CREATE TABLE IF NOT EXISTS `authority` (
  `id` int(10) unsigned NOT NULL COMMENT '权限id',
  `name` varchar(5) NOT NULL COMMENT '权限名',
  `desc` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `value` varchar(255) NOT NULL COMMENT '权限值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `business`
--

CREATE TABLE IF NOT EXISTS `business` (
  `id` int(10) unsigned NOT NULL COMMENT '商家id',
  `name` varchar(255) NOT NULL COMMENT '店名',
  `desc` varchar(255) DEFAULT NULL COMMENT '简介',
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
  `delivery_money` decimal(10,0) DEFAULT NULL COMMENT '满多少起送'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `business_type`
--

CREATE TABLE IF NOT EXISTS `business_type` (
  `id` int(10) unsigned NOT NULL COMMENT '商家分类标签id',
  `type` varchar(255) DEFAULT NULL COMMENT '分类类别',
  `label` varchar(255) DEFAULT NULL COMMENT '店铺标签'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `charge`
--

CREATE TABLE IF NOT EXISTS `charge` (
  `id` int(10) unsigned NOT NULL COMMENT '商家收费标准id',
  `name` varchar(255) NOT NULL COMMENT '收费类型名称',
  `value` int(11) NOT NULL COMMENT '收费类型值',
  `percent` int(11) DEFAULT NULL COMMENT '收费百分比',
  `money` decimal(10,0) DEFAULT NULL COMMENT '收费金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL COMMENT '用户评价id',
  `business_score` int(5) unsigned DEFAULT NULL COMMENT '评分',
  `business_id` int(11) NOT NULL COMMENT '商家id',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `type` int(5) unsigned NOT NULL COMMENT '评分类型-0：商家评价，1：订单评价，2：商品评价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `discount`
--

CREATE TABLE IF NOT EXISTS `discount` (
  `id` int(10) unsigned NOT NULL COMMENT '折扣id',
  `name` varchar(255) NOT NULL COMMENT '折扣名',
  `value` varchar(255) NOT NULL COMMENT '折扣类型值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(10) unsigned NOT NULL COMMENT '商品id',
  `business_id` int(11) NOT NULL COMMENT '商家id',
  `type_id` int(11) NOT NULL COMMENT '分类id',
  `name` varchar(255) NOT NULL COMMENT '商品名',
  `img_url` varchar(255) NOT NULL COMMENT '商品图片',
  `desc` varchar(255) DEFAULT NULL COMMENT '商品简介',
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
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `goods_type`
--

CREATE TABLE IF NOT EXISTS `goods_type` (
  `id` int(10) unsigned NOT NULL COMMENT '商品类型id',
  `name` varchar(255) NOT NULL COMMENT '类别名',
  `desc` varchar(255) DEFAULT NULL COMMENT '类别描述',
  `type` varchar(255) DEFAULT NULL COMMENT '类别类型,A:大类，B:小类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(10) unsigned NOT NULL COMMENT '订单id',
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
  `table_id` int(11) DEFAULT NULL COMMENT '桌子id，仅堂食有'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(10) unsigned NOT NULL COMMENT '订单详情表id',
  `order_num` varchar(255) NOT NULL COMMENT '订单号',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `number` int(10) unsigned NOT NULL COMMENT '购买数量',
  `total_price` decimal(10,0) NOT NULL COMMENT '购买该商品总价',
  `old_total_price` decimal(10,0) DEFAULT NULL COMMENT '该商品未优惠总价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `order_state`
--

CREATE TABLE IF NOT EXISTS `order_state` (
  `id` int(10) unsigned NOT NULL COMMENT '订单状态id',
  `name` varchar(255) NOT NULL COMMENT '状态名',
  `desc` varchar(255) DEFAULT NULL COMMENT '状态描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `order_state_history`
--

CREATE TABLE IF NOT EXISTS `order_state_history` (
  `id` int(10) unsigned NOT NULL COMMENT '订单状态历史id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_state_id` int(11) NOT NULL COMMENT '订单状态id',
  `create_time` datetime NOT NULL COMMENT '该条历史产生时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL COMMENT '员工角色id',
  `name` varchar(10) NOT NULL COMMENT '角色名',
  `authority_ids` varchar(255) NOT NULL COMMENT '权限id组',
  `desc` varchar(255) DEFAULT NULL COMMENT '角色描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `table`
--

CREATE TABLE IF NOT EXISTS `table` (
  `id` int(10) unsigned NOT NULL COMMENT '餐桌id',
  `number` int(11) NOT NULL COMMENT '桌号',
  `desc` varchar(255) DEFAULT NULL COMMENT '餐桌描述',
  `seat_num` int(11) NOT NULL COMMENT '座位数',
  `business_id` int(11) NOT NULL COMMENT '商家id',
  `qr_code_str` varchar(255) NOT NULL COMMENT '桌子二维码字符串',
  `qr_code_img` varchar(255) DEFAULT NULL COMMENT '桌子二维码url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `id` int(10) unsigned NOT NULL COMMENT '商品单位id',
  `name` varchar(255) NOT NULL COMMENT '单位名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL COMMENT '用户id',
  `open_id` varchar(255) DEFAULT NULL COMMENT '微信的openid',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
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
  `desc` varchar(255) DEFAULT NULL COMMENT '用户描述，对角色、权限等描述',
  `create_time` datetime NOT NULL COMMENT '用户创建时间',
  `signin_time` datetime NOT NULL COMMENT '上次登录时间',
  `business_id` int(11) DEFAULT NULL COMMENT '商家用户关联商店id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_type`
--
ALTER TABLE `business_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods_type`
--
ALTER TABLE `goods_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_state`
--
ALTER TABLE `order_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_state_history`
--
ALTER TABLE `order_state_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apply`
--
ALTER TABLE `apply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工申请表id';
--
-- AUTO_INCREMENT for table `authority`
--
ALTER TABLE `authority`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id';
--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家id';
--
-- AUTO_INCREMENT for table `business_type`
--
ALTER TABLE `business_type`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家分类标签id';
--
-- AUTO_INCREMENT for table `charge`
--
ALTER TABLE `charge`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家收费标准id';
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户评价id';
--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '折扣id';
--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id';
--
-- AUTO_INCREMENT for table `goods_type`
--
ALTER TABLE `goods_type`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类型id';
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id';
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单详情表id';
--
-- AUTO_INCREMENT for table `order_state`
--
ALTER TABLE `order_state`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单状态id';
--
-- AUTO_INCREMENT for table `order_state_history`
--
ALTER TABLE `order_state_history`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单状态历史id';
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工角色id';
--
-- AUTO_INCREMENT for table `table`
--
ALTER TABLE `table`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '餐桌id';
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品单位id';
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
