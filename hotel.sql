/*
Navicat MySQL Data Transfer

Source Server         : QY88
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2018-10-27 19:57:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bookingroom
-- ----------------------------
DROP TABLE IF EXISTS `bookingroom`;
CREATE TABLE `bookingroom` (
  `orderid` varchar(255) NOT NULL COMMENT '订单编号',
  `cusname` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `custel` varchar(255) DEFAULT NULL COMMENT '客户手机号',
  `roomtype` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `begintime` datetime DEFAULT NULL COMMENT '预订入住时间',
  `days` int(11) DEFAULT NULL COMMENT '入住天数',
  `cusnumber` int(11) DEFAULT NULL COMMENT '客户人数',
  `empno` varchar(255) DEFAULT NULL COMMENT '员工工号',
  `handname` varchar(255) DEFAULT NULL COMMENT '操作员',
  `state` varchar(255) DEFAULT '未确认' COMMENT '订单状态',
  `text` varchar(255) DEFAULT NULL COMMENT '顾客备注',
  `roomid` int(11) DEFAULT NULL COMMENT '房号',
  `roompricesum` int(11) DEFAULT NULL COMMENT '订单总费用',
  `distime` datetime DEFAULT NULL COMMENT '处理时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '顾客备注',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookingroom
-- ----------------------------
INSERT INTO `bookingroom` VALUES ('NUM201810000304', '易成名', '18737101923', '豪华单人间', '2018-10-24 00:00:00', '2', '4', null, null, '申请取消', null, null, '276', null, '');
INSERT INTO `bookingroom` VALUES ('NUM201810000407', 'kk', '15660003543', '豪华单人间', '2018-10-27 00:00:00', '5', '1', null, null, '已取消', null, null, '590', null, '');
INSERT INTO `bookingroom` VALUES ('NUM201810000428', '易成名', '18737101923', '情侣大床房', '2018-10-23 00:00:00', '2', '4', null, '小仙女', '已确认', '预订成功', '103', '256', '2018-10-23 09:07:30', '隔音效果好');
INSERT INTO `bookingroom` VALUES ('NUM201810001088', 'dnf', '18737101923', '总统套房', '2018-10-27 00:00:00', '20', '2', null, null, '已取消', null, null, '3760', null, 'wo lai le');
INSERT INTO `bookingroom` VALUES ('NUM201810002197', '度几乎', '15839004333', '豪华单人间', '2018-10-24 00:00:00', '1', '3', null, '小仙女', '无法预订', '房间已满', '0', '118', '2018-10-24 16:55:49', '');
INSERT INTO `bookingroom` VALUES ('NUM201810002462', '易达阁', '18737101923', '豪华单人间', '2018-10-30 00:00:00', '4', '1', null, null, '已取消', null, null, '472', null, '');
INSERT INTO `bookingroom` VALUES ('NUM201810002668', '老肥', '18000000000', '总统套房', '2018-10-23 00:00:00', '1', '1', null, '小仙女', '已确认', '预订成功', '105', '188', '2018-10-23 11:28:16', '靠海向阳床还软');
INSERT INTO `bookingroom` VALUES ('NUM201810002726', '易成名', '18737101923', '家庭套房', '2018-10-26 00:00:00', '5', '1', null, '小仙女', '已入住', '预订成功', '203', '840', '2018-10-26 18:45:13', '');
INSERT INTO `bookingroom` VALUES ('NUM201810003201', '狗哥', '15660003543', '总统套房', '2018-10-29 00:00:00', '7', '1', null, '寇佬冶', '已入住', '预订成功', '403', '1316', '2018-10-26 20:22:29', '');
INSERT INTO `bookingroom` VALUES ('NUM201810003411', '寇明浩', '15660003543', '商务房', '2018-10-28 00:00:00', '3', '1', null, '小仙女', '已入住', '预订成功', '107', '384', '2018-10-26 08:25:54', '');
INSERT INTO `bookingroom` VALUES ('NUM201810004376', '柳川', '15660003543', '商务房', '2018-10-27 00:00:00', '2', '1', null, null, '已取消', null, null, '256', null, '收到');
INSERT INTO `bookingroom` VALUES ('NUM201810004446', '易成名', '18737101923', '情侣套房', '2018-10-23 00:00:00', '5', '4', null, null, '申请取消', null, null, '690', null, '');
INSERT INTO `bookingroom` VALUES ('NUM201810005449', '任我行', '15839004333', '总统套房', '2018-10-24 00:00:00', '1', '1', null, '小仙女', '无法预订', '房间已满', '0', '188', '2018-10-24 14:54:52', '总统套房\r\n');
INSERT INTO `bookingroom` VALUES ('NUM201810005898', 'zhangning', '15839004333', '家庭套房', '2018-10-24 00:00:00', '1', '3', null, '小仙女', '无法预订', '房间已满', '0', '138', '2018-10-24 11:12:14', '');
INSERT INTO `bookingroom` VALUES ('NUM201810005914', '张宁', '15839004333', '家庭套房', '2018-10-24 00:00:00', '1', '1', null, null, '已订单', null, null, '168', null, '');
INSERT INTO `bookingroom` VALUES ('NUM201810006046', '任我行', '15839004333', '商务房', '2018-10-27 00:00:00', '1', '1', null, '小仙女', '已入住', '预订成功', '107', '128', '2018-10-26 14:58:27', '');
INSERT INTO `bookingroom` VALUES ('NUM201810006150', 'DD', '15660003543', '行政房', '2018-10-27 00:00:00', '13', '1', null, '寇佬冶', '已入住', '预订成功', '603', '2054', '2018-10-27 11:57:46', '');
INSERT INTO `bookingroom` VALUES ('NUM201810006242', '线上预订', '18888888888', '行政房', '2018-10-27 00:00:00', '2', '1', null, null, '未确认', null, null, '316', null, '');
INSERT INTO `bookingroom` VALUES ('NUM201810006634', 'kk', '15660003543', '情侣大床房', '2018-10-27 00:00:00', '3', '1', null, '寇佬冶', '已入住', '预订成功', '201', '384', '2018-10-26 16:17:05', '');
INSERT INTO `bookingroom` VALUES ('NUM201810007993', 'aaa', '14111111111', '标准套房', '2018-10-27 00:00:00', '1', '1', null, null, '未确认', null, null, '128', null, 'sfgd');
INSERT INTO `bookingroom` VALUES ('NUM201810009060', 'Tom', '18339996220', '豪华单人间', '2018-10-23 00:00:00', '1', '1', null, null, '未确认', null, null, '168', null, '');
INSERT INTO `bookingroom` VALUES ('NUM201810009999', '张三', '15660003543', '行政房', '2018-10-27 00:00:00', '3', '1', null, '寇佬冶', '已入住', '预订成功', '505', '474', '2018-10-27 13:32:49', '');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userno` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('20', 'AAA0153', '18737101923', 'bFj8ZKyw4BEdYtaQcBRCHA==');
INSERT INTO `client` VALUES ('21', 'AAA0999', '18744444444', 'fDig/PwpdB05FyBkT5O27w==');
INSERT INTO `client` VALUES ('22', 'AAA0935', '18339996220', 'bFj8ZKyw4BEdYtaQcBRCHA==');
INSERT INTO `client` VALUES ('23', 'AAA0842', '15225098497', 'bFj8ZKyw4BEdYtaQcBRCHA==');
INSERT INTO `client` VALUES ('24', 'AAA0499', '18000000000', 'bFj8ZKyw4BEdYtaQcBRCHA==');
INSERT INTO `client` VALUES ('25', 'AAA0959', '15839004333', 'PihGOl10b24dQENupwgocw==');
INSERT INTO `client` VALUES ('26', 'AAA0615', '15660003543', 'Z1o4Z7027YZ9SAVRwQANxA==');
INSERT INTO `client` VALUES ('27', 'AAA0004', '13525625985', 'Z1o4Z7027YZ9SAVRwQANxA==');
INSERT INTO `client` VALUES ('28', 'AAA0434', '14111111111', 'fDig/PwpdB05FyBkT5O27w==');
INSERT INTO `client` VALUES ('29', 'AAA0867', '18888888888', 'bFj8ZKyw4BEdYtaQcBRCHA==');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptid` int(10) NOT NULL AUTO_INCREMENT COMMENT '部门号',
  `deptno` varchar(255) DEFAULT NULL,
  `deptname` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `deptlim` varchar(255) DEFAULT NULL COMMENT '部门权限',
  `deptstate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', 'D2018100999', '达阁至尊', '超级管理员易达阁', '使用中');
INSERT INTO `dept` VALUES ('2', 'D2018100001', '接待部', '接待顾客，登记住房信息', '使用中');
INSERT INTO `dept` VALUES ('3', 'D2018100002', '客房部', '管理房间信息，补充房间货物，打扫房间卫生', '使用中');
INSERT INTO `dept` VALUES ('4', 'D2018100003', '仓管部 ', '管理仓库的物品出库，入库及库存', '使用中');
INSERT INTO `dept` VALUES ('5', 'D2018100004', '人事部', '管理员工信息，管理顾客信息', '使用中');
INSERT INTO `dept` VALUES ('6', 'D2018100005', '后勤部', '负责酒店损耗设备的维护，房间损耗的维护', '使用中');
INSERT INTO `dept` VALUES ('7', 'D2018100006', '测试部', '测试各种不服', '注销');
INSERT INTO `dept` VALUES ('42', 'D2018108052', '达阁威武', '测试用\r\n部门名称无法编辑', '注销');
INSERT INTO `dept` VALUES ('43', 'D2018103036', '是', '是', '注销');
INSERT INTO `dept` VALUES ('44', 'D2018107116', '注销测试', '注销测试', '注销');
INSERT INTO `dept` VALUES ('45', 'D2018108650', '测试部1', '演示', '注销');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `empid` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工序号',
  `empno` varchar(30) DEFAULT NULL COMMENT '员工编号',
  `empname` varchar(25) DEFAULT NULL COMMENT '员工姓名',
  `empage` int(10) DEFAULT NULL COMMENT '员工年龄',
  `empsex` varchar(25) DEFAULT NULL COMMENT '员工性别',
  `empidcard` varchar(255) DEFAULT NULL COMMENT '员工身份证号',
  `emptel` varchar(255) DEFAULT NULL COMMENT '员工联系方式',
  `empadd` varchar(255) DEFAULT NULL COMMENT '员工住址',
  `emptype` varchar(255) DEFAULT NULL COMMENT '员工类型',
  `empwage` int(255) DEFAULT NULL COMMENT '员工月薪',
  `emptime` datetime DEFAULT NULL COMMENT '入职时间',
  `empstate` varchar(255) DEFAULT NULL COMMENT '在职状态',
  `empexit` datetime DEFAULT NULL COMMENT '离职时间',
  `deptno` varchar(255) DEFAULT NULL COMMENT '部门号',
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empid`),
  KEY `fk_deptid_dept_id` (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', 'EMP0001', '易达阁', '22', '男', '410000199601010010', '15225098497', '达阁次顶层', '达阁至尊', '99999', '2000-01-01 00:00:00', '在职', null, 'D2018100999', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('2', 'EMP0002', '陈诗书', '22', '男', '410000199601010010', '17777777777', '达阁次顶层', '经理', '66666', '2018-09-01 09:06:18', '在职', null, 'D2018100001', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('3', 'EMP0003', '寇佬冶', '24', '男', '410000199401010010', '15660003543', '达阁次顶层', '经理', '88888', '2001-10-01 00:00:00', '在职', null, 'D2018100002', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('4', 'EMP0004', '张尔烨', '21', '男', '410000199701010010', '13899999999', '达阁次顶层', '经理', '66666', '2010-10-01 00:00:00', '在职', null, 'D2018100003', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('5', 'EMP0005', '柳达业', null, '男', '410000199501010010', '18339996220', '达阁次顶层', '经理', '666888', '2010-01-01 00:00:00', '在职', null, 'D2018100004', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('6', 'EMP0006', '常嘟嘟', '25', '男', '410000199301018810', '15555555555', '达阁次顶层', '经理', '12000', '2015-10-01 00:00:00', '在职', null, 'D2018100005', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('7', 'EMP0007', '贾三水', null, '男', '410000199601010010', '15066665555', '达阁次顶层', '主管', null, '2018-10-13 16:10:40', '在职', null, 'D2018100005', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('34', 'EMP0008', '小姐姐', null, '女', '410000200001010010', '15566668888', '达阁酒店宿舍', '干事', null, '2018-10-15 10:25:47', '离职', '2018-10-23 08:50:26', 'D2018100003', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('35', 'EMP0009', '小仙女', null, '女', '410000199801010010', '123', '达阁酒店宿舍', '干事', null, '2018-10-15 10:26:47', '在职', null, 'D2018100006', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('36', 'EMP8717', '小妹妹', '18', '女', '410000199501010666', '18888888888', 'sss', '主管', '22222', '2018-10-18 14:36:21', '离职', '2018-10-18 15:10:55', 'D2018100006', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('37', 'EMP9886', '大嘟嘟', null, '男', '410000199501010088', '18888888888', '达阁酒店宿舍', '干事', null, '2018-10-18 16:08:20', '离职', '2018-10-20 17:39:00', 'D2018100006', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('38', 'EMP1974', '测试', null, '男', '410000199501010888', '18888885555', '升水', '干事', null, '2018-10-18 16:11:31', '离职', '2018-10-26 18:59:08', 'D2018100006', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('39', 'EMP3971', '大', null, '男', '410000199501010999', '18888800009', '达阁酒店宿舍', '干事', '2000', '2018-10-19 19:22:40', '离职', '2018-10-19 19:23:22', 'D2018100999', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('40', 'EMP9443', 'sss', null, '男', '410000199701010088', '18888885550', 'sdf ', '干事', null, '2018-10-22 19:12:50', '在职', null, 'D2018100006', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('41', 'EMP8934', '测试', null, '女', '410000199701017777', '18888885551', '达阁酒店员工宿舍', '干事', null, '2018-10-23 08:59:19', '离职', '2018-10-23 08:59:41', 'D2018100006', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('42', 'EMP9336', '旭旭宝宝', null, '男', '311231199210112354', '13211251111', '山东廊坊', '主管', null, '2018-10-26 08:19:28', '在职', null, 'D2018100002', 'VLqNXg1GE15wdISs1DKDXw==');
INSERT INTO `emp` VALUES ('43', 'EMP0015', '德生科技发货呢', null, '男', '411481199711099134', '15648845845', '郑州', '干事', null, '2018-10-27 12:09:27', '在职', null, 'D2018100004', 'mjavcq+HRpZUBQyd/R3y4g==');
INSERT INTO `emp` VALUES ('44', 'EMP0451', '张三', null, '男', '410000199701017777', '18888885551', '郑州', '干事', null, '2018-10-29 13:59:22', '在职', null, 'D2018100001', 'VLqNXg1GE15wdISs1DKDXw==');

-- ----------------------------
-- Table structure for goodsuse
-- ----------------------------
DROP TABLE IF EXISTS `goodsuse`;
CREATE TABLE `goodsuse` (
  `roomid` int(10) NOT NULL AUTO_INCREMENT COMMENT '房间编号',
  `userid
userid` int(10) DEFAULT NULL COMMENT '顾客编号',
  `goodsid` int(11) DEFAULT NULL COMMENT '商品编号',
  `goodsname` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `goodsprice` double(10,0) DEFAULT NULL COMMENT '商品价格',
  `usenum` int(10) DEFAULT NULL COMMENT '消费数量',
  `useTime` datetime DEFAULT NULL COMMENT '消费时间',
  `empid` int(10) DEFAULT NULL COMMENT '操作员编号',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsuse
-- ----------------------------

-- ----------------------------
-- Table structure for nowregister
-- ----------------------------
DROP TABLE IF EXISTS `nowregister`;
CREATE TABLE `nowregister` (
  `number` int(11) NOT NULL AUTO_INCREMENT COMMENT '入住登记编号',
  `roomid` int(11) NOT NULL COMMENT '房间号',
  `cusname` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `cussex` varchar(255) DEFAULT NULL COMMENT '客户性别',
  `custel` varchar(255) DEFAULT NULL COMMENT '客户手机号',
  `idcardtype` varchar(255) DEFAULT NULL COMMENT '身份证类型',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `roomtype` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `roomprice` int(11) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL COMMENT '入住时间',
  `days` int(11) DEFAULT NULL,
  `roompricesum` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT NULL COMMENT '押金',
  PRIMARY KEY (`number`),
  KEY `roomid_idx` (`roomid`),
  KEY `roomtype_idx` (`roomtype`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nowregister
-- ----------------------------
INSERT INTO `nowregister` VALUES ('28', '205', '李四', '男', '13462677471', '身份证', '411222199811011624', '豪华单人间', '118', '2018-10-26 08:11:30', '5', '900', '300');
INSERT INTO `nowregister` VALUES ('31', '202', '寇明浩', '男', '15660003543', '身份证', '411323199607256906', '情侣套房', '138', '2018-10-26 08:27:17', '6', '828', '500');
INSERT INTO `nowregister` VALUES ('32', '202', '李四', '男', '13216352223', '身份证', '324412199601252231', '情侣套房', '138', '2018-10-26 08:27:17', '6', '828', '500');
INSERT INTO `nowregister` VALUES ('35', '1201', 'dage', '女', '13515454454', '身份证', '411222199811011622', '总统套房', '188', '2018-10-26 18:46:20', '6', '1128', '100');
INSERT INTO `nowregister` VALUES ('36', '208', '柳丨', '男', '13457437772', '身份证', '233145199810273347', '豪华单人间', '118', '2018-10-26 20:24:00', '10', '1260', '300');
INSERT INTO `nowregister` VALUES ('37', '208', '柳丨丨', '女', '1345678234', '身份证', '233156199701231123', '豪华单人间', '118', '2018-10-26 20:24:00', '10', '1260', '300');
INSERT INTO `nowregister` VALUES ('38', '306', '张三', '男', '15642345884', '身份证', '233145198710234356', '标准套房', '128', '2018-10-27 11:58:32', '18', '2304', '300');
INSERT INTO `nowregister` VALUES ('39', '505', '张三一', '男', '13425748972', '身份证', '342155198709231123', '行政房', '158', '2018-10-27 13:34:31', '7', '1106', '300');
INSERT INTO `nowregister` VALUES ('40', '505', '张三二', '男', '13456782342', '身份证', '325333196901231456', '行政房', '158', '2018-10-27 13:34:31', '7', '1106', '300');

-- ----------------------------
-- Table structure for purchasestore
-- ----------------------------
DROP TABLE IF EXISTS `purchasestore`;
CREATE TABLE `purchasestore` (
  `sid` int(255) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ordernum` varchar(255) DEFAULT NULL COMMENT '采购编号',
  `goodsid` int(11) DEFAULT NULL COMMENT '物品编号',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '物品名称',
  `goodtype` varchar(255) DEFAULT NULL COMMENT '物品类型',
  `innum` int(11) DEFAULT NULL COMMENT '物品数量',
  `empname` varchar(255) NOT NULL COMMENT '经办人姓名',
  `inprice` int(200) DEFAULT NULL,
  `suplieer` varchar(255) DEFAULT NULL COMMENT '供货商',
  `suptel` varchar(255) DEFAULT NULL COMMENT '供货商联系方式',
  `submittime` datetime DEFAULT NULL COMMENT '申请时间',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `rejecttext` varchar(255) DEFAULT NULL,
  `disposetime` datetime DEFAULT NULL,
  `handname` varchar(255) DEFAULT NULL COMMENT '审核人',
  `status` int(255) DEFAULT '1' COMMENT '状态(删除时使用)',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchasestore
-- ----------------------------
INSERT INTO `purchasestore` VALUES ('185', 'kh201810266471', '2', '怡宝矿泉水', '食品类', '100', '小仙女', '2', '金水批发市场', '15839004222', '2018-10-26 16:42:45', '已采购', null, '2018-10-26 16:42:57', '小仙女', '1');
INSERT INTO `purchasestore` VALUES ('186', 'kh201810267425', '1', '冰红茶', '食品类', '100', '小仙女', '20', '金水区批发市场', '15839004222', '2018-10-26 16:42:45', '已采购', null, '2018-10-26 16:43:01', '小仙女', '1');
INSERT INTO `purchasestore` VALUES ('187', 'kh201810269248', '3', '双汇火腿肠', '食品类', '150', '小仙女', '50', '金水批发市场', '15656454545', '2018-10-26 16:44:57', '已采购', null, '2018-10-26 16:45:12', '小仙女', '1');
INSERT INTO `purchasestore` VALUES ('188', 'kh201810262066', '4', '康师傅红烧牛肉面', '食品类', '150', '小仙女', '50', '金水区批发市场', '15656454545', '2018-10-26 16:45:03', '已采购', null, '2018-10-26 16:45:15', '小仙女', '1');
INSERT INTO `purchasestore` VALUES ('209', 'kh201810293023', '1', '冰红茶', '食品类', '100', '小仙女', '2', '金水区批发市场', '15839004222', '2018-10-29 13:50:17', '已采购', null, '2018-10-29 13:51:01', '小仙女', '1');
INSERT INTO `purchasestore` VALUES ('210', 'kh201810295827', '2', '怡宝矿泉水', '食品类', '100', '小仙女', '2', '金水批发市场', '15839004222', '2018-10-29 13:50:40', '已采购', null, '2018-10-29 13:51:24', '小仙女', '1');
INSERT INTO `purchasestore` VALUES ('211', 'kh201810299531', '3', '双汇火腿肠', '食品类', '50', '小仙女', '50', '金水批发市场', '15656454545', '2018-10-29 13:50:40', '已采购', null, '2018-10-29 13:51:28', '小仙女', '1');
INSERT INTO `purchasestore` VALUES ('212', 'kh201810295820', '4', '康师傅红烧牛肉面', '食品类', '100', '小仙女', '50', '金水区批发市场', '15656454545', '2018-10-29 13:50:40', '已驳回', '价钱太高', '2018-10-29 13:51:16', '小仙女', '1');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `number` int(11) NOT NULL AUTO_INCREMENT COMMENT '入住登记编号',
  `roomid` int(11) NOT NULL COMMENT '房间号',
  `cusname` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `cussex` varchar(255) DEFAULT NULL COMMENT '客户性别',
  `custel` varchar(255) DEFAULT NULL COMMENT '客户手机号',
  `idcardtype` varchar(255) DEFAULT NULL COMMENT '身份证类型',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `roomtype` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `roomprice` int(11) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL COMMENT '入住时间',
  `endtime` datetime DEFAULT NULL COMMENT '入住时长',
  `days` int(11) DEFAULT NULL,
  `roompricesum` int(11) DEFAULT NULL,
  `roomuse` int(11) DEFAULT NULL COMMENT '押金',
  `ordernum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `roomid_idx` (`roomid`),
  KEY `roomtype_idx` (`roomtype`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES ('29', '1101', '易狗', '男', '1383838387438', '身份证', '411323198910112548', '商务房', '128', '2018-10-17 06:09:13', '2018-10-26 08:29:49', '9', '1100', null, 'ROOM201810261101');
INSERT INTO `register` VALUES ('30', '701', '展示干', '男', '15660003542', '身份证', '321333198709166783', '情侣套房', '138', '2018-10-26 04:19:14', '2018-10-26 16:21:08', '0', '0', null, 'ROOM20181026701');
INSERT INTO `register` VALUES ('31', '301', '柳川', '男', '13213284413', '身份证', '432111199410256317', '情侣大床房', '128', '2018-10-26 08:12:39', '2018-10-27 13:06:26', '1', '128', null, 'ROOM20181027301');
INSERT INTO `register` VALUES ('32', '301', '柳夫人', '女', '13215124254', '身份证', '411320200110266357', '情侣大床房', '128', '2018-10-26 08:12:39', '2018-10-27 13:06:26', '1', '128', null, 'ROOM20181027301');
INSERT INTO `register` VALUES ('33', '107', '任我行', '男', '15839004333', '身份证', '411481199611088459', '商务房', '128', '2018-10-26 03:00:26', '2018-10-27 13:38:25', '1', '128', null, 'ROOM20181027107');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间编号',
  `roomid` int(11) NOT NULL,
  `roomtype` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `roomstate` varchar(255) DEFAULT NULL COMMENT '房间状态',
  `roomprice` int(11) DEFAULT NULL COMMENT '房间价格',
  `roomcash` int(11) DEFAULT NULL COMMENT '房间押金',
  `roommanage` varchar(20) DEFAULT NULL,
  `managephone` varchar(45) DEFAULT NULL,
  `roompicpath` varchar(250) DEFAULT NULL,
  `roompicname` varchar(45) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`roomid`),
  KEY `roomid_idx` (`roomid`),
  KEY `roomtype_idx` (`roomtype`),
  KEY `roomcash` (`roomcash`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '101', '家庭套房', '空闲', '168', '200', '旭旭宝宝', '13211251111', 'files/5d260d32-e94b-451a-bbaf-c1715bb16f08.jpg', 'flower1.jpg', '空调间，有窗');
INSERT INTO `room` VALUES ('2', '102', '家庭套房', '打扫中', '168', '200', '寇佬冶', '15660003543', 'files/e8cfa9ed-0757-4517-9643-8c55a0e6427d.jpg', 'flower3.jpg', '大床房，电视间');
INSERT INTO `room` VALUES ('3', '103', '情侣大床房', '已预订', '128', '200', '寇佬冶', '15660003543', 'files/8f191be3-c9ac-418b-8ad7-7f3c0deea691.jpg', 'flower7.jpg', '电脑房');
INSERT INTO `room` VALUES ('4', '105', '总统套房', '已预订', '188', '200', '寇佬冶', '15660003543', 'files/6dce2b1b-2170-4d8f-b213-61884c3f6d58.jpg', 'flower8.jpg', '空调间');
INSERT INTO `room` VALUES ('5', '106', '家庭套房', '空闲', '168', '200', '寇佬冶', '15660003543', 'files/5d19f85e-1279-446e-a046-c689bbc3f554.jpg', 'flower9.jpg', '空调间，有窗');
INSERT INTO `room` VALUES ('6', '107', '商务房', '空闲', '128', '200', '寇佬冶', '15660003543', 'files/c6eb660a-9fc2-4bfa-bcd3-c2afdbebad67.jpg', 'flower3.jpg', '电脑房');
INSERT INTO `room` VALUES ('13', '202', '情侣套房', '已入住', '138', '200', '寇佬冶', '15660003543', 'files/870dcbbd-93b6-4b72-8c09-6d055271a80e.jpg', 'flower8.jpg', '情侣专用');
INSERT INTO `room` VALUES ('14', '203', '家庭套房', '打扫中', '168', '200', '寇佬冶', '15660003543', 'files/db3b55fc-88f6-49da-8430-033303961ccb.jpg', 'flower8.jpg', '高配置');
INSERT INTO `room` VALUES ('15', '205', '豪华单人间', '已入住', '118', '200', '寇佬冶', '15660003543', 'files/7a8c304f-8b0c-45ec-b6ad-27931ac0b2f5.jpg', 'flower8.jpg', '双人间');
INSERT INTO `room` VALUES ('16', '206', '行政房', '空闲', '158', '200', '寇佬冶', '15660003543', 'files/e31e4059-c511-4f0f-b630-336eb173d81a.jpg', 'flower8.jpg', '大床房');
INSERT INTO `room` VALUES ('17', '208', '豪华单人间', '已入住', '118', '200', '寇佬冶', '15660003543', 'files/6c605b0c-2322-4882-944d-67c524051cf3.jpg', 'flower1.jpg', '阿斯达');
INSERT INTO `room` VALUES ('19', '301', '情侣大床房', '维修中', '128', '200', '寇佬冶', '15660003543', 'files/3f8e7af9-97a8-479f-8220-b3a8dfec2bcb.jpg', 'flower12.jpg', '测试');
INSERT INTO `room` VALUES ('33', '403', '总统套房', '打扫中', '188', '200', '寇佬冶', '15660003543', 'files/129cf4cf-bcfa-4c66-a1cd-cdbb452d7ad6.jpg', 'flower1.jpg', '123');
INSERT INTO `room` VALUES ('34', '1101', '商务房', '空闲', '128', '200', '寇佬冶', '15660003543', 'files/a1177d41-2b4d-495b-8552-7fe67ba9290f.jpg', 'flower1.jpg', 'hello world');
INSERT INTO `room` VALUES ('35', '1201', '总统套房', '已入住', '188', '200', '寇佬冶', '15660003543', 'files/6e24f8e9-2164-4ec2-9af7-955618a1b660.jpg', 'flower7.jpg', 'hello world');
INSERT INTO `room` VALUES ('36', '306', '标准套房', '已入住', '128', '200', '寇佬冶', '15660003543', 'files/293010c5-12ed-4a16-8dbf-9ba78830dccc.jpg', 'flower7.jpg', '标间');
INSERT INTO `room` VALUES ('37', '606', '标准套房', '空闲', '128', '200', '寇佬冶', '15660003543', 'files/7776efe6-de18-46f3-9c79-efd36197f504.jpg', 'flower7.jpg', '标间');
INSERT INTO `room` VALUES ('38', '701', '情侣套房', '空闲', '138', '200', '寇佬冶', '15660003543', 'files/df15c8fd-a41e-4691-967e-901b3a234f73.jpg', 'flower4.jpg', '情侣专用');
INSERT INTO `room` VALUES ('39', '603', '行政房', '空闲', '158', '200', '寇佬冶', '15660003543', 'files/abb1a8b4-1f46-4513-bb31-6a7559e18568.jpg', 'flower6.jpg', '行政');
INSERT INTO `room` VALUES ('40', '505', '行政房', '已入住', '158', '200', '寇佬冶', '15660003543', 'files/ba2f23da-9359-4ce7-8dc5-5d66f45aace4.jpg', 'flower12.jpg', '行政');
INSERT INTO `room` VALUES ('41', '502', '情侣套房', '空闲', '138', '200', '寇佬冶', '15660003543', 'files/bb76b131-3400-4fbe-a243-c2000ae8b41a.jpg', 'flower6.jpg', '情侣专用');
INSERT INTO `room` VALUES ('42', '209', '豪华单人间', '空闲', '118', '200', '寇佬冶', '15660003543', 'files/313e1f90-4ce8-4394-912c-25d26e7761fa.jpg', 'flower6.jpg', '单人');
INSERT INTO `room` VALUES ('43', '1202', '标准套房', '空闲', '128', '200', '旭旭宝宝', '13211251111', 'files/13a142fc-0d9b-4f1e-95f3-32100d57aadc.jpg', 'flower2.jpg', '123');
INSERT INTO `room` VALUES ('44', '201', '情侣大床房', '空闲', '128', '200', '旭旭宝宝', '13211251111', 'files/cb3f5040-aedb-4249-ae63-364bfc3bbd0e.jpg', 'flower2.jpg', '嘿嘿');
INSERT INTO `room` VALUES ('45', '1301', '商务房', '空闲', '128', '200', '旭旭宝宝', '13211251111', 'files/6f591e14-e340-4cf4-ba33-c9c0c7b0a669.txt', '省市县sql.txt', '123');
INSERT INTO `room` VALUES ('46', '702', '家庭套房', '空闲', '168', '200', '寇佬冶', '15660003543', 'files/517d64d8-26d9-44c7-bce3-ea6104317372.jsp', 'login2.jsp', '123');

-- ----------------------------
-- Table structure for roomchange
-- ----------------------------
DROP TABLE IF EXISTS `roomchange`;
CREATE TABLE `roomchange` (
  `number` int(11) NOT NULL AUTO_INCREMENT COMMENT '入住登记编号',
  `oldroomid` int(11) NOT NULL COMMENT '房间号',
  `changeroomid` int(11) DEFAULT NULL,
  `cusname` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `cussex` varchar(255) DEFAULT NULL COMMENT '客户性别',
  `custel` varchar(255) DEFAULT NULL COMMENT '客户手机号',
  `idcardtype` varchar(255) DEFAULT NULL COMMENT '身份证类型',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `oldroomtype` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `oldroomprice` int(11) DEFAULT NULL,
  `changetime` datetime DEFAULT NULL COMMENT '入住时间',
  `days` int(11) DEFAULT NULL,
  `roompricesum` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT NULL COMMENT '押金',
  `changeroomtype` varchar(45) DEFAULT NULL,
  `changeroomprice` int(11) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `roomid_idx` (`oldroomid`),
  KEY `roomtype_idx` (`oldroomtype`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomchange
-- ----------------------------
INSERT INTO `roomchange` VALUES ('36', '208', '1101', '易狗', '男', '1383838387438', '身份证', '411323198910112548', '豪华单人间', '100', '2018-10-26 08:10:14', '30', '3788', null, '商务房', '128');
INSERT INTO `roomchange` VALUES ('37', '107', '202', '寇明浩', '男', '15660003543', '身份证', '411323199607256906', '商务房', '128', '2018-10-26 08:28:40', '3', '414', null, '情侣套房', '138');
INSERT INTO `roomchange` VALUES ('38', '107', '202', '李四', '男', '13216352223', '身份证', '324412199601252231', '商务房', '128', '2018-10-26 08:28:40', '3', '414', null, '情侣套房', '138');
INSERT INTO `roomchange` VALUES ('39', '205', '208', '李四', '男', '13462677471', '身份证', '411222199811011624', '豪华单人间', '118', '2018-10-26 09:12:09', '5', '655', null, '豪华单人间', '118');
INSERT INTO `roomchange` VALUES ('40', '208', '205', '李四', '男', '13462677471', '身份证', '411222199811011624', '豪华单人间', '118', '2018-10-26 09:14:21', '5', '745', null, '豪华单人间', '118');
INSERT INTO `roomchange` VALUES ('41', '205', '208', '李四', '男', '13462677471', '身份证', '411222199811011624', '豪华单人间', '118', '2018-10-26 09:15:15', '5', '885', null, '豪华单人间', '118');
INSERT INTO `roomchange` VALUES ('42', '208', '205', '李四', '男', '13462677471', '身份证', '411222199811011624', '豪华单人间', '118', '2018-10-26 09:17:33', '5', '900', null, '豪华单人间', '118');
INSERT INTO `roomchange` VALUES ('43', '201', '701', '展示干', '男', '15660003542', '身份证', '321333198709166783', '情侣大床房', '128', '2018-10-26 16:19:40', '3', '594', null, '情侣套房', '138');
INSERT INTO `roomchange` VALUES ('44', '203', '1201', 'dage', '女', '13515454454', '身份证', '411222199811011622', '家庭套房', '168', '2018-10-26 18:47:09', '5', '630', null, '总统套房', '188');
INSERT INTO `roomchange` VALUES ('45', '403', '102', '柳丨', '男', '13457437772', '身份证', '233145199810273347', '总统套房', '188', '2018-10-26 20:24:41', '10', '1680', null, '家庭套房', '168');
INSERT INTO `roomchange` VALUES ('46', '403', '102', '柳丨丨', '女', '1345678234', '身份证', '233156199701231123', '总统套房', '188', '2018-10-26 20:24:41', '10', '1680', null, '家庭套房', '168');
INSERT INTO `roomchange` VALUES ('47', '603', '306', '张三', '男', '15642345884', '身份证', '233145198710234356', '行政房', '158', '2018-10-27 11:59:32', '18', '2304', null, '标准套房', '128');
INSERT INTO `roomchange` VALUES ('48', '102', '208', '柳丨', '男', '13457437772', '身份证', '233145199810273347', '家庭套房', '168', '2018-10-27 13:37:36', '10', '1260', null, '豪华单人间', '118');
INSERT INTO `roomchange` VALUES ('49', '102', '208', '柳丨丨', '女', '1345678234', '身份证', '233156199701231123', '家庭套房', '168', '2018-10-27 13:37:36', '10', '1260', null, '豪华单人间', '118');

-- ----------------------------
-- Table structure for roomconsum
-- ----------------------------
DROP TABLE IF EXISTS `roomconsum`;
CREATE TABLE `roomconsum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` int(11) DEFAULT NULL,
  `goods` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  `opemp` varchar(255) DEFAULT NULL,
  `goodsid` varchar(255) DEFAULT NULL,
  `ordernum` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomconsum
-- ----------------------------
INSERT INTO `roomconsum` VALUES ('42', '101', '沐浴露', '100', '5', '2018-10-20 08:29:58', '寇佬冶', '8', 'ROOM20181020101');
INSERT INTO `roomconsum` VALUES ('43', '101', '洗发露', '100', '1', '2018-10-20 08:29:58', '寇佬冶', '7', 'ROOM20181020101');
INSERT INTO `roomconsum` VALUES ('44', '101', '洗发露', '100', '1', '2018-10-20 08:34:27', '寇佬冶', '7', 'ROOM20181020101');
INSERT INTO `roomconsum` VALUES ('45', '106', '怡宝矿泉水', '3', '1', '2018-10-22 19:16:40', '小仙女', '2', 'ROOM20181022106');
INSERT INTO `roomconsum` VALUES ('46', '103', '杜蕾斯避孕套', '30', '10', '2018-10-22 19:19:50', '小仙女', '1', 'ROOM20181022103');
INSERT INTO `roomconsum` VALUES ('47', '205', '怡宝矿泉水', '3', '5', '2018-10-26 09:12:09', '小仙女', '2', 'ROOM20181026205');
INSERT INTO `roomconsum` VALUES ('48', '205', '洗发露', '50', '1', '2018-10-26 09:12:09', '小仙女', '9', 'ROOM20181026205');
INSERT INTO `roomconsum` VALUES ('49', '208', '怡宝矿泉水', '3', '1', '2018-10-26 09:14:21', '小仙女', '2', 'ROOM20181026208');
INSERT INTO `roomconsum` VALUES ('50', '208', '沐浴露', '40', '2', '2018-10-26 09:14:21', '小仙女', '8', 'ROOM20181026208');
INSERT INTO `roomconsum` VALUES ('51', '208', '牙膏', '7', '1', '2018-10-26 09:14:21', '小仙女', '13', 'ROOM20181026208');
INSERT INTO `roomconsum` VALUES ('52', '205', '杜蕾斯避孕套', '30', '2', '2018-10-26 09:15:15', '小仙女', '1', 'ROOM20181026205');
INSERT INTO `roomconsum` VALUES ('53', '205', '沐浴露', '40', '2', '2018-10-26 09:15:15', '小仙女', '8', 'ROOM20181026205');
INSERT INTO `roomconsum` VALUES ('54', '208', '怡宝矿泉水', '3', '5', '2018-10-26 09:17:33', '小仙女', '2', 'ROOM20181026208');
INSERT INTO `roomconsum` VALUES ('55', '201', '冰红茶', '30', '6', '2018-10-26 16:19:40', '寇佬冶', '1', 'ROOM20181026201');
INSERT INTO `roomconsum` VALUES ('56', '203', '怡宝矿泉水', '3', '10', '2018-10-26 18:47:09', '小仙女', '2', 'ROOM20181026203');
INSERT INTO `roomconsum` VALUES ('57', '203', '洗发露', '50', '10', '2018-10-26 18:47:09', '小仙女', '9', 'ROOM20181026203');
INSERT INTO `roomconsum` VALUES ('58', '301', '冰红茶', '3', '1', '2018-10-27 13:06:26', '小仙女', '1', 'ROOM20181027301');
INSERT INTO `roomconsum` VALUES ('59', '102', '冰红茶', '3', '10', '2018-10-27 13:37:35', '寇佬冶', '1', 'ROOM20181027102');
INSERT INTO `roomconsum` VALUES ('60', '107', '怡宝矿泉水', '3', '10', '2018-10-27 13:38:25', '寇佬冶', '2', 'ROOM20181027107');
INSERT INTO `roomconsum` VALUES ('61', '107', '沐浴露', '40', '2', '2018-10-27 13:38:25', '寇佬冶', '8', 'ROOM20181027107');

-- ----------------------------
-- Table structure for roomloss
-- ----------------------------
DROP TABLE IF EXISTS `roomloss`;
CREATE TABLE `roomloss` (
  `roomid` int(11) DEFAULT NULL COMMENT '房间编号',
  `goodsid` int(11) NOT NULL COMMENT '物品编号',
  `goodsname` varchar(45) DEFAULT NULL,
  `losstime` datetime NOT NULL COMMENT '损耗时间',
  `lossnum` int(11) DEFAULT NULL COMMENT '损耗数量',
  `addtime` datetime DEFAULT NULL COMMENT '补货时间',
  `addempid` varchar(50) DEFAULT NULL COMMENT '补货员工编号',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomloss
-- ----------------------------
INSERT INTO `roomloss` VALUES ('208', '2', '怡宝矿泉水', '2018-10-26 09:17:33', '5', '2018-10-26 09:30:22', '小仙女', '3');
INSERT INTO `roomloss` VALUES ('201', '1', '冰红茶', '2018-10-26 16:19:40', '6', '2018-10-27 13:11:09', '小仙女', '4');
INSERT INTO `roomloss` VALUES ('203', '2', '怡宝矿泉水', '2018-10-26 18:47:09', '10', '2018-10-26 20:26:42', '寇佬冶', '5');
INSERT INTO `roomloss` VALUES ('203', '9', '洗发露', '2018-10-26 18:47:09', '10', '2018-10-26 20:26:42', '寇佬冶', '6');
INSERT INTO `roomloss` VALUES ('301', '1', '冰红茶', '2018-10-27 13:06:26', '1', null, null, '7');
INSERT INTO `roomloss` VALUES ('102', '1', '冰红茶', '2018-10-27 13:37:35', '10', null, null, '8');
INSERT INTO `roomloss` VALUES ('107', '2', '怡宝矿泉水', '2018-10-27 13:38:25', '10', null, null, '9');
INSERT INTO `roomloss` VALUES ('107', '8', '沐浴露', '2018-10-27 13:38:25', '2', null, null, '10');

-- ----------------------------
-- Table structure for roomserv
-- ----------------------------
DROP TABLE IF EXISTS `roomserv`;
CREATE TABLE `roomserv` (
  `servid` int(11) NOT NULL AUTO_INCREMENT COMMENT '维护id',
  `servno` varchar(20) DEFAULT NULL COMMENT '维修编号',
  `roomid` varchar(255) DEFAULT NULL COMMENT '维修房间号',
  `servgoods` varchar(255) DEFAULT NULL COMMENT '维修物品',
  `servcause` varchar(255) DEFAULT NULL COMMENT '维修原因',
  `servtime` datetime DEFAULT NULL COMMENT '维修时间',
  `servstate` varchar(255) DEFAULT '未处理' COMMENT '维修状态',
  `empname` varchar(45) DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`servid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomserv
-- ----------------------------
INSERT INTO `roomserv` VALUES ('19', 'VX201810266435', '208', '床', '			床坏了	', '2018-10-26 08:30:52', '已处理', '张尔烨', '2018-10-26 08:31:07');
INSERT INTO `roomserv` VALUES ('20', 'VX201810267051', '701', '床', '床湿了				', '2018-10-26 20:25:31', '已处理', '张尔烨', '2018-10-26 20:25:54');
INSERT INTO `roomserv` VALUES ('21', 'VX201810271925', '1101', '23', '22', '2018-10-27 12:00:03', '已处理', '张尔烨', '2018-10-27 12:00:24');
INSERT INTO `roomserv` VALUES ('22', 'VX201810277600', '301', '床', '床湿了	', '2018-10-27 13:06:50', '未处理', '张尔烨', null);

-- ----------------------------
-- Table structure for roomtype
-- ----------------------------
DROP TABLE IF EXISTS `roomtype`;
CREATE TABLE `roomtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomtype` varchar(45) DEFAULT NULL,
  `roomprice` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT NULL COMMENT '押金',
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomtype
-- ----------------------------
INSERT INTO `roomtype` VALUES ('1', '家庭套房', '168', '200', '使用中');
INSERT INTO `roomtype` VALUES ('2', '总统套房', '188', '200', '使用中');
INSERT INTO `roomtype` VALUES ('3', '标准套房', '128', '200', '使用中');
INSERT INTO `roomtype` VALUES ('4', '情侣套房', '138', '200', '使用中');
INSERT INTO `roomtype` VALUES ('5', '豪华单人间', '118', '200', '使用中');
INSERT INTO `roomtype` VALUES ('6', '情侣大床房', '128', '200', '使用中');
INSERT INTO `roomtype` VALUES ('7', '行政房', '158', '200', '使用中');
INSERT INTO `roomtype` VALUES ('8', '商务房', '128', '200', '停用');
INSERT INTO `roomtype` VALUES ('10', '测试', '200', '200', '停用');
INSERT INTO `roomtype` VALUES ('11', '超级大宝剑', '8888', '666', '停用');

-- ----------------------------
-- Table structure for stayover
-- ----------------------------
DROP TABLE IF EXISTS `stayover`;
CREATE TABLE `stayover` (
  `number` int(11) NOT NULL AUTO_INCREMENT COMMENT '入住登记编号',
  `roomid` int(11) NOT NULL COMMENT '房间号',
  `cusname` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `cussex` varchar(255) DEFAULT NULL COMMENT '客户性别',
  `custel` varchar(255) DEFAULT NULL COMMENT '客户手机号',
  `idcardtype` varchar(255) DEFAULT NULL COMMENT '身份证类型',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `roomtype` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `roomprice` int(11) DEFAULT NULL,
  `staytime` datetime DEFAULT NULL COMMENT '入住时间',
  `stayroomprice` int(11) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `staydays` int(11) DEFAULT NULL,
  PRIMARY KEY (`number`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  KEY `roomid_idx` (`roomid`),
  KEY `roomtype_idx` (`roomtype`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stayover
-- ----------------------------
INSERT INTO `stayover` VALUES ('18', '202', '寇明浩', '男', '15660003543', '身份证', '411323199607256906', '情侣套房', '138', '2018-10-26 08:29:06', '414', '2018-10-26 08:27:17', '3');
INSERT INTO `stayover` VALUES ('19', '202', '李四', '男', '13216352223', '身份证', '324412199601252231', '情侣套房', '138', '2018-10-26 08:29:06', '414', '2018-10-26 08:27:17', '3');
INSERT INTO `stayover` VALUES ('20', '701', '展示干', '男', '15660003542', '身份证', '321333198709166783', '情侣套房', '138', '2018-10-26 16:20:39', '1104', '2018-10-26 04:19:14', '8');
INSERT INTO `stayover` VALUES ('21', '1201', 'dage', '女', '13515454454', '身份证', '411222199811011622', '总统套房', '188', '2018-10-26 18:47:25', '188', '2018-10-26 06:46:20', '1');
INSERT INTO `stayover` VALUES ('22', '403', '柳丨', '男', '13457437772', '身份证', '233145199810273347', '总统套房', '188', '2018-10-26 20:24:22', '564', '2018-10-26 08:24:00', '3');
INSERT INTO `stayover` VALUES ('23', '403', '柳丨丨', '女', '1345678234', '身份证', '233156199701231123', '总统套房', '188', '2018-10-26 20:24:22', '564', '2018-10-26 08:24:00', '3');
INSERT INTO `stayover` VALUES ('24', '603', '张三', '男', '15642345884', '身份证', '233145198710234356', '行政房', '158', '2018-10-27 11:58:36', '316', '2018-10-27 11:58:32', '2');
INSERT INTO `stayover` VALUES ('25', '603', '张三', '男', '15642345884', '身份证', '233145198710234356', '行政房', '158', '2018-10-27 11:59:02', '474', '2018-10-27 11:58:32', '3');
INSERT INTO `stayover` VALUES ('26', '505', '张三一', '男', '13425748972', '身份证', '342155198709231123', '行政房', '158', '2018-10-27 13:35:28', '632', '2018-10-27 01:34:31', '4');
INSERT INTO `stayover` VALUES ('27', '505', '张三二', '男', '13456782342', '身份证', '325333196901231456', '行政房', '158', '2018-10-27 13:35:28', '632', '2018-10-27 01:34:31', '4');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `sid` int(255) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `goodsid` int(11) NOT NULL DEFAULT '0' COMMENT '物品编号',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '物品名称',
  `goodtype` varchar(255) DEFAULT NULL COMMENT '物品类型',
  `gooduse` varchar(255) DEFAULT NULL,
  `goodsnum` int(11) DEFAULT '0' COMMENT '物品数量',
  `inprice` int(11) DEFAULT NULL COMMENT '物品进价',
  `sellprice` double DEFAULT NULL COMMENT '物品售价',
  `suplieer` varchar(255) DEFAULT NULL,
  `suptel` varchar(255) DEFAULT NULL COMMENT '供货商联系方式',
  `empname` varchar(255) DEFAULT NULL,
  `status` int(255) NOT NULL DEFAULT '1' COMMENT '状态(删除数据时使用)',
  PRIMARY KEY (`sid`,`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('16', '1', '冰红茶', '食品类', '房间消费品', '330', '2', '3', '金水区批发市场', '15839004222', '小仙女', '1');
INSERT INTO `store` VALUES ('17', '2', '怡宝矿泉水', '食品类', '房间消费品', '140', '2', '3', '金水批发市场', '15839004222', '小仙女', '1');
INSERT INTO `store` VALUES ('18', '3', '双汇火腿肠', '食品类', '房间消费品', '50', '50', '60', '金水批发市场', '15656454545', '小仙女', '1');
INSERT INTO `store` VALUES ('19', '4', '康师傅红烧牛肉面', '食品类', '食品类', '100', '50', '60', '金水区批发市场', '15656454545', '小仙女', '1');
INSERT INTO `store` VALUES ('20', '5', '床单', '床上用品类', '床上用品类', '100', '50', '50', '金水批发市场', '15839004222', '小仙女', '1');
INSERT INTO `store` VALUES ('21', '6', '被罩', '床上用品类', '床上用品类', '100', '30', '40', '金水批发市场', '15656454545', '小仙女', '1');
INSERT INTO `store` VALUES ('22', '7', '被子', '床上用品类', '床上用品类', '100', '50', '60', '金水批发市场', '15656454545', '小仙女', '1');
INSERT INTO `store` VALUES ('23', '8', '沐浴露', '洗漱用品类', '房间消费品', '50', '30', '40', '金水批发市场', '15656454545', '小仙女', '1');
INSERT INTO `store` VALUES ('24', '9', '洗发露', '洗漱用品类', '房间消费品', '40', '40', '50', '金水批发市场', '15656454545', '李四', '1');
INSERT INTO `store` VALUES ('25', '10', '牙刷', '洗漱用品类', '房间消费品', '100', '100', '1', '金水批发市场', '15656454545', '小仙女', '1');
INSERT INTO `store` VALUES ('26', '11', '护发素', '洗漱用品类', '房间消费品', '100', '20', '30', '金水批发市场', '15656454545', '李四', '1');
INSERT INTO `store` VALUES ('27', '12', '吹风机', '生活用品类', '床上用品类', '150', '50', '60', '金水批发市场', '15656454545', '小仙女', '1');
INSERT INTO `store` VALUES ('28', '13', '牙膏', '洗漱用品类', '房间消费品', '150', '6', '7', '金水批发市场', '15656454545', '小仙女', '1');

-- ----------------------------
-- Table structure for storein
-- ----------------------------
DROP TABLE IF EXISTS `storein`;
CREATE TABLE `storein` (
  `sid` int(255) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ordernum` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `goodsid` int(11) NOT NULL COMMENT '货品编号',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '货品名称',
  `goodtype` varchar(255) DEFAULT NULL COMMENT '物品类型',
  `innum` int(11) DEFAULT NULL COMMENT '物品入库数量',
  `empname` varchar(255) DEFAULT NULL COMMENT '操作员姓名',
  `intime` datetime DEFAULT NULL COMMENT '入库时间',
  `inprice` double(200,0) DEFAULT NULL COMMENT '物品单价',
  `suplieer` varchar(255) DEFAULT NULL COMMENT '供货商',
  `suptel` varchar(255) DEFAULT NULL COMMENT '供货商联系方式',
  `state` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT '1' COMMENT '状态(删除时使用)',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storein
-- ----------------------------
INSERT INTO `storein` VALUES ('39', 'kh2018109342', '1', '冰红茶', '食品类', '100', '小仙女 ', '2018-10-26 16:27:42', '20', '金水区批发市场', '15839004222', '已入库', '1');
INSERT INTO `storein` VALUES ('40', 'kh2018101163', '2', '怡宝矿泉水', '食品类', '100', '小仙女', '2018-10-26 16:29:14', '2', '金水批发市场', '15839004222', '已入库', '1');
INSERT INTO `storein` VALUES ('41', 'kh2018109190', '3', '双汇火腿肠', '食品类', '100', '小仙女', '2018-10-26 16:29:14', '50', '金水批发市场', '15656454545', '已入库', '1');
INSERT INTO `storein` VALUES ('42', 'kh2018108218', '1', '冰红茶', '食品类', '100', '小仙女', '2018-10-26 16:32:03', '20', '金水区批发市场', '15839004222', '已入库', '1');
INSERT INTO `storein` VALUES ('68', 'kh2018104010', '3', '双汇火腿肠', '食品类', '50', '小仙女 ', '2018-10-29 13:51:37', '50', '金水批发市场', '15656454545', '待入库', '1');
INSERT INTO `storein` VALUES ('69', 'kh2018100896', '2', '怡宝矿泉水', '食品类', '100', '小仙女', '2018-10-29 13:51:47', '2', '金水批发市场', '15839004222', '已入库', '1');
INSERT INTO `storein` VALUES ('70', 'kh2018103505', '3', '双汇火腿肠', '食品类', '50', '小仙女', '2018-10-29 13:51:47', '50', '金水批发市场', '15656454545', '待入库', '1');
INSERT INTO `storein` VALUES ('71', 'kh2018107754', '1', '冰红茶', '食品类', '100', '小仙女 ', '2018-10-29 13:52:02', '2', '金水区批发市场', '15839004222', '已入库', '1');

-- ----------------------------
-- Table structure for storeloss
-- ----------------------------
DROP TABLE IF EXISTS `storeloss`;
CREATE TABLE `storeloss` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `goodsid` int(11) NOT NULL COMMENT '物品编号',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '物品名称',
  `goodtype` varchar(255) DEFAULT NULL COMMENT '物品类型',
  `goodsnum` int(11) DEFAULT NULL COMMENT '物品数量',
  `inprice` double DEFAULT NULL COMMENT '物品进价',
  `empname` varchar(255) DEFAULT NULL,
  `losstime` datetime DEFAULT NULL COMMENT '损坏时间',
  `status` int(255) DEFAULT '1' COMMENT '状态(删除使用)',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of storeloss
-- ----------------------------
INSERT INTO `storeloss` VALUES ('11', '1', '冰红茶', '食品类', '5', '2', '小仙女', '2018-10-26 19:14:33', '1');
INSERT INTO `storeloss` VALUES ('12', '2', '怡宝矿泉水', '食品类', '5', '2', '小仙女', '2018-10-26 19:19:41', '1');
INSERT INTO `storeloss` VALUES ('13', '5', '床单', '床上用品类', '20', '50', '小仙女', '2018-10-26 19:21:42', '1');
INSERT INTO `storeloss` VALUES ('18', '1', '冰红茶', '食品类', '100', '2', '小仙女', '2018-10-26 20:08:53', '1');
INSERT INTO `storeloss` VALUES ('19', '2', '怡宝矿泉水', '食品类', '50', '2', '小仙女', '2018-10-26 20:13:01', '1');
INSERT INTO `storeloss` VALUES ('20', '9', '洗发露', '洗漱用品类', '10', '40', '小仙女', '2018-10-27 08:14:38', '1');
INSERT INTO `storeloss` VALUES ('21', '1', '冰红茶', '食品类', '44', '2', '小仙女', '2018-10-25 12:07:02', '1');

-- ----------------------------
-- Table structure for storeout
-- ----------------------------
DROP TABLE IF EXISTS `storeout`;
CREATE TABLE `storeout` (
  `sid` int(255) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `outnumber` varchar(255) DEFAULT NULL COMMENT '出库编号',
  `goodsid` int(11) DEFAULT NULL COMMENT '仓库编号',
  `goodsname` varchar(255) DEFAULT NULL COMMENT '物品名称',
  `goodtype` varchar(255) DEFAULT NULL COMMENT '物品类型',
  `goodsnum` int(11) DEFAULT NULL COMMENT '出库数量',
  `empname` varchar(255) DEFAULT NULL COMMENT '操作员联系方式',
  `outtime` datetime DEFAULT NULL COMMENT '出库时间',
  `status` int(255) DEFAULT '1' COMMENT '状态(删除时使用)',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storeout
-- ----------------------------
INSERT INTO `storeout` VALUES ('65', 'kh2018102915', '2', '怡宝矿泉水', '食品类', '50', '小仙女', '2018-10-26 10:34:40', '1');
INSERT INTO `storeout` VALUES ('66', 'kh2018106456', '1', '冰红茶', '食品类', '50', '小仙女', '2018-10-26 10:34:41', '1');
INSERT INTO `storeout` VALUES ('67', 'kh2018106350', '4', '康师傅红烧牛肉面', '食品类', '50', '小仙女', '2018-10-26 10:34:41', '1');
INSERT INTO `storeout` VALUES ('68', 'kh2018104121', '2', '怡宝矿泉水', '食品类', '100', '小仙女', '2018-10-26 10:59:12', '1');
INSERT INTO `storeout` VALUES ('96', 'kh2018102295', '1', '冰红茶', '食品类', '6', '小仙女', '2018-10-29 13:49:19', '1');
INSERT INTO `storeout` VALUES ('97', 'kh2018102283', '2', '怡宝矿泉水', '食品类', '150', '小仙女', '2018-10-29 13:49:44', '1');
INSERT INTO `storeout` VALUES ('98', 'kh2018100067', '3', '双汇火腿肠', '食品类', '50', '小仙女', '2018-10-29 13:49:44', '1');
INSERT INTO `storeout` VALUES ('99', 'kh2018108044', '2', '怡宝矿泉水', '食品类', '10', '小仙女', '2018-10-29 13:50:07', '1');

-- ----------------------------
-- Table structure for tb_dept_power
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept_power`;
CREATE TABLE `tb_dept_power` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `deptno` varchar(50) DEFAULT NULL COMMENT '权限等级',
  `powerid` int(15) DEFAULT NULL COMMENT '权限类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dept_power
-- ----------------------------
INSERT INTO `tb_dept_power` VALUES ('243', 'D2018100004', '6');
INSERT INTO `tb_dept_power` VALUES ('244', 'D2018100004', '61');
INSERT INTO `tb_dept_power` VALUES ('245', 'D2018100004', '62');
INSERT INTO `tb_dept_power` VALUES ('246', 'D2018100004', '63');
INSERT INTO `tb_dept_power` VALUES ('247', 'D2018100003', '5');
INSERT INTO `tb_dept_power` VALUES ('248', 'D2018100003', '14');
INSERT INTO `tb_dept_power` VALUES ('249', 'D2018100003', '15');
INSERT INTO `tb_dept_power` VALUES ('250', 'D2018100003', '16');
INSERT INTO `tb_dept_power` VALUES ('251', 'D2018100003', '17');
INSERT INTO `tb_dept_power` VALUES ('252', 'D2018100003', '18');
INSERT INTO `tb_dept_power` VALUES ('286', 'D2018100001', '1');
INSERT INTO `tb_dept_power` VALUES ('287', 'D2018100001', '2');
INSERT INTO `tb_dept_power` VALUES ('288', 'D2018100001', '21');
INSERT INTO `tb_dept_power` VALUES ('289', 'D2018100001', '3');
INSERT INTO `tb_dept_power` VALUES ('290', 'D2018100001', '30');
INSERT INTO `tb_dept_power` VALUES ('291', 'D2018100001', '31');
INSERT INTO `tb_dept_power` VALUES ('292', 'D2018100001', '32');
INSERT INTO `tb_dept_power` VALUES ('293', 'D2018100001', '74');
INSERT INTO `tb_dept_power` VALUES ('294', 'D2018100001', '75');
INSERT INTO `tb_dept_power` VALUES ('295', 'D2018100001', '76');
INSERT INTO `tb_dept_power` VALUES ('296', 'D2018100001', '77');
INSERT INTO `tb_dept_power` VALUES ('297', 'D2018100001', '79');
INSERT INTO `tb_dept_power` VALUES ('362', 'D2018100002', '1');
INSERT INTO `tb_dept_power` VALUES ('363', 'D2018100002', '2');
INSERT INTO `tb_dept_power` VALUES ('364', 'D2018100002', '21');
INSERT INTO `tb_dept_power` VALUES ('365', 'D2018100002', '3');
INSERT INTO `tb_dept_power` VALUES ('366', 'D2018100002', '30');
INSERT INTO `tb_dept_power` VALUES ('367', 'D2018100002', '31');
INSERT INTO `tb_dept_power` VALUES ('368', 'D2018100002', '32');
INSERT INTO `tb_dept_power` VALUES ('369', 'D2018100002', '74');
INSERT INTO `tb_dept_power` VALUES ('370', 'D2018100002', '75');
INSERT INTO `tb_dept_power` VALUES ('371', 'D2018100002', '76');
INSERT INTO `tb_dept_power` VALUES ('372', 'D2018100002', '77');
INSERT INTO `tb_dept_power` VALUES ('373', 'D2018100002', '79');
INSERT INTO `tb_dept_power` VALUES ('374', 'D2018100002', '84');
INSERT INTO `tb_dept_power` VALUES ('473', 'D2018100006', '1');
INSERT INTO `tb_dept_power` VALUES ('474', 'D2018100006', '2');
INSERT INTO `tb_dept_power` VALUES ('475', 'D2018100006', '21');
INSERT INTO `tb_dept_power` VALUES ('477', 'D2018100006', '3');
INSERT INTO `tb_dept_power` VALUES ('478', 'D2018100006', '30');
INSERT INTO `tb_dept_power` VALUES ('479', 'D2018100006', '31');
INSERT INTO `tb_dept_power` VALUES ('480', 'D2018100006', '32');
INSERT INTO `tb_dept_power` VALUES ('481', 'D2018100006', '74');
INSERT INTO `tb_dept_power` VALUES ('482', 'D2018100006', '75');
INSERT INTO `tb_dept_power` VALUES ('483', 'D2018100006', '76');
INSERT INTO `tb_dept_power` VALUES ('484', 'D2018100006', '77');
INSERT INTO `tb_dept_power` VALUES ('485', 'D2018100006', '79');
INSERT INTO `tb_dept_power` VALUES ('486', 'D2018100006', '84');
INSERT INTO `tb_dept_power` VALUES ('487', 'D2018100006', '4');
INSERT INTO `tb_dept_power` VALUES ('488', 'D2018100006', '11');
INSERT INTO `tb_dept_power` VALUES ('489', 'D2018100006', '41');
INSERT INTO `tb_dept_power` VALUES ('490', 'D2018100006', '80');
INSERT INTO `tb_dept_power` VALUES ('491', 'D2018100006', '81');
INSERT INTO `tb_dept_power` VALUES ('492', 'D2018100006', '5');
INSERT INTO `tb_dept_power` VALUES ('493', 'D2018100006', '14');
INSERT INTO `tb_dept_power` VALUES ('494', 'D2018100006', '15');
INSERT INTO `tb_dept_power` VALUES ('495', 'D2018100006', '16');
INSERT INTO `tb_dept_power` VALUES ('496', 'D2018100006', '17');
INSERT INTO `tb_dept_power` VALUES ('497', 'D2018100006', '18');
INSERT INTO `tb_dept_power` VALUES ('498', 'D2018100006', '6');
INSERT INTO `tb_dept_power` VALUES ('499', 'D2018100006', '61');
INSERT INTO `tb_dept_power` VALUES ('500', 'D2018100006', '62');
INSERT INTO `tb_dept_power` VALUES ('501', 'D2018100006', '63');
INSERT INTO `tb_dept_power` VALUES ('502', 'D2018100006', '7');
INSERT INTO `tb_dept_power` VALUES ('503', 'D2018100006', '71');
INSERT INTO `tb_dept_power` VALUES ('504', 'D2018100006', '72');
INSERT INTO `tb_dept_power` VALUES ('505', 'D2018100006', '82');
INSERT INTO `tb_dept_power` VALUES ('605', 'D2018100999', '1');
INSERT INTO `tb_dept_power` VALUES ('606', 'D2018100999', '2');
INSERT INTO `tb_dept_power` VALUES ('607', 'D2018100999', '21');
INSERT INTO `tb_dept_power` VALUES ('609', 'D2018100999', '3');
INSERT INTO `tb_dept_power` VALUES ('610', 'D2018100999', '30');
INSERT INTO `tb_dept_power` VALUES ('611', 'D2018100999', '31');
INSERT INTO `tb_dept_power` VALUES ('612', 'D2018100999', '32');
INSERT INTO `tb_dept_power` VALUES ('613', 'D2018100999', '74');
INSERT INTO `tb_dept_power` VALUES ('614', 'D2018100999', '75');
INSERT INTO `tb_dept_power` VALUES ('615', 'D2018100999', '76');
INSERT INTO `tb_dept_power` VALUES ('616', 'D2018100999', '77');
INSERT INTO `tb_dept_power` VALUES ('617', 'D2018100999', '79');
INSERT INTO `tb_dept_power` VALUES ('618', 'D2018100999', '84');
INSERT INTO `tb_dept_power` VALUES ('619', 'D2018100999', '4');
INSERT INTO `tb_dept_power` VALUES ('620', 'D2018100999', '11');
INSERT INTO `tb_dept_power` VALUES ('621', 'D2018100999', '41');
INSERT INTO `tb_dept_power` VALUES ('622', 'D2018100999', '80');
INSERT INTO `tb_dept_power` VALUES ('623', 'D2018100999', '81');
INSERT INTO `tb_dept_power` VALUES ('624', 'D2018100999', '5');
INSERT INTO `tb_dept_power` VALUES ('625', 'D2018100999', '14');
INSERT INTO `tb_dept_power` VALUES ('626', 'D2018100999', '15');
INSERT INTO `tb_dept_power` VALUES ('627', 'D2018100999', '16');
INSERT INTO `tb_dept_power` VALUES ('628', 'D2018100999', '17');
INSERT INTO `tb_dept_power` VALUES ('629', 'D2018100999', '18');
INSERT INTO `tb_dept_power` VALUES ('630', 'D2018100999', '6');
INSERT INTO `tb_dept_power` VALUES ('631', 'D2018100999', '61');
INSERT INTO `tb_dept_power` VALUES ('632', 'D2018100999', '62');
INSERT INTO `tb_dept_power` VALUES ('633', 'D2018100999', '63');
INSERT INTO `tb_dept_power` VALUES ('634', 'D2018100999', '7');
INSERT INTO `tb_dept_power` VALUES ('635', 'D2018100999', '71');
INSERT INTO `tb_dept_power` VALUES ('636', 'D2018100999', '72');
INSERT INTO `tb_dept_power` VALUES ('637', 'D2018100999', '82');

-- ----------------------------
-- Table structure for tb_power
-- ----------------------------
DROP TABLE IF EXISTS `tb_power`;
CREATE TABLE `tb_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '权限菜单名称',
  `parentid` int(11) DEFAULT NULL COMMENT '父节点ID',
  `state` varchar(20) DEFAULT NULL COMMENT '状态（打开或者关闭）',
  `iconcls` varchar(20) DEFAULT NULL COMMENT '节点图标',
  `url` varchar(200) DEFAULT NULL COMMENT '请求地址',
  `addtime` date DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_power
-- ----------------------------
INSERT INTO `tb_power` VALUES ('1', '房间信息', '0', 'open', '', 'roomController/iframe.do', '2018-10-09');
INSERT INTO `tb_power` VALUES ('2', '订单管理', '0', 'closed', '', '', null);
INSERT INTO `tb_power` VALUES ('3', '房间管理', '0', 'closed', '', '', '2018-10-09');
INSERT INTO `tb_power` VALUES ('4', '财务管理', '0', 'closed', '', '', '2018-10-09');
INSERT INTO `tb_power` VALUES ('5', '仓库管理', '0', 'closed', '', '', '2018-10-09');
INSERT INTO `tb_power` VALUES ('6', '人事管理', '0', 'closed', '', '', '2018-10-09');
INSERT INTO `tb_power` VALUES ('7', '权限管理', '0', 'closed', '', '', '2018-10-09');
INSERT INTO `tb_power` VALUES ('11', '财务统计', '4', 'open', '', 'financeAll/showfinanceAccount.do', null);
INSERT INTO `tb_power` VALUES ('14', '库存管理', '5', 'open', null, 'store/show.do', null);
INSERT INTO `tb_power` VALUES ('15', '入库管理', '5', 'open', null, 'storein/in.do', null);
INSERT INTO `tb_power` VALUES ('16', '出库管理', '5', 'open', null, 'storeout/out.do', null);
INSERT INTO `tb_power` VALUES ('17', '采购管理', '5', 'open', null, 'purchaseStore/purchase.do', null);
INSERT INTO `tb_power` VALUES ('18', '损耗统计', '5', 'open', null, 'storeLoss/loss.do', null);
INSERT INTO `tb_power` VALUES ('21', '预订订单', '2', 'open', '', 'bookingroomController/booking.do', null);
INSERT INTO `tb_power` VALUES ('30', '当前入住信息', '3', 'open', '', 'nowregister/show.do', null);
INSERT INTO `tb_power` VALUES ('31', '房间管理', '3', 'open', '', 'roomController/room.do', null);
INSERT INTO `tb_power` VALUES ('32', '入住信息统计', '3', 'open', '', 'register/show.do', null);
INSERT INTO `tb_power` VALUES ('41', '房间消费单', '4', 'open', null, 'roomUseController/roomUse.do', '2018-10-11');
INSERT INTO `tb_power` VALUES ('61', '会员管理', '6', 'open', '', 'power/user.do', '2018-10-09');
INSERT INTO `tb_power` VALUES ('62', '员工管理', '6', 'open', '', 'power/emp.do', '2018-10-09');
INSERT INTO `tb_power` VALUES ('63', '部门管理', '6', 'open', '', 'power/dept.do', '2018-10-09');
INSERT INTO `tb_power` VALUES ('71', '权限添加', '7', 'open', '', 'power/addp.do', '2018-10-09');
INSERT INTO `tb_power` VALUES ('72', '权限管理', '7', 'open', '', 'power/list.do', '2018-10-09');
INSERT INTO `tb_power` VALUES ('74', '房间维护记录', '3', 'open', '', 'servController/serv.do', null);
INSERT INTO `tb_power` VALUES ('75', '房间消费记录', '3', 'open', '', 'roomConsumController/list.do', null);
INSERT INTO `tb_power` VALUES ('76', '客户换房记录', '3', 'open', '', 'change/showjsp.do', null);
INSERT INTO `tb_power` VALUES ('77', '房间物品损耗表', '3', 'open', '', 'roomloss/show.do', null);
INSERT INTO `tb_power` VALUES ('79', '续住信息统计', '3', 'open', '', 'stayOverController/list.do', null);
INSERT INTO `tb_power` VALUES ('80', '财务汇总', '4', 'open', '', 'financeAll/showfinance.do', null);
INSERT INTO `tb_power` VALUES ('81', '仓库采购订单审核', '4', 'open', '', 'auditStore/audit.do', null);
INSERT INTO `tb_power` VALUES ('82', '部门权限管理', '7', 'open', '', 'power/addpowers.do', null);
INSERT INTO `tb_power` VALUES ('84', '房间类型管理', '3', 'open', '', 'roomtype/jsp.do', null);

-- ----------------------------
-- Table structure for tb_room
-- ----------------------------
DROP TABLE IF EXISTS `tb_room`;
CREATE TABLE `tb_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(45) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `pricesum` int(11) DEFAULT NULL,
  `usesum` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_room
-- ----------------------------
INSERT INTO `tb_room` VALUES ('1', 'ROOM20181019102', '102', '138', '100', '2018-10-19 20:21:14');
INSERT INTO `tb_room` VALUES ('2', 'ROOM20181019301', '301', '668', '100', '2018-10-19 20:25:57');
INSERT INTO `tb_room` VALUES ('4', 'ROOM20181020101', '101', '958', '600', '2018-10-20 08:29:58');
INSERT INTO `tb_room` VALUES ('6', 'ROOM20181022102', '102', '168', '300', '2018-10-22 14:29:49');
INSERT INTO `tb_room` VALUES ('9', 'ROOM20181022103', '103', '893', '300', '2018-10-22 19:19:50');
INSERT INTO `tb_room` VALUES ('10', 'ROOM20181022505', '505', '188', '300', '2018-10-22 19:42:16');
INSERT INTO `tb_room` VALUES ('11', 'ROOM20181022102', '102', '138', '300', '2018-10-22 19:46:15');
INSERT INTO `tb_room` VALUES ('12', 'ROOM201810261101', '1101', '1100', '0', '2018-10-26 08:29:49');
INSERT INTO `tb_room` VALUES ('13', 'ROOM20181026701', '701', '0', '0', '2018-10-26 16:21:08');
INSERT INTO `tb_room` VALUES ('14', 'ROOM20181027301', '301', '128', '3', '2018-10-27 13:06:26');
INSERT INTO `tb_room` VALUES ('15', 'ROOM20181027107', '107', '128', '110', '2018-10-27 13:38:25');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(10) NOT NULL AUTO_INCREMENT COMMENT '顾客编号',
  `userno` varchar(30) NOT NULL,
  `account` varchar(255) DEFAULT NULL COMMENT '账户（手机号）',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `username` varchar(255) DEFAULT NULL COMMENT '顾客姓名',
  `useridcard` varchar(255) DEFAULT NULL COMMENT '顾客身份证号',
  `usercount` double(25,0) DEFAULT NULL COMMENT '会员卡内余额',
  `level` varchar(25) DEFAULT NULL COMMENT '会员等级',
  `discount` double(10,2) DEFAULT NULL COMMENT '折扣',
  `usertimes` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`,`userno`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('34', 'AA201810203625', '13812345888', 'VLqNXg1GE15wdISs1DKDXw==', '大哥大', '412222199902021888', '3000', 'VIP3', null, null);
INSERT INTO `user` VALUES ('35', 'AA201810200407', '13812340000', 'VLqNXg1GE15wdISs1DKDXw==', '张胜男', '41222219660202101X', '3333', 'VIP3', null, null);
INSERT INTO `user` VALUES ('36', 'AA201810205644', '18737101923', 'VLqNXg1GE15wdISs1DKDXw==', '顾客', '412722199901012222', '11111', 'VIP5', null, null);
INSERT INTO `user` VALUES ('37', 'AA201810224266', '18744444444', 'VLqNXg1GE15wdISs1DKDXw==', '嘟嘟', '412722199901012200', '6000', 'VIP4', null, null);
INSERT INTO `user` VALUES ('38', 'AA201810224825', '18712345678', 'VLqNXg1GE15wdISs1DKDXw==', '张三', '412722199001012222', '2222', 'VIP2', null, null);
INSERT INTO `user` VALUES ('39', 'AA201810228209', '18737101920', 'VLqNXg1GE15wdISs1DKDXw==', '元月', '412722199501012222', '10000', 'VIP5', null, null);
INSERT INTO `user` VALUES ('40', 'AA201810227102', '18737101921', 'VLqNXg1GE15wdISs1DKDXw==', '腊月', '412722199901012229', '2000', 'VIP2', null, null);
INSERT INTO `user` VALUES ('41', 'AA201810229311', '18737101925', 'VLqNXg1GE15wdISs1DKDXw==', '达阁', '412722199901012228', '2222', 'VIP2', null, null);
INSERT INTO `user` VALUES ('42', 'AA201810223711', '18737101928', 'VLqNXg1GE15wdISs1DKDXw==', 'daad', '412722199901012227', '1000', 'VIP2', null, null);
INSERT INTO `user` VALUES ('43', 'AA201810226160', '18737101926', 'VLqNXg1GE15wdISs1DKDXw==', '阿斯蒂芬', '412722199901012226', '10000', 'VIP5', null, null);
INSERT INTO `user` VALUES ('47', 'AA201810278510', '18744444466', 'bFj8ZKyw4BEdYtaQcBRCHA==', '会员', '412722199901010000', '2000', 'VIP2', null, null);
