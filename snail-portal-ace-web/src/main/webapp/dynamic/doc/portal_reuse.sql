-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.20 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 sxwl.company 结构
DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(50) NOT NULL COMMENT '公司编号',
  `company_type` varchar(50) NOT NULL COMMENT '公司类型',
  `comany_category_code` int(50) NOT NULL COMMENT '公司类型编号',
  `company_name` varchar(50) NOT NULL COMMENT '公司名称',
  `area_code` varchar(6) DEFAULT NULL COMMENT '公司所属地区编号',
  `address` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `content` varchar(500) DEFAULT NULL COMMENT '公司简介',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` varchar(50) NOT NULL COMMENT '创建人编号',
  `stauts` char(1) NOT NULL COMMENT '状态（0作废正常1）',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

-- 正在导出表  sxwl.company 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- 导出  表 sxwl.company_category 结构
DROP TABLE IF EXISTS `company_category`;
CREATE TABLE IF NOT EXISTS `company_category` (
  `code` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `status` char(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司类型表';

-- 正在导出表  sxwl.company_category 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `company_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_category` ENABLE KEYS */;

-- 导出  表 sxwl.department 结构
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(50) unsigned NOT NULL COMMENT '部门编号',
  `parent_department_id` int(50) unsigned DEFAULT NULL COMMENT '上级部门编号',
  `department_level` varchar(50) DEFAULT NULL COMMENT '部门级别',
  `department_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `user_id` int(50) DEFAULT NULL COMMENT '部门负责人编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` int(50) DEFAULT NULL COMMENT '创建人编号',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  sxwl.department 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`department_id`, `parent_department_id`, `department_level`, `department_name`, `user_id`, `create_time`, `create_user_id`, `status`) VALUES
	(1, 0, '500', NULL, NULL, '2018-01-13 02:25:25', NULL, NULL),
	(2, NULL, '-700', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- 导出  表 sxwl.dict 结构
DROP TABLE IF EXISTS `dict`;
CREATE TABLE IF NOT EXISTS `dict` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL COMMENT '值',
  `name` varchar(50) NOT NULL COMMENT '具体哪一类的名称',
  `remark` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='字典表 ';

-- 正在导出表  sxwl.dict 的数据：~30 rows (大约)
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;
INSERT INTO `dict` (`id`, `category_id`, `code`, `name`, `remark`, `create_time`) VALUES
	(1, '02', '0', '否', NULL, '2018-01-03 09:12:19'),
	(2, '02', '1', '是', NULL, '2018-01-03 09:12:19'),
	(3, '01', '2', '女', NULL, '2018-01-03 09:12:19'),
	(4, '01', '1', '男', NULL, '2018-01-03 09:12:19'),
	(5, '03', '1', '1月', NULL, '2018-01-03 09:45:52'),
	(6, '03', '2', '2月', NULL, '2018-01-03 09:45:52'),
	(7, '03', '3', '3月', NULL, '2018-01-03 09:45:52'),
	(8, '03', '4', '4月', NULL, '2018-01-03 09:45:52'),
	(9, '03', '5', '5月', NULL, '2018-01-03 09:45:52'),
	(10, '03', '6', '6月', NULL, '2018-01-03 09:45:52'),
	(11, '03', '7', '7月', NULL, '2018-01-03 09:45:52'),
	(12, '03', '8', '8月', NULL, '2018-01-03 09:45:52'),
	(13, '03', '9', '9月', NULL, '2018-01-03 09:45:52'),
	(14, '03', '10', '10月', NULL, '2018-01-03 09:45:52'),
	(15, '03', '11', '11月', NULL, '2018-01-03 09:45:52'),
	(16, '03', '12', '12月', NULL, '2018-01-03 09:45:52'),
	(17, '04', '1', '模块', NULL, '2018-01-07 17:43:45'),
	(18, '04', '2', '页面', NULL, '2018-01-07 17:44:07'),
	(19, '04', '3', '按钮', NULL, '2018-01-07 17:44:26'),
	(20, '06', '1', '初级', '', '2018-01-14 01:39:54'),
	(21, '06', '2', '中级', '', '2018-01-14 01:40:04'),
	(22, '06', '3', '高级', '', '2018-01-14 01:40:14'),
	(23, '07', '1', '游戏内充值', '', '2018-01-20 11:14:41'),
	(24, '07', '2', '代理充值', '', '2018-01-20 11:15:03'),
	(25, '07', '3', '管理员充值', '', '2018-01-20 11:15:23'),
	(26, '08', '0', '未完成', '未支付完成、支付超时、支付失败', '2018-01-28 00:58:56'),
	(27, '08', '1', '完成', '支付完成', '2018-01-28 00:59:17'),
	(28, '09', '0', '麻将', '', '2018-01-28 00:59:44'),
	(29, '09', '1', '普通推饼', '玩家或代理开房间', '2018-01-28 01:00:30'),
	(30, '09', '2', '推饼金币场', '金币场万人模式', '2018-01-28 01:00:54');
/*!40000 ALTER TABLE `dict` ENABLE KEYS */;

-- 导出  表 sxwl.dict_category 结构
DROP TABLE IF EXISTS `dict_category`;
CREATE TABLE IF NOT EXISTS `dict_category` (
  `CATEGORY_ID` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL COMMENT '为空则使用category_id，否则使用remark SQL',
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类别';

-- 正在导出表  sxwl.dict_category 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `dict_category` DISABLE KEYS */;
INSERT INTO `dict_category` (`CATEGORY_ID`, `NAME`, `REMARK`, `CREATE_TIME`) VALUES
	('01', '性别', '', '2018-01-02 19:30:17'),
	('02', '是否状态', '', '2018-01-02 19:30:40'),
	('03', '月份', NULL, '2018-01-03 09:42:34'),
	('04', '资源类别', NULL, '2018-01-07 17:42:31'),
	('05', '日志类型', 'select t.resources_id code,t.resources_name name,null remark,t.create_time from resources t where t.resources_type=2', '2018-01-08 23:49:39'),
	('06', '代理等级', '', '2018-01-14 01:39:20'),
	('07', '充值方式', '', '2018-01-20 11:06:58'),
	('08', '支付状态', '', '2018-01-28 00:58:12'),
	('09', '游戏类型', '', '2018-01-28 00:58:23');
/*!40000 ALTER TABLE `dict_category` ENABLE KEYS */;

-- 导出  表 sxwl.files 结构
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `file_id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `file_name` varchar(50) NOT NULL COMMENT '文件名称',
  `file_ext_name` varchar(10) NOT NULL COMMENT '文件导出名称',
  `file_content` blob NOT NULL COMMENT '文件内容',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `operater` int(11) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- 正在导出表  sxwl.files 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- 导出  表 sxwl.file_resource 结构
DROP TABLE IF EXISTS `file_resource`;
CREATE TABLE IF NOT EXISTS `file_resource` (
  `file_id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `file_name` varchar(50) NOT NULL COMMENT '文件名称',
  `file_ext_name` varchar(10) NOT NULL COMMENT '文件导出名称',
  `file_content` blob NOT NULL COMMENT '文件内容',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `operater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件资源表';

-- 正在导出表  sxwl.file_resource 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `file_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_resource` ENABLE KEYS */;

-- 导出  表 sxwl.logs 结构
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log` varchar(2000) DEFAULT NULL COMMENT '日志内容',
  `user_id` int(50) DEFAULT NULL COMMENT '操作人编号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '操作人姓名',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  `object_value` varchar(50) DEFAULT NULL COMMENT '操作对象主键',
  `old` varchar(1000) DEFAULT NULL COMMENT '原有值',
  `news` varchar(1000) DEFAULT NULL COMMENT '最新值',
  `name` varchar(50) DEFAULT NULL COMMENT '操作对象',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `log_type` varchar(50) DEFAULT NULL COMMENT '日志类型对应resources中type为页面类型的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- 正在导出表  sxwl.logs 的数据：~335 rows (大约)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `log`, `user_id`, `user_name`, `create_time`, `object_value`, `old`, `news`, `name`, `ip`, `log_type`) VALUES
	(334, 'id为1的用户在2018-01-14 00:22:46登录了系统。', 1, '潘志鹏', '2018-01-14 00:22:46', '1', '2018-01-13 22:29:05', '2018-01-14 00:22:46', '用户登录', NULL, ''),
	(335, 'id为1的用户在2018-01-14 01:00:06登录了系统。', 1, '潘志鹏', '2018-01-14 01:00:06', '1', '2018-01-14 00:22:46', '2018-01-14 01:00:06', '用户登录', NULL, ''),
	(336, 'id为1的用户潘志鹏\r\n在2018-01-14 01:28:32\r\n对字典类型[代理等级]\r\n做了添加操作:\r\n添加了代理等级。', 1, '潘志鹏', '2018-01-14 01:28:32', '字典类型[代理等级]', '', '代理等级', '添加', NULL, '22'),
	(337, 'id为1的用户在2018-01-14 01:31:58登录了系统。', 1, '潘志鹏', '2018-01-14 01:31:58', '1', '2018-01-14 01:00:06', '2018-01-14 01:31:58', '用户登录', NULL, ''),
	(338, 'id为1的用户在2018-01-14 01:36:05登录了系统。', 1, '潘志鹏', '2018-01-14 01:36:05', '1', '2018-01-14 01:31:58', '2018-01-14 01:36:05', '用户登录', NULL, ''),
	(339, 'id为1的用户潘志鹏\r\n在2018-01-14 01:36:13\r\n对字典类型[代理等级]\r\n做了删除操作:\r\n删除了0。', 1, '潘志鹏', '2018-01-14 01:36:13', '字典类型[代理等级]', '0', '', '删除', NULL, '22'),
	(340, 'id为1的用户潘志鹏\r\n在2018-01-14 01:36:24\r\n对字典类型[代理等级]\r\n做了添加操作:\r\n添加了代理等级。', 1, '潘志鹏', '2018-01-14 01:36:24', '字典类型[代理等级]', '', '代理等级', '添加', NULL, '22'),
	(341, 'id为1的用户在2018-01-14 01:39:05登录了系统。', 1, '潘志鹏', '2018-01-14 01:39:05', '1', '2018-01-14 01:36:05', '2018-01-14 01:39:05', '用户登录', NULL, ''),
	(342, 'id为1的用户潘志鹏\r\n在2018-01-14 01:39:11\r\n对字典类型[代理等级]\r\n做了删除操作:\r\n删除了0。', 1, '潘志鹏', '2018-01-14 01:39:11', '字典类型[代理等级]', '0', '', '删除', NULL, '22'),
	(343, 'id为1的用户潘志鹏\r\n在2018-01-14 01:39:20\r\n对字典类型[代理等级]\r\n做了添加操作:\r\n添加了代理等级。', 1, '潘志鹏', '2018-01-14 01:39:20', '字典类型[代理等级]', '', '代理等级', '添加', NULL, '22'),
	(344, '添加字典', 1, '潘志鹏', '2018-01-14 01:39:54', '初级', '', '初级', '字典', NULL, ''),
	(345, '添加字典', 1, '潘志鹏', '2018-01-14 01:40:04', '中级', '', '中级', '字典', NULL, ''),
	(346, '添加字典', 1, '潘志鹏', '2018-01-14 01:40:14', '3', '', '3', '字典', NULL, ''),
	(347, 'id为1的用户在2018-01-14 01:40:55登录了系统。', 1, '潘志鹏', '2018-01-14 01:40:55', '1', '2018-01-14 01:39:05', '2018-01-14 01:40:55', '用户登录', NULL, ''),
	(348, 'id为1的用户潘志鹏\r\n在2018-01-14 01:52:09\r\n对资源\r\n做了添加操作:\r\n添加了代理管理。', 1, '潘志鹏', '2018-01-14 01:52:09', '资源', '', '代理管理', '添加', NULL, '5'),
	(349, 'id为1的用户潘志鹏\r\n在2018-01-14 01:54:41\r\n对资源\r\n做了添加操作:\r\n添加了代理变更。', 1, '潘志鹏', '2018-01-14 01:54:41', '资源', '', '代理变更', '添加', NULL, '5'),
	(350, 'id为1的用户潘志鹏\r\n在2018-01-14 01:55:36\r\n对资源\r\n做了添加操作:\r\n添加了代理查询。', 1, '潘志鹏', '2018-01-14 01:55:36', '资源', '', '代理查询', '添加', NULL, '5'),
	(351, '角色权限变更', 1, '潘志鹏', '2018-01-14 01:58:37', '1', '', '', '角色权限', NULL, ''),
	(352, 'id为1的用户在2018-01-14 01:58:52登录了系统。', 1, '潘志鹏', '2018-01-14 01:58:52', '1', '2018-01-14 01:40:55', '2018-01-14 01:58:52', '用户登录', NULL, ''),
	(353, '变更字典', 1, '潘志鹏', '2018-01-14 02:02:05', '高级', '', '高级', '字典', NULL, ''),
	(354, 'id为1的用户在2018-01-14 02:02:31登录了系统。', 1, '潘志鹏', '2018-01-14 02:02:31', '1', '2018-01-14 01:58:52', '2018-01-14 02:02:31', '用户登录', NULL, ''),
	(355, 'id为1的用户在2018-01-14 02:03:11登录了系统。', 1, '潘志鹏', '2018-01-14 02:03:11', '1', '2018-01-14 02:02:31', '2018-01-14 02:03:11', '用户登录', NULL, ''),
	(356, 'id为1的用户在2018-01-14 02:14:23登录了系统。', 1, '潘志鹏', '2018-01-14 02:14:23', '1', '2018-01-14 02:03:11', '2018-01-14 02:14:23', '用户登录', NULL, ''),
	(357, 'id为1的用户在2018-01-14 02:56:16登录了系统。', 1, '潘志鹏', '2018-01-14 02:56:16', '1', '2018-01-14 02:14:23', '2018-01-14 02:56:16', '用户登录', NULL, ''),
	(358, 'id为1的用户在2018-01-14 02:59:05登录了系统。', 1, '潘志鹏', '2018-01-14 02:59:05', '1', '2018-01-14 02:56:16', '2018-01-14 02:59:05', '用户登录', NULL, ''),
	(359, 'id为1的用户在2018-01-14 03:00:42登录了系统。', 1, '潘志鹏', '2018-01-14 03:00:42', '1', '2018-01-14 02:59:05', '2018-01-14 03:00:42', '用户登录', NULL, ''),
	(360, 'id为1的用户在2018-01-14 03:02:05登录了系统。', 1, '潘志鹏', '2018-01-14 03:02:05', '1', '2018-01-14 03:00:42', '2018-01-14 03:02:05', '用户登录', NULL, ''),
	(361, 'id为1的用户在2018-01-14 03:14:47登录了系统。', 1, '潘志鹏', '2018-01-14 03:14:47', '1', '2018-01-14 03:02:05', '2018-01-14 03:14:47', '用户登录', NULL, ''),
	(362, 'id为1的用户在2018-01-14 03:28:55登录了系统。', 1, '潘志鹏', '2018-01-14 03:28:55', '1', '2018-01-14 03:14:47', '2018-01-14 03:28:55', '用户登录', NULL, ''),
	(363, 'id为1的用户在2018-01-14 03:44:29登录了系统。', 1, '潘志鹏', '2018-01-14 03:44:29', '1', '2018-01-14 03:28:55', '2018-01-14 03:44:29', '用户登录', NULL, ''),
	(364, 'id为1的用户在2018-01-14 04:05:54登录了系统。', 1, '潘志鹏', '2018-01-14 04:05:54', '1', '2018-01-14 03:44:29', '2018-01-14 04:05:54', '用户登录', NULL, ''),
	(365, 'id为1的用户在2018-01-14 04:08:17登录了系统。', 1, '潘志鹏', '2018-01-14 04:08:17', '1', '2018-01-14 04:05:54', '2018-01-14 04:08:17', '用户登录', NULL, ''),
	(366, 'id为1的用户在2018-01-14 04:14:32登录了系统。', 1, '潘志鹏', '2018-01-14 04:14:32', '1', '2018-01-14 04:08:17', '2018-01-14 04:14:32', '用户登录', NULL, ''),
	(367, 'id为1的用户在2018-01-14 04:17:34登录了系统。', 1, '潘志鹏', '2018-01-14 04:17:34', '1', '2018-01-14 04:14:32', '2018-01-14 04:17:34', '用户登录', NULL, ''),
	(368, 'id为1的用户在2018-01-14 04:24:06登录了系统。', 1, '潘志鹏', '2018-01-14 04:24:06', '1', '2018-01-14 04:17:34', '2018-01-14 04:24:06', '用户登录', NULL, ''),
	(369, 'id为1的用户在2018-01-14 04:32:18登录了系统。', 1, '潘志鹏', '2018-01-14 04:32:18', '1', '2018-01-14 04:24:06', '2018-01-14 04:32:18', '用户登录', NULL, ''),
	(370, 'id为1的用户在2018-01-14 04:36:27登录了系统。', 1, '潘志鹏', '2018-01-14 04:36:27', '1', '2018-01-14 04:32:18', '2018-01-14 04:36:27', '用户登录', NULL, ''),
	(371, 'id为1的用户在2018-01-14 04:44:16登录了系统。', 1, '潘志鹏', '2018-01-14 04:44:16', '1', '2018-01-14 04:36:27', '2018-01-14 04:44:16', '用户登录', NULL, ''),
	(372, 'id为1的用户在2018-01-14 04:46:57登录了系统。', 1, '潘志鹏', '2018-01-14 04:46:57', '1', '2018-01-14 04:44:16', '2018-01-14 04:46:57', '用户登录', NULL, ''),
	(373, 'id为1的用户在2018-01-14 04:50:07登录了系统。', 1, '潘志鹏', '2018-01-14 04:50:07', '1', '2018-01-14 04:46:57', '2018-01-14 04:50:07', '用户登录', NULL, ''),
	(374, 'id为1的用户在2018-01-14 04:52:54登录了系统。', 1, '潘志鹏', '2018-01-14 04:52:54', '1', '2018-01-14 04:50:07', '2018-01-14 04:52:54', '用户登录', NULL, ''),
	(375, 'id为1的用户在2018-01-14 04:56:33登录了系统。', 1, '潘志鹏', '2018-01-14 04:56:33', '1', '2018-01-14 04:52:54', '2018-01-14 04:56:33', '用户登录', NULL, ''),
	(376, 'id为1的用户在2018-01-14 04:58:55登录了系统。', 1, '潘志鹏', '2018-01-14 04:58:55', '1', '2018-01-14 04:56:33', '2018-01-14 04:58:55', '用户登录', NULL, ''),
	(377, 'id为1的用户在2018-01-14 05:00:56登录了系统。', 1, '潘志鹏', '2018-01-14 05:00:56', '1', '2018-01-14 04:58:55', '2018-01-14 05:00:56', '用户登录', NULL, ''),
	(378, 'id为1的用户在2018-01-14 05:03:26登录了系统。', 1, '潘志鹏', '2018-01-14 05:03:26', '1', '2018-01-14 05:00:56', '2018-01-14 05:03:26', '用户登录', NULL, ''),
	(379, 'id为1的用户在2018-01-14 05:04:37登录了系统。', 1, '潘志鹏', '2018-01-14 05:04:37', '1', '2018-01-14 05:03:26', '2018-01-14 05:04:37', '用户登录', NULL, ''),
	(380, 'id为1的用户在2018-01-14 05:11:00登录了系统。', 1, '潘志鹏', '2018-01-14 05:11:00', '1', '2018-01-14 05:04:37', '2018-01-14 05:11:00', '用户登录', NULL, ''),
	(381, 'id为1的用户在2018-01-14 05:12:42登录了系统。', 1, '潘志鹏', '2018-01-14 05:12:42', '1', '2018-01-14 05:11:00', '2018-01-14 05:12:42', '用户登录', NULL, ''),
	(382, 'id为1的用户在2018-01-14 22:22:43登录了系统。', 1, '潘志鹏', '2018-01-14 22:22:43', '1', '2018-01-14 05:12:42', '2018-01-14 22:22:43', '用户登录', NULL, ''),
	(383, 'id为1的用户在2018-01-15 00:37:09登录了系统。', 1, '潘志鹏', '2018-01-15 00:37:09', '1', '2018-01-14 22:22:43', '2018-01-15 00:37:09', '用户登录', NULL, ''),
	(384, 'id为1的用户在2018-01-15 01:26:17登录了系统。', 1, '潘志鹏', '2018-01-15 01:26:17', '1', '2018-01-15 00:37:09', '2018-01-15 01:26:17', '用户登录', NULL, ''),
	(385, 'id为1的用户在2018-01-15 09:05:11登录了系统。', 1, '潘志鹏', '2018-01-15 09:05:11', '1', '2018-01-15 01:26:17', '2018-01-15 09:05:11', '用户登录', NULL, ''),
	(386, 'id为1的用户在2018-01-15 09:06:37登录了系统。', 1, '潘志鹏', '2018-01-15 09:06:37', '1', '2018-01-15 09:05:11', '2018-01-15 09:06:37', '用户登录', NULL, ''),
	(387, 'id为1的用户在2018-01-15 09:33:01登录了系统。', 1, '潘志鹏', '2018-01-15 09:33:01', '1', '2018-01-15 09:06:37', '2018-01-15 09:33:01', '用户登录', NULL, ''),
	(388, 'id为1的用户在2018-01-15 09:40:35登录了系统。', 1, '潘志鹏', '2018-01-15 09:40:35', '1', '2018-01-15 09:33:01', '2018-01-15 09:40:35', '用户登录', NULL, ''),
	(389, '用户密码修改', 1, '潘志鹏', '2018-01-15 09:41:47', '1', '', '670b14728ad9902aecba32e22fa4f6bd', '用户密码', NULL, ''),
	(390, 'id为1的用户在2018-01-15 09:45:32登录了系统。', 1, '潘志鹏', '2018-01-15 09:45:32', '1', '2018-01-15 09:40:35', '2018-01-15 09:45:32', '用户登录', NULL, ''),
	(391, 'unionId为[oYGsJwOn_7OJs71Y3zqbqk_HzlxA]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-16 09:38:28', '游戏管理-会员管理', '', 'Member [userId=null, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKic2dtJggBMIF5FZ61URtDJlTxglM1v9FQgbPYQfJ8JAiabev2BGDlcEX3DvibYHARAJFgLzRrgZPnQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0lfUu-vXrs4MbyBS3oq4jHE, province=Henan, city=Zhengzhou, country=CN, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(392, 'unionId为[oYGsJwOn_7OJs71Y3zqbqk_HzlxA]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-16 09:39:23', '游戏管理-会员管理', '', 'Member [userId=null, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKic2dtJggBMIF5FZ61URtDJlTxglM1v9FQgbPYQfJ8JAiabev2BGDlcEX3DvibYHARAJFgLzRrgZPnQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0lfUu-vXrs4MbyBS3oq4jHE, province=Henan, city=Zhengzhou, country=CN, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(393, 'unionId为[oYGsJwDV68nTWoK1q88jGjFDXDBA]的用户[åé³]\r\n注册了游戏！', NULL, NULL, '2018-01-16 09:49:01', '游戏管理-会员管理', '', 'Member [userId=null, account=oYGsJwDV68nTWoK1q88jGjFDXDBA, password=null, name=åé³, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/dSaJfdpeqHZx4M9pqPibFp8q1ksNIPsFDfbhV2FVfAiapXbMcRicUDibcdpONNzyTzGfqMlbMvCzNXeY1TehZCXaTg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0mtzpAwLnSe6mjxHTYCuAvk, province=Henan, city=Zhumadian, country=CN, unionId=oYGsJwDV68nTWoK1q88jGjFDXDBA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(394, 'unionId为[oYGsJwDV68nTWoK1q88jGjFDXDBA]的用户[åé³]\r\n注册了游戏！', NULL, NULL, '2018-01-16 09:52:10', '游戏管理-会员管理', '', 'Member [userId=null, account=oYGsJwDV68nTWoK1q88jGjFDXDBA, password=null, name=åé³, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/dSaJfdpeqHZx4M9pqPibFp8q1ksNIPsFDfbhV2FVfAiapXbMcRicUDibcdpONNzyTzGfqMlbMvCzNXeY1TehZCXaTg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0mtzpAwLnSe6mjxHTYCuAvk, province=Henan, city=Zhumadian, country=CN, unionId=oYGsJwDV68nTWoK1q88jGjFDXDBA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(395, 'unionId为[oYGsJwDV68nTWoK1q88jGjFDXDBA]的用户[åé³]\r\n注册了游戏！', NULL, NULL, '2018-01-16 09:53:36', '游戏管理-会员管理', '', 'Member [userId=null, account=oYGsJwDV68nTWoK1q88jGjFDXDBA, password=null, name=åé³, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/dSaJfdpeqHZx4M9pqPibFp8q1ksNIPsFDfbhV2FVfAiapXbMcRicUDibcdpONNzyTzGfqMlbMvCzNXeY1TehZCXaTg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0mtzpAwLnSe6mjxHTYCuAvk, province=Henan, city=Zhumadian, country=CN, unionId=oYGsJwDV68nTWoK1q88jGjFDXDBA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(396, 'unionId为[oYGsJwDV68nTWoK1q88jGjFDXDBA]的用户[向阳]\r\n注册了游戏！', NULL, NULL, '2018-01-16 09:55:35', '游戏管理-会员管理', '', 'Member [userId=null, account=oYGsJwDV68nTWoK1q88jGjFDXDBA, password=null, name=向阳, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/dSaJfdpeqHZx4M9pqPibFp8q1ksNIPsFDfbhV2FVfAiapXbMcRicUDibcdpONNzyTzGfqMlbMvCzNXeY1TehZCXaTg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0mtzpAwLnSe6mjxHTYCuAvk, province=Henan, city=Zhumadian, country=CN, unionId=oYGsJwDV68nTWoK1q88jGjFDXDBA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(397, 'Id为[null]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-16 12:55:38', '游戏管理-会员管理', '', 'Member [userId=null, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKic2dtJggBMIF5FZ61URtDJlTxglM1v9FQgbPYQfJ8JAiabev2BGDlcEX3DvibYHARAJFgLzRrgZPnQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0lfUu-vXrs4MbyBS3oq4jHE, province=Henan, city=Zhengzhou, country=CN, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(398, 'Id为[10000025]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-16 13:26:37', '游戏管理-会员管理', '', 'Member [userId=10000025, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKic2dtJggBMIF5FZ61URtDJlTxglM1v9FQgbPYQfJ8JAiabev2BGDlcEX3DvibYHARAJFgLzRrgZPnQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0lfUu-vXrs4MbyBS3oq4jHE, province=Henan, city=Zhengzhou, country=CN, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(399, 'Id为[10000026]的用户[永]\r\n注册了游戏！', NULL, NULL, '2018-01-16 13:27:51', '游戏管理-会员管理', '', 'Member [userId=10000026, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIdJ06elarJZvx4l8yGVYmQPDk0ApG7ibH6Z02oE9rsWnokzSq9h38t93UuEFRbibzvJedQYrKyTmhw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0nZDnHTLnhqXf2ipIAmQsRs, province=, city=, country=, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(400, 'Id为[10000027]的用户[小陈陈]\r\n注册了游戏！', NULL, NULL, '2018-01-16 14:39:44', '游戏管理-会员管理', '', 'Member [userId=10000027, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJz7QZDHCxTkQrNNeVTXABoLibayGSpPLKlYiboIpmrzVAWqvp5Z8ncBOMVvVNfjVYyjEeEEnKX3vtw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0omakGFTH5U72Ll-vP0XCik, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(401, 'id为1的用户在2018-01-16 15:20:28登录了系统。', 1, '潘志鹏', '2018-01-16 15:20:28', '1', '2018-01-15 09:45:32', '2018-01-16 15:20:28', '用户登录', NULL, ''),
	(402, 'id为1的用户在2018-01-16 15:26:07登录了系统。', 1, '潘志鹏', '2018-01-16 15:26:07', '1', '2018-01-16 15:20:28', '2018-01-16 15:26:07', '用户登录', NULL, ''),
	(403, 'id为1的用户在2018-01-16 15:39:36登录了系统。', 1, '潘志鹏', '2018-01-16 15:39:36', '1', '2018-01-16 15:26:07', '2018-01-16 15:39:36', '用户登录', NULL, ''),
	(404, 'id为1的用户在2018-01-16 15:41:01登录了系统。', 1, '潘志鹏', '2018-01-16 15:41:01', '1', '2018-01-16 15:39:36', '2018-01-16 15:41:01', '用户登录', NULL, ''),
	(405, 'id为1的用户在2018-01-17 14:23:20登录了系统。', 1, '潘志鹏', '2018-01-17 14:23:20', '1', '2018-01-16 15:41:01', '2018-01-17 14:23:20', '用户登录', NULL, ''),
	(406, '用户密码修改', 1, '潘志鹏', '2018-01-17 14:23:27', '1', '', '7c6c29686e7849ed0ae0a74989d3e630', '用户密码', NULL, ''),
	(407, 'id为1的用户在2018-01-17 14:25:49登录了系统。', 1, '潘志鹏', '2018-01-17 14:25:49', '1', '2018-01-17 14:23:20', '2018-01-17 14:25:49', '用户登录', NULL, ''),
	(408, 'id为1的用户在2018-01-17 14:28:14登录了系统。', 1, '潘志鹏', '2018-01-17 14:28:14', '1', '2018-01-17 14:25:49', '2018-01-17 14:28:14', '用户登录', NULL, ''),
	(409, 'id为1的用户在2018-01-17 14:30:12登录了系统。', 1, '潘志鹏', '2018-01-17 14:30:12', '1', '2018-01-17 14:28:14', '2018-01-17 14:30:12', '用户登录', NULL, ''),
	(410, 'id为1的用户在2018-01-17 15:18:58登录了系统。', 1, '潘志鹏', '2018-01-17 15:18:58', '1', '2018-01-17 14:30:12', '2018-01-17 15:18:58', '用户登录', NULL, ''),
	(411, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-17 15:34:06]\r\n对[资源-代理管理]\r\n做了[更新]操作:\r\n将旧值Resources [resourcesId=27, parentResourcesId=25, resourcesName=代理管理, resourcesUrl=/dynamic/console/agent/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=null, createUserId=null, remark=fa fa-th, status=1]\r\n更新为Resources [resourcesId=27, parentResourcesId=25, resourcesName=代理管理, resourcesUrl=/dynamic/console/agent/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=Sun Jan 14 01:52:09 CST 2018, createUserId=1, remark=fa fa-child, status=1]。', 1, '潘志鹏', '2018-01-17 15:34:06', '资源-代理管理', 'Resources [resourcesId=27, parentResourcesId=25, resourcesName=代理管理, resourcesUrl=/dynamic/console/agent/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=null, createUserId=null, remark=fa fa-th, status=1]', 'Resources [resourcesId=27, parentResourcesId=25, resourcesName=代理管理, resourcesUrl=/dynamic/console/agent/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=Sun Jan 14 01:52:09 CST 2018, createUserId=1, remark=fa fa-child, status=1]', '更新', NULL, '5'),
	(412, 'id为1的用户在2018-01-18 09:45:03登录了系统。', 1, '潘志鹏', '2018-01-18 09:45:03', '1', '2018-01-17 15:18:58', '2018-01-18 09:45:03', '用户登录', NULL, ''),
	(413, 'id为1的用户在2018-01-18 11:46:19登录了系统。', 1, '潘志鹏', '2018-01-18 11:46:19', '1', '2018-01-18 09:45:03', '2018-01-18 11:46:19', '用户登录', NULL, ''),
	(414, 'Id为[10000008]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-18 11:53:47', '游戏管理-会员管理', '', 'Member [userId=10000008, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKic2dtJggBMIF5FZ61URtDJlTxglM1v9FQgbPYQfJ8JAiabev2BGDlcEX3DvibYHARAJFgLzRrgZPnQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0lfUu-vXrs4MbyBS3oq4jHE, province=Henan, city=Zhengzhou, country=CN, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(415, 'Id为[10000009]的用户[小陈陈]\r\n注册了游戏！', NULL, NULL, '2018-01-18 12:05:24', '游戏管理-会员管理', '', 'Member [userId=10000009, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJz7QZDHCxTkQrNNeVTXABoLibayGSpPLKlYiboIpmrzVAWqvp5Z8ncBOMVvVNfjVYyjEeEEnKX3vtw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0omakGFTH5U72Ll-vP0XCik, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(416, 'Id为[10000010]的用户[郑向阳]\r\n注册了游戏！', NULL, NULL, '2018-01-18 12:45:55', '游戏管理-会员管理', '', 'Member [userId=10000010, account=oYGsJwDV68nTWoK1q88jGjFDXDBA, password=null, name=郑向阳, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/dSaJfdpeqHZx4M9pqPibFp8q1ksNIPsFDfbhV2FVfAiapXbMcRicUDibcdpONNzyTzGfqMlbMvCzNXeY1TehZCXaTg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0mtzpAwLnSe6mjxHTYCuAvk, province=Henan, city=Zhumadian, country=CN, unionId=oYGsJwDV68nTWoK1q88jGjFDXDBA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(417, 'Id为[10000011]的用户[永]\r\n注册了游戏！', NULL, NULL, '2018-01-18 13:09:16', '游戏管理-会员管理', '', 'Member [userId=10000011, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIdJ06elarJZvx4l8yGVYmQPDk0ApG7ibH6Z02oE9rsWnokzSq9h38t93UuEFRbibzvJedQYrKyTmhw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0nZDnHTLnhqXf2ipIAmQsRs, province=, city=, country=, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(418, 'id为1的用户在2018-01-18 14:20:45登录了系统。', 1, '潘志鹏', '2018-01-18 14:20:45', '1', '2018-01-18 11:46:19', '2018-01-18 14:20:45', '用户登录', NULL, ''),
	(419, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-18 14:51:39]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了代理申请。', 1, '潘志鹏', '2018-01-18 14:51:39', '资源', '', '代理申请', '添加', NULL, '5'),
	(420, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-18 14:54:20]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了提交申请。', 1, '潘志鹏', '2018-01-18 14:54:20', '资源', '', '提交申请', '添加', NULL, '5'),
	(421, 'id为1的用户在2018-01-18 15:20:09登录了系统。', 1, '潘志鹏', '2018-01-18 15:20:09', '1', '2018-01-18 14:20:45', '2018-01-18 15:20:09', '用户登录', NULL, ''),
	(422, '角色权限变更', 1, '潘志鹏', '2018-01-18 15:20:20', '1', '', '', '角色权限', NULL, ''),
	(423, 'id为1的用户在2018-01-18 15:20:28登录了系统。', 1, '潘志鹏', '2018-01-18 15:20:28', '1', '2018-01-18 15:20:09', '2018-01-18 15:20:28', '用户登录', NULL, ''),
	(424, 'Id为[10000012]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-18 18:34:56', '游戏管理-会员管理', '', 'Member [userId=10000012, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELuaibAZCIIiaeSjcy2VWQ8xn9iatZQCvGNmQOdBIm88Uum86RUnzZNpFehKE3Rfy9GlaqKtvSnvGOvw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oRqT91UfiIjaEGstj7Ol6DH3bubg, province=Henan, city=Zhengzhou, country=CN, unionId=null, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(425, 'Id为[10000013]的用户[小陈陈]\r\n注册了游戏！', NULL, NULL, '2018-01-18 18:35:45', '游戏管理-会员管理', '', 'Member [userId=10000013, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrKfFLKuicCiab4RjibVE9lariayvKFyPrrDLb4270icDEgE8EmmCYBSGd3PGfywldN9NdTI9HbfD3gIA/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oRqT91SskCAhHlwybNCaxH0q4bd8, province=, city=, country=, unionId=null, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(426, 'Id为[10000018]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-18 20:26:40', '游戏管理-会员管理', '', 'Member [userId=10000018, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELuaibAZCIIiaeSjcy2VWQ8xn9iatZQCvGNmQOdBIm88Uum86RUnzZNpFehKE3Rfy9GlaqKtvSnvGOvw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oRqT91UfiIjaEGstj7Ol6DH3bubg, province=Henan, city=Zhengzhou, country=CN, unionId=null, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(427, 'id为1的用户在2018-01-19 10:34:24登录了系统。', 1, '潘志鹏', '2018-01-19 10:34:24', '1', '2018-01-18 15:20:28', '2018-01-19 10:34:24', '用户登录', NULL, ''),
	(428, 'Id为[10000020]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-19 10:39:59', '游戏管理-会员管理', '', 'Member [userId=10000020, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKic2dtJggBMIF5FZ61URtDJlTxglM1v9FQgbPYQfJ8JAiabev2BGDlcEX3DvibYHARAJFgLzRrgZPnQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0lfUu-vXrs4MbyBS3oq4jHE, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(429, 'Id为[10000021]的用户[郑向阳]\r\n注册了游戏！', NULL, NULL, '2018-01-19 10:41:06', '游戏管理-会员管理', '', 'Member [userId=10000021, account=oYGsJwDV68nTWoK1q88jGjFDXDBA, password=null, name=郑向阳, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/dSaJfdpeqHZx4M9pqPibFp8q1ksNIPsFDfbhV2FVfAiapXbMcRicUDibcdpONNzyTzGfqMlbMvCzNXeY1TehZCXaTg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0mtzpAwLnSe6mjxHTYCuAvk, province=河南, city=驻马店, country=中国, unionId=oYGsJwDV68nTWoK1q88jGjFDXDBA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(430, 'Id为[10000022]的用户[永]\r\n注册了游戏！', NULL, NULL, '2018-01-19 10:41:58', '游戏管理-会员管理', '', 'Member [userId=10000022, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIdJ06elarJZvx4l8yGVYmQPDk0ApG7ibH6Z02oE9rsWnokzSq9h38t93UuEFRbibzvJedQYrKyTmhw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0nZDnHTLnhqXf2ipIAmQsRs, province=, city=, country=, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(431, 'id为1的用户在2018-01-19 10:42:59登录了系统。', 1, '潘志鹏', '2018-01-19 10:42:59', '1', '2018-01-19 10:34:24', '2018-01-19 10:42:59', '用户登录', NULL, ''),
	(432, 'id为1的用户在2018-01-19 11:09:59登录了系统。', 1, '潘志鹏', '2018-01-19 11:09:59', '1', '2018-01-19 10:42:59', '2018-01-19 11:09:59', '用户登录', NULL, ''),
	(433, 'Id为[10000023]的用户[小陈陈]\r\n注册了游戏！', NULL, NULL, '2018-01-19 11:10:41', '游戏管理-会员管理', '', 'Member [userId=10000023, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJz7QZDHCxTkQrNNeVTXABoLibayGSpPLKlYiboIpmrzVAWqvp5Z8ncBOMVvVNfjVYyjEeEEnKX3vtw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=oSzxh0omakGFTH5U72Ll-vP0XCik, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(434, 'id为1的用户在2018-01-19 11:36:09登录了系统。', 1, '潘志鹏', '2018-01-19 11:36:09', '1', '2018-01-19 11:09:59', '2018-01-19 11:36:09', '用户登录', NULL, ''),
	(435, 'id为1的用户在2018-01-19 11:44:12登录了系统。', 1, '潘志鹏', '2018-01-19 11:44:12', '1', '2018-01-19 11:36:09', '2018-01-19 11:44:12', '用户登录', NULL, ''),
	(436, 'id为1的用户在2018-01-19 11:44:44登录了系统。', 1, '潘志鹏', '2018-01-19 11:44:44', '1', '2018-01-19 11:44:12', '2018-01-19 11:44:44', '用户登录', NULL, ''),
	(437, 'id为1的用户在2018-01-19 11:56:43登录了系统。', 1, '潘志鹏', '2018-01-19 11:56:43', '1', '2018-01-19 11:44:44', '2018-01-19 11:56:43', '用户登录', NULL, ''),
	(438, 'id为1的用户在2018-01-19 11:57:38登录了系统。', 1, '潘志鹏', '2018-01-19 11:57:38', '1', '2018-01-19 11:56:43', '2018-01-19 11:57:38', '用户登录', NULL, ''),
	(439, 'id为1的用户在2018-01-19 12:01:22登录了系统。', 1, '潘志鹏', '2018-01-19 12:01:22', '1', '2018-01-19 11:57:38', '2018-01-19 12:01:22', '用户登录', NULL, ''),
	(440, 'id为4的用户在2018-01-19 12:06:33登录了系统。', 4, '郑向阳', '2018-01-19 12:06:33', '4', '2018-01-10 17:56:54', '2018-01-19 12:06:33', '用户登录', NULL, ''),
	(441, 'id为1的用户在2018-01-19 14:10:05登录了系统。', 1, '潘志鹏', '2018-01-19 14:10:05', '1', '2018-01-19 12:01:22', '2018-01-19 14:10:05', '用户登录', NULL, ''),
	(442, '角色信息变更', 1, '潘志鹏', '2018-01-19 14:10:43', '2', '', '高级代理', '角色', NULL, ''),
	(443, '角色权限变更', 1, '潘志鹏', '2018-01-19 14:12:58', '2', '', '', '角色权限', NULL, ''),
	(444, '角色信息变更', 1, '潘志鹏', '2018-01-19 14:13:56', '3', '', '中级代理', '角色', NULL, ''),
	(445, '角色信息变更', 1, '潘志鹏', '2018-01-19 14:14:06', '2', '', '高级代理', '角色', NULL, ''),
	(446, '添加新角色', 1, '潘志鹏', '2018-01-19 14:17:12', '初级代理', '', '初级代理', '角色', NULL, ''),
	(447, '添加新角色', 1, '潘志鹏', '2018-01-19 14:19:22', '直属代理', '', '直属代理', '角色', NULL, ''),
	(448, 'Id为[10000024]的用户[杨浩然]\r\n注册了游戏！', NULL, NULL, '2018-01-19 15:55:24', '游戏管理-会员管理', '', 'Member [userId=10000024, account=null, password=null, name=杨浩然, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJl6aFpuwKsFEAbpjjhUT3Bu0QS0aYLkpHypB30tsCDUmKicmMbE3BXS1xqeeibapuScXbY4PyEI48w/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=o3Wn30fxe_nNN5kSNSWH-wDA8u2Y, province=河南, city=郑州, country=中国, unionId=null, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(449, 'Id为[10000026]的用户[小陈陈]\r\n注册了游戏！', NULL, NULL, '2018-01-19 17:52:53', '游戏管理-会员管理', '', 'Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(450, 'Id为[10000027]的用户[ pao.]\r\n注册了游戏！', NULL, NULL, '2018-01-19 18:12:48', '游戏管理-会员管理', '', 'Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(451, 'id为1的用户在2018-01-20 10:55:28登录了系统。', 1, '潘志鹏', '2018-01-20 10:55:28', '1', '2018-01-19 14:10:05', '2018-01-20 10:55:28', '用户登录', NULL, ''),
	(452, '角色权限变更', 1, '潘志鹏', '2018-01-20 10:55:54', '1', '', '', '角色权限', NULL, ''),
	(453, 'id为1的用户在2018-01-20 10:56:03登录了系统。', 1, '潘志鹏', '2018-01-20 10:56:03', '1', '2018-01-20 10:55:28', '2018-01-20 10:56:03', '用户登录', NULL, ''),
	(454, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 11:03:55]\r\n对[字典类型-充值方式]\r\n做了[添加]操作:\r\n添加了充值方式。', 1, '潘志鹏', '2018-01-20 11:03:55', '字典类型-充值方式', '', '充值方式', '添加', NULL, '22'),
	(455, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 11:04:06]\r\n对[字典类型-充值方式]\r\n做了[删除]操作:\r\n删除了0。', 1, '潘志鹏', '2018-01-20 11:04:06', '字典类型-充值方式', '0', '', '删除', NULL, '22'),
	(456, 'id为1的用户在2018-01-20 11:05:58登录了系统。', 1, '潘志鹏', '2018-01-20 11:05:58', '1', '2018-01-20 10:56:03', '2018-01-20 11:05:58', '用户登录', NULL, ''),
	(457, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 11:06:58]\r\n对[字典类型-充值方式]\r\n做了[添加]操作:\r\n添加了充值方式。', 1, '潘志鹏', '2018-01-20 11:06:58', '字典类型-充值方式', '', '充值方式', '添加', NULL, '22'),
	(458, 'id为1的用户在2018-01-20 11:10:05登录了系统。', 1, '潘志鹏', '2018-01-20 11:10:05', '1', '2018-01-20 11:05:58', '2018-01-20 11:10:05', '用户登录', NULL, ''),
	(459, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 11:11:55]\r\n对[字典类型-123]\r\n做了[添加]操作:\r\n添加了123。', 1, '潘志鹏', '2018-01-20 11:11:55', '字典类型-123', '', '123', '添加', NULL, '22'),
	(460, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 11:12:00]\r\n对[字典类型-123]\r\n做了[删除]操作:\r\n删除了08。', 1, '潘志鹏', '2018-01-20 11:12:00', '字典类型-123', '08', '', '删除', NULL, '22'),
	(461, '添加字典', 1, '潘志鹏', '2018-01-20 11:14:41', '游戏内充值', '', '游戏内充值', '字典', NULL, ''),
	(462, '添加字典', 1, '潘志鹏', '2018-01-20 11:15:03', '代理充值', '', '代理充值', '字典', NULL, ''),
	(463, '添加字典', 1, '潘志鹏', '2018-01-20 11:15:23', '管理员充值', '', '管理员充值', '字典', NULL, ''),
	(464, '添加新角色', 1, '潘志鹏', '2018-01-20 11:18:31', '系统管理员', '', '系统管理员', '角色', NULL, ''),
	(465, '角色权限变更', 1, '潘志鹏', '2018-01-20 11:20:50', '6', '', '', '角色权限', NULL, ''),
	(466, '用户分配角色', 1, '潘志鹏', '2018-01-20 11:21:28', '2', '', '', '分配角色', NULL, ''),
	(467, 'id为2的用户在2018-01-20 11:21:40登录了系统。', 2, '王永科', '2018-01-20 11:21:40', '2', '2018-01-12 11:03:23', '2018-01-20 11:21:40', '用户登录', NULL, ''),
	(468, 'id为1的用户在2018-01-20 11:22:16登录了系统。', 1, '潘志鹏', '2018-01-20 11:22:16', '1', '2018-01-20 11:10:05', '2018-01-20 11:22:16', '用户登录', NULL, ''),
	(469, '角色权限变更', 1, '潘志鹏', '2018-01-20 11:22:52', '6', '', '', '角色权限', NULL, ''),
	(470, 'id为2的用户在2018-01-20 11:23:01登录了系统。', 2, '王永科', '2018-01-20 11:23:01', '2', '2018-01-20 11:21:40', '2018-01-20 11:23:01', '用户登录', NULL, ''),
	(471, 'id为1的用户在2018-01-20 11:23:36登录了系统。', 1, '潘志鹏', '2018-01-20 11:23:36', '1', '2018-01-20 11:22:16', '2018-01-20 11:23:36', '用户登录', NULL, ''),
	(472, '角色权限变更', 1, '潘志鹏', '2018-01-20 11:23:53', '6', '', '', '角色权限', NULL, ''),
	(473, 'id为2的用户在2018-01-20 11:24:17登录了系统。', 2, '王永科', '2018-01-20 11:24:17', '2', '2018-01-20 11:23:01', '2018-01-20 11:24:17', '用户登录', NULL, ''),
	(474, 'id为1的用户在2018-01-20 11:40:17登录了系统。', 1, '潘志鹏', '2018-01-20 11:40:17', '1', '2018-01-20 11:23:36', '2018-01-20 11:40:17', '用户登录', NULL, ''),
	(475, 'Id为[10000028]的用户[永]\r\n注册了游戏！', NULL, NULL, '2018-01-20 11:58:15', '游戏管理-会员管理', '', 'Member [userId=10000028, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=o3Wn30RouVFI4P0HfXPGK91aqkMk, province=河南, city=郑州, country=中国, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(476, 'id为1的用户在2018-01-20 15:26:13登录了系统。', 1, '潘志鹏', '2018-01-20 15:26:13', '1', '2018-01-20 11:40:17', '2018-01-20 15:26:13', '用户登录', NULL, ''),
	(477, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 15:36:06]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]\r\n更新为Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-20 15:36:06', '游戏管理-会员管理', 'Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]', 'Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(478, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 15:36:18]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]\r\n更新为Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-20 15:36:18', '游戏管理-会员管理', 'Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]', 'Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(479, 'id为1的用户在2018-01-20 15:38:55登录了系统。', 1, '潘志鹏', '2018-01-20 15:38:55', '1', '2018-01-20 15:26:13', '2018-01-20 15:38:55', '用户登录', NULL, ''),
	(480, 'id为1的用户在2018-01-20 15:40:03登录了系统。', 1, '潘志鹏', '2018-01-20 15:40:03', '1', '2018-01-20 15:38:55', '2018-01-20 15:40:03', '用户登录', NULL, ''),
	(481, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 15:40:23]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]\r\n更新为Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-20 15:40:23', '游戏管理-会员管理', 'Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]', 'Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(482, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 15:40:58]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000028, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=, weChatId=o3Wn30RouVFI4P0HfXPGK91aqkMk, province=河南, city=郑州, country=中国, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 11:58:15 CST 2018, createTime=Sat Jan 20 11:58:15 CST 2018, status=1]\r\n更新为Member [userId=10000028, account=null, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=null, experience=null, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=15697824567, isAgent=0, agentId=2, agentLevel=null, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-20 15:40:58', '游戏管理-会员管理', 'Member [userId=10000028, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=, weChatId=o3Wn30RouVFI4P0HfXPGK91aqkMk, province=河南, city=郑州, country=中国, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 11:58:15 CST 2018, createTime=Sat Jan 20 11:58:15 CST 2018, status=1]', 'Member [userId=10000028, account=null, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=null, experience=null, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=15697824567, isAgent=0, agentId=2, agentLevel=null, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(483, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 15:41:05]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=18012345678, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]\r\n更新为Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-20 15:41:05', '游戏管理-会员管理', 'Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=18012345678, isAgent=0, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=Sat Jan 20 12:01:38 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]', 'Member [userId=10000026, account=null, password=null, name=小陈陈, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=20, gems=20, pkCard=20, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=null, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(484, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 15:41:10]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000028, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=, weChatId=o3Wn30RouVFI4P0HfXPGK91aqkMk, province=河南, city=郑州, country=中国, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=15697824567, isAgent=0, agentId=2, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 11:58:15 CST 2018, createTime=Sat Jan 20 11:58:15 CST 2018, status=1]\r\n更新为Member [userId=10000028, account=null, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=null, experience=null, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=15697824567, isAgent=1, agentId=2, agentLevel=null, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-20 15:41:10', '游戏管理-会员管理', 'Member [userId=10000028, account=oYGsJwKA5OgkeXlot1GpM4NOGiKM, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=, weChatId=o3Wn30RouVFI4P0HfXPGK91aqkMk, province=河南, city=郑州, country=中国, unionId=oYGsJwKA5OgkeXlot1GpM4NOGiKM, privilege=null, introducer=null, mobile=15697824567, isAgent=0, agentId=2, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 11:58:15 CST 2018, createTime=Sat Jan 20 11:58:15 CST 2018, status=1]', 'Member [userId=10000028, account=null, password=null, name=永, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132, level=null, experience=null, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=15697824567, isAgent=1, agentId=2, agentLevel=null, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(485, 'id为2的用户在2018-01-20 15:46:42登录了系统。', 2, '王永科', '2018-01-20 15:46:42', '2', '2018-01-20 11:24:17', '2018-01-20 15:46:42', '用户登录', NULL, ''),
	(486, 'id为4的用户在2018-01-20 15:47:53登录了系统。', 4, '郑向阳', '2018-01-20 15:47:53', '4', '2018-01-19 12:06:33', '2018-01-20 15:47:53', '用户登录', NULL, ''),
	(487, '用户分配角色', 4, '郑向阳', '2018-01-20 15:48:24', '4', '', '', '分配角色', NULL, ''),
	(488, 'id为4的用户在2018-01-20 15:48:29登录了系统。', 4, '郑向阳', '2018-01-20 15:48:29', '4', '2018-01-20 15:47:53', '2018-01-20 15:48:29', '用户登录', NULL, ''),
	(489, 'id为4的用户在2018-01-20 15:49:17登录了系统。', 4, '郑向阳', '2018-01-20 15:49:17', '4', '2018-01-20 15:48:29', '2018-01-20 15:49:17', '用户登录', NULL, ''),
	(490, 'id为2的用户在2018-01-20 16:06:52登录了系统。', 2, '王永科', '2018-01-20 16:06:52', '2', '2018-01-20 15:46:42', '2018-01-20 16:06:52', '用户登录', NULL, ''),
	(491, 'id为1的用户在2018-01-20 16:07:11登录了系统。', 1, '潘志鹏', '2018-01-20 16:07:11', '1', '2018-01-20 15:40:03', '2018-01-20 16:07:11', '用户登录', NULL, ''),
	(492, '用户分配角色', 1, '潘志鹏', '2018-01-20 16:07:30', '2', '', '', '分配角色', NULL, ''),
	(493, 'id为2的用户在2018-01-20 16:07:38登录了系统。', 2, '王永科', '2018-01-20 16:07:38', '2', '2018-01-20 16:06:52', '2018-01-20 16:07:38', '用户登录', NULL, ''),
	(494, 'id为1的用户在2018-01-20 16:07:53登录了系统。', 1, '潘志鹏', '2018-01-20 16:07:53', '1', '2018-01-20 16:07:11', '2018-01-20 16:07:53', '用户登录', NULL, ''),
	(495, '角色权限变更', 1, '潘志鹏', '2018-01-20 16:09:32', '2', '', '', '角色权限', NULL, ''),
	(496, '角色权限变更', 1, '潘志鹏', '2018-01-20 16:09:43', '3', '', '', '角色权限', NULL, ''),
	(497, '角色权限变更', 1, '潘志鹏', '2018-01-20 16:10:02', '4', '', '', '角色权限', NULL, ''),
	(498, '角色权限变更', 1, '潘志鹏', '2018-01-20 16:10:34', '4', '', '', '角色权限', NULL, ''),
	(499, '角色权限变更', 1, '潘志鹏', '2018-01-20 16:10:41', '2', '', '', '角色权限', NULL, ''),
	(500, 'id为2的用户在2018-01-20 16:11:03登录了系统。', 2, '王永科', '2018-01-20 16:11:03', '2', '2018-01-20 16:07:38', '2018-01-20 16:11:03', '用户登录', NULL, ''),
	(501, 'id为2的用户在2018-01-20 16:25:24登录了系统。', 2, '王永科', '2018-01-20 16:25:24', '2', '2018-01-20 16:11:03', '2018-01-20 16:25:24', '用户登录', NULL, ''),
	(502, 'id为2的用户在2018-01-20 17:17:59登录了系统。', 2, '王永科', '2018-01-20 17:17:59', '2', '2018-01-20 16:25:24', '2018-01-20 17:17:59', '用户登录', NULL, ''),
	(503, 'id为2的用户在2018-01-20 17:22:42登录了系统。', 2, '王永科', '2018-01-20 17:22:42', '2', '2018-01-20 17:17:59', '2018-01-20 17:22:42', '用户登录', NULL, ''),
	(504, 'id为1的用户在2018-01-20 17:23:08登录了系统。', 1, '潘志鹏', '2018-01-20 17:23:08', '1', '2018-01-20 16:07:53', '2018-01-20 17:23:08', '用户登录', NULL, ''),
	(505, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 17:28:13]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了充值记录。', 1, '潘志鹏', '2018-01-20 17:28:13', '资源', '', '充值记录', '添加', NULL, '5'),
	(506, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-20 17:29:17]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了充值查询。', 1, '潘志鹏', '2018-01-20 17:29:17', '资源', '', '充值查询', '添加', NULL, '5'),
	(507, 'id为1的用户在2018-01-20 17:29:30登录了系统。', 1, '潘志鹏', '2018-01-20 17:29:30', '1', '2018-01-20 17:23:08', '2018-01-20 17:29:30', '用户登录', NULL, ''),
	(508, '角色权限变更', 1, '潘志鹏', '2018-01-20 17:29:58', '1', '', '', '角色权限', NULL, ''),
	(509, 'id为1的用户在2018-01-20 17:30:06登录了系统。', 1, '潘志鹏', '2018-01-20 17:30:06', '1', '2018-01-20 17:29:30', '2018-01-20 17:30:06', '用户登录', NULL, ''),
	(510, 'id为1的用户在2018-01-20 17:35:35登录了系统。', 1, '潘志鹏', '2018-01-20 17:35:35', '1', '2018-01-20 17:30:06', '2018-01-20 17:35:35', '用户登录', NULL, ''),
	(511, 'id为1的用户在2018-01-20 17:38:54登录了系统。', 1, '潘志鹏', '2018-01-20 17:38:54', '1', '2018-01-20 17:35:35', '2018-01-20 17:38:54', '用户登录', NULL, ''),
	(512, 'id为1的用户在2018-01-20 17:50:33登录了系统。', 1, '潘志鹏', '2018-01-20 17:50:33', '1', '2018-01-20 17:38:54', '2018-01-20 17:50:33', '用户登录', NULL, ''),
	(513, 'id为1的用户在2018-01-20 18:02:40登录了系统。', 1, '潘志鹏', '2018-01-20 18:02:40', '1', '2018-01-20 17:50:33', '2018-01-20 18:02:40', '用户登录', NULL, ''),
	(514, 'id为1的用户在2018-01-20 18:10:35登录了系统。', 1, '潘志鹏', '2018-01-20 18:10:35', '1', '2018-01-20 18:02:40', '2018-01-20 18:10:35', '用户登录', NULL, ''),
	(515, 'id为1的用户在2018-01-23 09:47:38登录了系统。', 1, '潘志鹏', '2018-01-23 09:47:38', '1', '2018-01-20 18:10:35', '2018-01-23 09:47:38', '用户登录', NULL, ''),
	(516, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-23 09:51:31]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了设置代理。', 1, '潘志鹏', '2018-01-23 09:51:31', '资源', '', '设置代理', '添加', NULL, '5'),
	(517, '角色权限变更', 1, '潘志鹏', '2018-01-23 09:56:43', '1', '', '', '角色权限', NULL, ''),
	(518, 'id为1的用户在2018-01-23 09:56:47登录了系统。', 1, '潘志鹏', '2018-01-23 09:56:47', '1', '2018-01-23 09:47:38', '2018-01-23 09:56:47', '用户登录', NULL, ''),
	(519, 'Id为[10000029]的用户[dk]\r\n注册了游戏！', NULL, NULL, '2018-01-23 09:57:10', '游戏管理-会员管理', '', 'Member [userId=10000029, account=oYGsJwI-DOPicHIO2sMkZtBn0YHU, password=null, name=dk, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKmVah0XkicZoKvQ4ibuLQGQk7ZqRic74cl3qKulPbc0aJGuBUKyyoflxRO8iagmC6z0PjEY7gqicb5xxQ/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=o3Wn30WVWMfnMWYAIpgbbF6aWKN8, province=河南, city=郑州, country=中国, unionId=oYGsJwI-DOPicHIO2sMkZtBn0YHU, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(520, 'Id为[10000030]的用户[郑向阳]\r\n注册了游戏！', NULL, NULL, '2018-01-23 09:59:03', '游戏管理-会员管理', '', 'Member [userId=10000030, account=oYGsJwDV68nTWoK1q88jGjFDXDBA, password=null, name=郑向阳, sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/mzZkwf53jx0NmiapEic4b863ic0ju6cRoNz6qYdHP2YwDibU5bUJlcic40YCJhG1vmqctOA3jsXk2HBuwVvwiboI8yfg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=o3Wn30Z_OFBf8XZ1xS-gNj4c6iQI, province=河南, city=驻马店, country=中国, unionId=oYGsJwDV68nTWoK1q88jGjFDXDBA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(521, 'Id为[10000031]的用户[女人无情便是王]\r\n注册了游戏！', NULL, NULL, '2018-01-23 10:01:26', '游戏管理-会员管理', '', 'Member [userId=10000031, account=oYGsJwAGDp5cQ1QPGoBj5Pk16J1s, password=null, name=女人无情便是王, sex=0, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKmZtAPkTbibP99bH5r1SLia2tVSJPia2AlRUjcNGicDXKZnNkyeWAVAh9P0QXkEJY3hgqxcjuibdQCcYg/132, level=0, experience=0, coins=0, gems=0, pkCard=0, roomId=null, gameType=null, history=null, weChatId=o3Wn30TjIfEC3_VXYakbsNPqVSGg, province=河南, city=洛阳, country=中国, unionId=oYGsJwAGDp5cQ1QPGoBj5Pk16J1s, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=null, createTime=null, status=null]', '注册', NULL, ''),
	(522, 'id为1的用户在2018-01-23 11:22:02登录了系统。', 1, '潘志鹏', '2018-01-23 11:22:02', '1', '2018-01-23 09:56:47', '2018-01-23 11:22:02', '用户登录', NULL, ''),
	(523, 'id为1的用户在2018-01-23 11:24:29登录了系统。', 1, '潘志鹏', '2018-01-23 11:24:29', '1', '2018-01-23 11:22:02', '2018-01-23 11:24:29', '用户登录', NULL, ''),
	(524, '用户分配角色', 1, '潘志鹏', '2018-01-23 11:52:02', '1', '', '', '分配角色', NULL, ''),
	(525, '用户分配角色', 1, '潘志鹏', '2018-01-23 11:52:18', '1', '', '', '分配角色', NULL, ''),
	(526, 'id为1的用户在2018-01-23 15:15:00登录了系统。', 1, '潘志鹏', '2018-01-23 15:15:00', '1', '2018-01-23 11:24:29', '2018-01-23 15:15:00', '用户登录', NULL, ''),
	(527, '角色权限变更', 1, '潘志鹏', '2018-01-23 15:15:24', '2', '', '', '角色权限', NULL, ''),
	(528, 'id为2的用户在2018-01-23 15:15:34登录了系统。', 2, '王永科', '2018-01-23 15:15:34', '2', '2018-01-20 17:22:42', '2018-01-23 15:15:34', '用户登录', NULL, ''),
	(529, 'id为2的用户在2018-01-23 15:31:51登录了系统。', 2, '王永科', '2018-01-23 15:31:51', '2', '2018-01-23 15:15:34', '2018-01-23 15:31:51', '用户登录', NULL, ''),
	(530, 'id为2的用户在2018-01-23 15:45:31登录了系统。', 2, '王永科', '2018-01-23 15:45:31', '2', '2018-01-23 15:31:51', '2018-01-23 15:45:31', '用户登录', NULL, ''),
	(531, 'id为2的用户在2018-01-23 15:55:07登录了系统。', 2, '王永科', '2018-01-23 15:55:07', '2', '2018-01-23 15:45:31', '2018-01-23 15:55:07', '用户登录', NULL, ''),
	(532, 'id为2的用户在2018-01-23 16:09:18登录了系统。', 2, '王永科', '2018-01-23 16:09:18', '2', '2018-01-23 15:55:07', '2018-01-23 16:09:18', '用户登录', NULL, ''),
	(533, 'id为2的用户在2018-01-23 16:11:35登录了系统。', 2, '王永科', '2018-01-23 16:11:35', '2', '2018-01-23 16:09:18', '2018-01-23 16:11:35', '用户登录', NULL, ''),
	(534, 'id为2的用户在2018-01-23 16:26:30登录了系统。', 2, '王永科', '2018-01-23 16:26:30', '2', '2018-01-23 16:11:35', '2018-01-23 16:26:30', '用户登录', NULL, ''),
	(535, 'id为2的用户在2018-01-23 16:29:17登录了系统。', 2, '王永科', '2018-01-23 16:29:17', '2', '2018-01-23 16:26:30', '2018-01-23 16:29:17', '用户登录', NULL, ''),
	(536, 'id为18的用户在2018-01-23 16:30:47登录了系统。', 18, 'dk', '2018-01-23 16:30:47', '18', '2018-01-23 16:30:23', '2018-01-23 16:30:47', '用户登录', NULL, ''),
	(537, 'id为1的用户在2018-01-23 16:37:38登录了系统。', 1, '潘志鹏', '2018-01-23 16:37:38', '1', '2018-01-23 15:15:00', '2018-01-23 16:37:38', '用户登录', NULL, ''),
	(538, '角色权限变更', 1, '潘志鹏', '2018-01-23 16:38:50', '1', '', '', '角色权限', NULL, ''),
	(539, 'id为2的用户在2018-01-23 16:39:45登录了系统。', 2, '王永科', '2018-01-23 16:39:45', '2', '2018-01-23 16:29:17', '2018-01-23 16:39:45', '用户登录', NULL, ''),
	(540, 'id为1的用户在2018-01-23 16:40:18登录了系统。', 1, '潘志鹏', '2018-01-23 16:40:18', '1', '2018-01-23 16:37:38', '2018-01-23 16:40:18', '用户登录', NULL, ''),
	(541, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-23 16:41:08]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了绑定会员。', 1, '潘志鹏', '2018-01-23 16:41:08', '资源', '', '绑定会员', '添加', NULL, '5'),
	(542, 'id为1的用户在2018-01-23 16:50:26登录了系统。', 1, '潘志鹏', '2018-01-23 16:50:26', '1', '2018-01-23 16:40:18', '2018-01-23 16:50:26', '用户登录', NULL, ''),
	(543, 'id为1的用户在2018-01-23 17:08:47登录了系统。', 1, '潘志鹏', '2018-01-23 17:08:47', '1', '2018-01-23 16:50:26', '2018-01-23 17:08:47', '用户登录', NULL, ''),
	(544, '角色权限变更', 1, '潘志鹏', '2018-01-23 17:09:12', '2', '', '', '角色权限', NULL, ''),
	(545, 'id为1的用户在2018-01-23 17:09:24登录了系统。', 1, '潘志鹏', '2018-01-23 17:09:24', '1', '2018-01-23 17:08:47', '2018-01-23 17:09:24', '用户登录', NULL, ''),
	(546, 'id为2的用户在2018-01-23 17:09:34登录了系统。', 2, '王永科', '2018-01-23 17:09:34', '2', '2018-01-23 16:39:45', '2018-01-23 17:09:34', '用户登录', NULL, ''),
	(547, 'id为2的用户在2018-01-24 09:20:13登录了系统。', 2, '王永科', '2018-01-24 09:20:13', '2', '2018-01-23 17:09:34', '2018-01-24 09:20:13', '用户登录', NULL, ''),
	(548, 'id为1的用户在2018-01-24 09:22:00登录了系统。', 1, '潘志鹏', '2018-01-24 09:22:00', '1', '2018-01-23 17:09:24', '2018-01-24 09:22:00', '用户登录', NULL, ''),
	(549, 'id为1的用户在2018-01-24 09:23:31登录了系统。', 1, '潘志鹏', '2018-01-24 09:23:31', '1', '2018-01-24 09:22:00', '2018-01-24 09:23:31', '用户登录', NULL, ''),
	(550, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:24:30', '3', '', '', '角色权限', NULL, ''),
	(551, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:24:46', '2', '', '', '角色权限', NULL, ''),
	(552, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:24:58', '3', '', '', '角色权限', NULL, ''),
	(553, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:25:20', '4', '', '', '角色权限', NULL, ''),
	(554, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:25:53', '5', '', '', '角色权限', NULL, ''),
	(555, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:26:08', '6', '', '', '角色权限', NULL, ''),
	(556, 'id为1的用户在2018-01-24 09:26:15登录了系统。', 1, '潘志鹏', '2018-01-24 09:26:15', '1', '2018-01-24 09:23:31', '2018-01-24 09:26:15', '用户登录', NULL, ''),
	(557, 'id为1的用户在2018-01-24 09:28:29登录了系统。', 1, '潘志鹏', '2018-01-24 09:28:29', '1', '2018-01-24 09:26:15', '2018-01-24 09:28:29', '用户登录', NULL, ''),
	(558, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:28:37', '1', '', '', '角色权限', NULL, ''),
	(559, 'id为1的用户在2018-01-24 09:28:47登录了系统。', 1, '潘志鹏', '2018-01-24 09:28:47', '1', '2018-01-24 09:28:29', '2018-01-24 09:28:47', '用户登录', NULL, ''),
	(560, 'id为1的用户在2018-01-24 09:33:49登录了系统。', 1, '潘志鹏', '2018-01-24 09:33:49', '1', '2018-01-24 09:28:47', '2018-01-24 09:33:49', '用户登录', NULL, ''),
	(561, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:37:22', '1', '', '', '角色权限', NULL, ''),
	(562, '角色权限变更', 1, '潘志鹏', '2018-01-24 09:37:46', '6', '', '', '角色权限', NULL, ''),
	(563, 'id为1的用户在2018-01-24 09:37:51登录了系统。', 1, '潘志鹏', '2018-01-24 09:37:51', '1', '2018-01-24 09:33:49', '2018-01-24 09:37:51', '用户登录', NULL, ''),
	(564, 'id为1的用户在2018-01-24 09:50:23登录了系统。', 1, '潘志鹏', '2018-01-24 09:50:23', '1', '2018-01-24 09:37:51', '2018-01-24 09:50:23', '用户登录', NULL, ''),
	(565, 'id为1的用户在2018-01-24 09:56:57登录了系统。', 1, '潘志鹏', '2018-01-24 09:56:57', '1', '2018-01-24 09:50:23', '2018-01-24 09:56:57', '用户登录', NULL, ''),
	(566, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-24 09:57:47]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]\r\n更新为Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=1, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-24 09:57:47', '游戏管理-会员管理', 'Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]', 'Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=1, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(567, 'id为1的用户在2018-01-24 10:11:07登录了系统。', 1, '潘志鹏', '2018-01-24 10:11:07', '1', '2018-01-24 09:56:57', '2018-01-24 10:11:07', '用户登录', NULL, ''),
	(568, 'id为1的用户在2018-01-24 10:17:49登录了系统。', 1, '潘志鹏', '2018-01-24 10:17:49', '1', '2018-01-24 10:11:07', '2018-01-24 10:17:49', '用户登录', NULL, ''),
	(569, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-24 10:18:59]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=1, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]\r\n更新为Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-24 10:18:59', '游戏管理-会员管理', 'Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=1, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]', 'Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(570, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-24 10:19:26]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]\r\n更新为Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-24 10:19:26', '游戏管理-会员管理', 'Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=null, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]', 'Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(571, 'id为2的用户在2018-01-24 10:32:55登录了系统。', 2, '王永科', '2018-01-24 10:32:55', '2', '2018-01-24 09:20:13', '2018-01-24 10:32:55', '用户登录', NULL, ''),
	(572, 'id为2的用户在2018-01-24 10:57:02登录了系统。', 2, '王永科', '2018-01-24 10:57:02', '2', '2018-01-24 10:32:55', '2018-01-24 10:57:02', '用户登录', NULL, ''),
	(573, 'id为1的用户在2018-01-24 13:15:17登录了系统。', 1, '潘志鹏', '2018-01-24 13:15:17', '1', '2018-01-24 10:17:49', '2018-01-24 13:15:17', '用户登录', NULL, ''),
	(574, 'id为1的用户在2018-01-24 13:55:46登录了系统。', 1, '潘志鹏', '2018-01-24 13:55:46', '1', '2018-01-24 13:15:17', '2018-01-24 13:55:46', '用户登录', NULL, ''),
	(575, 'id为1的用户在2018-01-24 15:02:31登录了系统。', 1, '潘志鹏', '2018-01-24 15:02:31', '1', '2018-01-24 13:55:46', '2018-01-24 15:02:31', '用户登录', NULL, ''),
	(576, 'id为1的用户在2018-01-24 16:10:15登录了系统。', 1, '潘志鹏', '2018-01-24 16:10:15', '1', '2018-01-24 15:02:31', '2018-01-24 16:10:15', '用户登录', NULL, ''),
	(577, '角色权限变更', 1, '潘志鹏', '2018-01-24 16:10:26', '2', '', '', '角色权限', NULL, ''),
	(578, 'id为2的用户在2018-01-24 16:10:46登录了系统。', 2, '王永科', '2018-01-24 16:10:46', '2', '2018-01-24 10:57:02', '2018-01-24 16:10:46', '用户登录', NULL, ''),
	(579, 'id为2的用户在2018-01-24 17:01:24登录了系统。', 2, '王永科', '2018-01-24 17:01:24', '2', '2018-01-24 16:10:46', '2018-01-24 17:01:24', '用户登录', NULL, ''),
	(580, 'id为2的用户在2018-01-24 17:02:39登录了系统。', 2, '王永科', '2018-01-24 17:02:39', '2', '2018-01-24 17:01:24', '2018-01-24 17:02:39', '用户登录', NULL, ''),
	(581, 'id为2的用户在2018-01-24 17:12:38登录了系统。', 2, '王永科', '2018-01-24 17:12:38', '2', '2018-01-24 17:02:39', '2018-01-24 17:12:38', '用户登录', NULL, ''),
	(582, 'id为2的用户在2018-01-24 17:17:37登录了系统。', 2, '王永科', '2018-01-24 17:17:37', '2', '2018-01-24 17:12:38', '2018-01-24 17:17:37', '用户登录', NULL, ''),
	(583, 'id为2的用户在2018-01-24 17:27:11登录了系统。', 2, '王永科', '2018-01-24 17:27:11', '2', '2018-01-24 17:17:37', '2018-01-24 17:27:11', '用户登录', NULL, ''),
	(584, 'id为1的用户在2018-01-24 17:30:20登录了系统。', 1, '潘志鹏', '2018-01-24 17:30:20', '1', '2018-01-24 16:10:15', '2018-01-24 17:30:20', '用户登录', NULL, ''),
	(585, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-24 17:31:12]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=2, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]\r\n更新为Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=3, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-24 17:31:12', '游戏管理-会员管理', 'Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=2, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]', 'Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=3, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(586, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-24 17:31:25]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=3, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]\r\n更新为Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-24 17:31:25', '游戏管理-会员管理', 'Member [userId=10000027, account=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=0, experience=0, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=, weChatId=o3Wn30Wq4iPVD71wLPFdOqhOa-g0, province=河南, city=郑州, country=中国, unionId=oYGsJwOn_7OJs71Y3zqbqk_HzlxA, privilege=null, introducer=null, mobile=null, isAgent=0, agentId=null, agentLevel=null, parent_agent_id=3, lastLoginTime=Sat Jan 20 12:35:27 CST 2018, createTime=Fri Jan 19 18:12:48 CST 2018, status=1]', 'Member [userId=10000027, account=null, password=null, name= pao., sex=1, headImg=http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132, level=null, experience=null, coins=9999, gems=1009, pkCard=99999, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=, isAgent=0, agentId=, agentLevel=, parent_agent_id=, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(587, '角色权限变更', 1, '潘志鹏', '2018-01-24 17:32:28', '1', '', '', '角色权限', NULL, ''),
	(588, '角色权限变更', 1, '潘志鹏', '2018-01-24 17:32:37', '6', '', '', '角色权限', NULL, ''),
	(589, 'id为1的用户在2018-01-24 17:32:46登录了系统。', 1, '潘志鹏', '2018-01-24 17:32:46', '1', '2018-01-24 17:30:20', '2018-01-24 17:32:46', '用户登录', NULL, ''),
	(590, 'id为1的用户在2018-01-24 17:34:07登录了系统。', 1, '潘志鹏', '2018-01-24 17:34:07', '1', '2018-01-24 17:32:46', '2018-01-24 17:34:07', '用户登录', NULL, ''),
	(591, 'id为1的用户在2018-01-25 09:41:06登录了系统。', 1, '潘志鹏', '2018-01-25 09:41:06', '1', '2018-01-24 17:34:07', '2018-01-25 09:41:06', '用户登录', NULL, ''),
	(592, '角色权限变更', 1, '潘志鹏', '2018-01-25 09:41:45', '1', '', '', '角色权限', NULL, ''),
	(593, '角色权限变更', 1, '潘志鹏', '2018-01-25 09:42:17', '6', '', '', '角色权限', NULL, ''),
	(594, 'id为1的用户在2018-01-25 09:43:10登录了系统。', 1, '潘志鹏', '2018-01-25 09:43:10', '1', '2018-01-25 09:41:06', '2018-01-25 09:43:10', '用户登录', NULL, ''),
	(595, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 09:43:31]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=Tue Jan 23 10:00:41 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]\r\n更新为Member [userId=10000026, account=null, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=null, createTime=null, status=0]。', 1, '潘志鹏', '2018-01-25 09:43:31', '游戏管理-会员管理', 'Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=Tue Jan 23 10:00:41 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=1]', 'Member [userId=10000026, account=null, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=null, createTime=null, status=0]', '更新', NULL, '26'),
	(596, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 09:43:35]\r\n对[游戏管理-会员管理]\r\n做了[更新]操作:\r\n将旧值Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=Tue Jan 23 10:00:41 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=0]\r\n更新为Member [userId=10000026, account=null, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]。', 1, '潘志鹏', '2018-01-25 09:43:35', '游戏管理-会员管理', 'Member [userId=10000026, account=oYGsJwDF2WgPQ9G7tpf_xm5-73do, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=0, experience=0, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=, weChatId=o3Wn30c-pd7QJsYhXcKk3SAGqJb0, province=, city=, country=, unionId=oYGsJwDF2WgPQ9G7tpf_xm5-73do, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=Tue Jan 23 10:00:41 CST 2018, createTime=Fri Jan 19 17:52:53 CST 2018, status=0]', 'Member [userId=10000026, account=null, password=null, name=小陈陈, sex=2, headImg=http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132, level=null, experience=null, coins=320, gems=520, pkCard=520, roomId=null, gameType=null, history=null, weChatId=null, province=null, city=null, country=null, unionId=null, privilege=null, introducer=null, mobile=18012345678, isAgent=1, agentId=3, agentLevel=2, parent_agent_id=2, lastLoginTime=null, createTime=null, status=1]', '更新', NULL, '26'),
	(597, 'id为1的用户在2018-01-25 10:46:24登录了系统。', 1, '潘志鹏', '2018-01-25 10:46:24', '1', '2018-01-25 09:43:10', '2018-01-25 10:46:24', '用户登录', NULL, ''),
	(598, 'id为1的用户在2018-01-25 10:48:17登录了系统。', 1, '潘志鹏', '2018-01-25 10:48:17', '1', '2018-01-25 10:46:24', '2018-01-25 10:48:17', '用户登录', NULL, ''),
	(599, 'id为1的用户在2018-01-25 18:16:29登录了系统。', 1, '潘志鹏', '2018-01-25 18:16:29', '1', '2018-01-25 10:48:17', '2018-01-25 18:16:29', '用户登录', NULL, ''),
	(600, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 18:19:50]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了游戏记录。', 1, '潘志鹏', '2018-01-25 18:19:50', '资源', '', '游戏记录', '添加', NULL, '5'),
	(601, '角色权限变更', 1, '潘志鹏', '2018-01-25 18:20:01', '1', '', '', '角色权限', NULL, ''),
	(602, 'id为1的用户在2018-01-25 18:20:05登录了系统。', 1, '潘志鹏', '2018-01-25 18:20:05', '1', '2018-01-25 18:16:29', '2018-01-25 18:20:05', '用户登录', NULL, ''),
	(603, 'id为1的用户在2018-01-25 21:41:57登录了系统。', 1, '潘志鹏', '2018-01-25 21:41:57', '1', '2018-01-25 18:20:05', '2018-01-25 21:41:57', '用户登录', NULL, ''),
	(604, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 21:43:20]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了游戏查询。', 1, '潘志鹏', '2018-01-25 21:43:20', '资源', '', '游戏查询', '添加', NULL, '5'),
	(605, 'id为1的用户在2018-01-25 22:14:07登录了系统。', 1, '潘志鹏', '2018-01-25 22:14:07', '1', '2018-01-25 21:41:57', '2018-01-25 22:14:07', '用户登录', NULL, ''),
	(606, '角色权限变更', 1, '潘志鹏', '2018-01-25 22:14:48', '1', '', '', '角色权限', NULL, ''),
	(607, '角色权限变更', 1, '潘志鹏', '2018-01-25 22:14:56', '2', '', '', '角色权限', NULL, ''),
	(608, '角色权限变更', 1, '潘志鹏', '2018-01-25 22:15:02', '3', '', '', '角色权限', NULL, ''),
	(609, '角色权限变更', 1, '潘志鹏', '2018-01-25 22:15:08', '4', '', '', '角色权限', NULL, ''),
	(610, '角色权限变更', 1, '潘志鹏', '2018-01-25 22:15:21', '6', '', '', '角色权限', NULL, ''),
	(611, 'id为1的用户在2018-01-25 22:15:26登录了系统。', 1, '潘志鹏', '2018-01-25 22:15:26', '1', '2018-01-25 22:14:07', '2018-01-25 22:15:26', '用户登录', NULL, ''),
	(612, 'id为1的用户在2018-01-25 22:44:30登录了系统。', 1, '潘志鹏', '2018-01-25 22:44:30', '1', '2018-01-25 22:15:26', '2018-01-25 22:44:30', '用户登录', NULL, ''),
	(613, 'id为1的用户在2018-01-25 22:53:18登录了系统。', 1, '潘志鹏', '2018-01-25 22:53:18', '1', '2018-01-25 22:44:30', '2018-01-25 22:53:18', '用户登录', NULL, ''),
	(614, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 23:03:31]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了记录管理。', 1, '潘志鹏', '2018-01-25 23:03:31', '资源', '', '记录管理', '添加', NULL, '5'),
	(615, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 23:05:07]\r\n对[资源-记录管理]\r\n做了[更新]操作:\r\n将旧值Resources [resourcesId=31, parentResourcesId=0, resourcesName=记录管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=null, createUserId=null, remark=glyphicon glyphicon-record, status=1]\r\n更新为Resources [resourcesId=31, parentResourcesId=0, resourcesName=记录管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=Thu Jan 25 23:03:31 CST 2018, createUserId=1, remark=fa fa-fire, status=1]。', 1, '潘志鹏', '2018-01-25 23:05:07', '资源-记录管理', 'Resources [resourcesId=31, parentResourcesId=0, resourcesName=记录管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=null, createUserId=null, remark=glyphicon glyphicon-record, status=1]', 'Resources [resourcesId=31, parentResourcesId=0, resourcesName=记录管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=Thu Jan 25 23:03:31 CST 2018, createUserId=1, remark=fa fa-fire, status=1]', '更新', NULL, '5'),
	(616, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 23:05:54]\r\n对[资源-充值记录]\r\n做了[更新]操作:\r\n将旧值Resources [resourcesId=29, parentResourcesId=31, resourcesName=充值记录, resourcesUrl=/dynamic/console/topUpRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=null, createUserId=null, remark=fa fa-list, status=1]\r\n更新为Resources [resourcesId=29, parentResourcesId=25, resourcesName=充值记录, resourcesUrl=/dynamic/console/topUpRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=Sat Jan 20 17:28:13 CST 2018, createUserId=1, remark=fa fa-list, status=1]。', 1, '潘志鹏', '2018-01-25 23:05:54', '资源-充值记录', 'Resources [resourcesId=29, parentResourcesId=31, resourcesName=充值记录, resourcesUrl=/dynamic/console/topUpRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=null, createUserId=null, remark=fa fa-list, status=1]', 'Resources [resourcesId=29, parentResourcesId=25, resourcesName=充值记录, resourcesUrl=/dynamic/console/topUpRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=Sat Jan 20 17:28:13 CST 2018, createUserId=1, remark=fa fa-list, status=1]', '更新', NULL, '5'),
	(617, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 23:06:09]\r\n对[资源-游戏记录]\r\n做了[更新]操作:\r\n将旧值Resources [resourcesId=30, parentResourcesId=31, resourcesName=游戏记录, resourcesUrl=/dynamic/console/gameRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=null, createUserId=null, remark=fa fa-gamepad, status=1]\r\n更新为Resources [resourcesId=30, parentResourcesId=25, resourcesName=游戏记录, resourcesUrl=/dynamic/console/gameRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=Thu Jan 25 18:19:50 CST 2018, createUserId=1, remark=fa fa-gamepad, status=1]。', 1, '潘志鹏', '2018-01-25 23:06:09', '资源-游戏记录', 'Resources [resourcesId=30, parentResourcesId=31, resourcesName=游戏记录, resourcesUrl=/dynamic/console/gameRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=null, createUserId=null, remark=fa fa-gamepad, status=1]', 'Resources [resourcesId=30, parentResourcesId=25, resourcesName=游戏记录, resourcesUrl=/dynamic/console/gameRecords/index.jsp, resourcesPath=null, resourcesIcon=null, resourcesType=2, createTime=Thu Jan 25 18:19:50 CST 2018, createUserId=1, remark=fa fa-gamepad, status=1]', '更新', NULL, '5'),
	(618, 'id为1的用户在2018-01-25 23:06:35登录了系统。', 1, '潘志鹏', '2018-01-25 23:06:35', '1', '2018-01-25 22:53:18', '2018-01-25 23:06:35', '用户登录', NULL, ''),
	(619, '角色权限变更', 1, '潘志鹏', '2018-01-25 23:06:48', '1', '', '', '角色权限', NULL, ''),
	(620, 'id为1的用户在2018-01-25 23:06:53登录了系统。', 1, '潘志鹏', '2018-01-25 23:06:53', '1', '2018-01-25 23:06:35', '2018-01-25 23:06:53', '用户登录', NULL, ''),
	(621, '角色权限变更', 1, '潘志鹏', '2018-01-25 23:07:07', '2', '', '', '角色权限', NULL, ''),
	(622, '角色权限变更', 1, '潘志鹏', '2018-01-25 23:07:13', '3', '', '', '角色权限', NULL, ''),
	(623, '角色权限变更', 1, '潘志鹏', '2018-01-25 23:07:21', '6', '', '', '角色权限', NULL, ''),
	(624, 'id为2的用户在2018-01-25 23:09:59登录了系统。', 2, '王永科', '2018-01-25 23:09:59', '2', '2018-01-24 17:27:11', '2018-01-25 23:09:59', '用户登录', NULL, ''),
	(625, 'id为2的用户在2018-01-25 23:13:44登录了系统。', 2, '王永科', '2018-01-25 23:13:44', '2', '2018-01-25 23:09:59', '2018-01-25 23:13:44', '用户登录', NULL, ''),
	(626, 'id为1的用户在2018-01-25 23:13:52登录了系统。', 1, '潘志鹏', '2018-01-25 23:13:52', '1', '2018-01-25 23:06:53', '2018-01-25 23:13:52', '用户登录', NULL, ''),
	(627, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-25 23:34:27]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了统计管理。', 1, '潘志鹏', '2018-01-25 23:34:27', '资源', '', '统计管理', '添加', NULL, '5'),
	(628, 'id为1的用户在2018-01-26 09:41:52登录了系统。', 1, '潘志鹏', '2018-01-26 09:41:52', '1', '2018-01-25 23:13:52', '2018-01-26 09:41:52', '用户登录', NULL, ''),
	(629, '角色权限变更', 1, '潘志鹏', '2018-01-26 11:29:21', '1', '', '', '角色权限', NULL, ''),
	(630, '角色权限变更', 1, '潘志鹏', '2018-01-26 11:29:28', '2', '', '', '角色权限', NULL, ''),
	(631, '角色权限变更', 1, '潘志鹏', '2018-01-26 11:29:34', '3', '', '', '角色权限', NULL, ''),
	(632, '角色权限变更', 1, '潘志鹏', '2018-01-26 11:29:39', '6', '', '', '角色权限', NULL, ''),
	(633, 'id为1的用户在2018-01-26 11:29:44登录了系统。', 1, '潘志鹏', '2018-01-26 11:29:44', '1', '2018-01-26 09:41:52', '2018-01-26 11:29:44', '用户登录', NULL, ''),
	(634, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-26 11:31:27]\r\n对[资源-统计管理]\r\n做了[更新]操作:\r\n将旧值Resources [resourcesId=32, parentResourcesId=0, resourcesName=统计管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=null, createUserId=null, remark=fa fa-bar-chart-o, status=1]\r\n更新为Resources [resourcesId=32, parentResourcesId=0, resourcesName=统计管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=Thu Jan 25 23:34:27 CST 2018, createUserId=1, remark=fa-bar-chart, status=1]。', 1, '潘志鹏', '2018-01-26 11:31:27', '资源-统计管理', 'Resources [resourcesId=32, parentResourcesId=0, resourcesName=统计管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=null, createUserId=null, remark=fa fa-bar-chart-o, status=1]', 'Resources [resourcesId=32, parentResourcesId=0, resourcesName=统计管理, resourcesUrl=, resourcesPath=null, resourcesIcon=null, resourcesType=1, createTime=Thu Jan 25 23:34:27 CST 2018, createUserId=1, remark=fa-bar-chart, status=1]', '更新', NULL, '5'),
	(635, 'id为1的用户在2018-01-26 11:31:33登录了系统。', 1, '潘志鹏', '2018-01-26 11:31:33', '1', '2018-01-26 11:29:44', '2018-01-26 11:31:33', '用户登录', NULL, ''),
	(636, 'id为1的用户在2018-01-26 11:34:18登录了系统。', 1, '潘志鹏', '2018-01-26 11:34:18', '1', '2018-01-26 11:31:33', '2018-01-26 11:34:18', '用户登录', NULL, ''),
	(637, 'id为1的用户在2018-01-27 15:38:25登录了系统。', 1, '潘志鹏', '2018-01-27 15:38:25', '1', '2018-01-26 11:34:18', '2018-01-27 15:38:25', '用户登录', NULL, ''),
	(638, 'id为1的用户在2018-01-28 00:08:41登录了系统。', 1, '潘志鹏', '2018-01-28 00:08:41', '1', '2018-01-27 15:38:25', '2018-01-28 00:08:41', '用户登录', NULL, ''),
	(639, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 00:11:11]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了游戏控制。', 1, '潘志鹏', '2018-01-28 00:11:11', '资源', '', '游戏控制', '添加', NULL, '5'),
	(640, 'id为1的用户在2018-01-28 00:57:06登录了系统。', 1, '潘志鹏', '2018-01-28 00:57:06', '1', '2018-01-28 00:08:41', '2018-01-28 00:57:06', '用户登录', NULL, ''),
	(641, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 00:58:12]\r\n对[字典类型-支付状态]\r\n做了[添加]操作:\r\n添加了支付状态。', 1, '潘志鹏', '2018-01-28 00:58:12', '字典类型-支付状态', '', '支付状态', '添加', NULL, '22'),
	(642, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 00:58:23]\r\n对[字典类型-游戏类型]\r\n做了[添加]操作:\r\n添加了游戏类型。', 1, '潘志鹏', '2018-01-28 00:58:23', '字典类型-游戏类型', '', '游戏类型', '添加', NULL, '22'),
	(643, '添加字典', 1, '潘志鹏', '2018-01-28 00:58:56', '未完成', '', '未完成', '字典', NULL, ''),
	(644, '添加字典', 1, '潘志鹏', '2018-01-28 00:59:17', '完成', '', '完成', '字典', NULL, ''),
	(645, '添加字典', 1, '潘志鹏', '2018-01-28 00:59:44', '麻将', '', '麻将', '字典', NULL, ''),
	(646, '添加字典', 1, '潘志鹏', '2018-01-28 01:00:30', '普通推饼', '', '普通推饼', '字典', NULL, ''),
	(647, '添加字典', 1, '潘志鹏', '2018-01-28 01:00:54', '推饼金币场', '', '推饼金币场', '字典', NULL, ''),
	(648, 'id为1的用户在2018-01-28 01:22:54登录了系统。', 1, '潘志鹏', '2018-01-28 01:22:54', '1', '2018-01-28 00:57:06', '2018-01-28 01:22:54', '用户登录', NULL, ''),
	(649, '角色权限变更', 1, '潘志鹏', '2018-01-28 01:23:10', '1', '', '', '角色权限', NULL, ''),
	(650, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:23:57]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了控制添加。', 1, '潘志鹏', '2018-01-28 01:23:57', '资源', '', '控制添加', '添加', NULL, '5'),
	(651, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:24:53]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了控制查询。', 1, '潘志鹏', '2018-01-28 01:24:53', '资源', '', '控制查询', '添加', NULL, '5'),
	(652, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:25:29]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了控制更新。', 1, '潘志鹏', '2018-01-28 01:25:29', '资源', '', '控制更新', '添加', NULL, '5'),
	(653, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:25:59]\r\n对[资源]\r\n做了[添加]操作:\r\n添加了控制删除。', 1, '潘志鹏', '2018-01-28 01:25:59', '资源', '', '控制删除', '添加', NULL, '5'),
	(654, '角色权限变更', 1, '潘志鹏', '2018-01-28 01:26:08', '1', '', '', '角色权限', NULL, ''),
	(655, 'id为1的用户在2018-01-28 01:26:12登录了系统。', 1, '潘志鹏', '2018-01-28 01:26:12', '1', '2018-01-28 01:22:54', '2018-01-28 01:26:12', '用户登录', NULL, ''),
	(656, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:34:01]\r\n对[游戏控制]\r\n做了[添加]操作:\r\n添加了GameControl [id=_empty, gameType=1, robotBankerRate=0.5, playerBankerRate=0.5, areaWarningLine=600000, areaOverlineChangeRate=0.5, takeBankerRate=0.005, takePlayerRate=0.005, sysWinUpperLimit=6000000000000, sysLoseLowerLimit=3000000000, sysStatusSwitchTime=0.5, status=1]。', 1, '潘志鹏', '2018-01-28 01:34:01', '游戏控制', '', 'GameControl [id=_empty, gameType=1, robotBankerRate=0.5, playerBankerRate=0.5, areaWarningLine=600000, areaOverlineChangeRate=0.5, takeBankerRate=0.005, takePlayerRate=0.005, sysWinUpperLimit=6000000000000, sysLoseLowerLimit=3000000000, sysStatusSwitchTime=0.5, status=1]', '添加', NULL, '33'),
	(657, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:35:02]\r\n对[游戏控制]\r\n做了[添加]操作:\r\n添加了GameControl [id=_empty, gameType=0, robotBankerRate=0.1, playerBankerRate=0.1, areaWarningLine=500000, areaOverlineChangeRate=0.8, takeBankerRate=0.01, takePlayerRate=0.01, sysWinUpperLimit=9999999999, sysLoseLowerLimit=666666, sysStatusSwitchTime=0.8, status=1]。', 1, '潘志鹏', '2018-01-28 01:35:02', '游戏控制', '', 'GameControl [id=_empty, gameType=0, robotBankerRate=0.1, playerBankerRate=0.1, areaWarningLine=500000, areaOverlineChangeRate=0.8, takeBankerRate=0.01, takePlayerRate=0.01, sysWinUpperLimit=9999999999, sysLoseLowerLimit=666666, sysStatusSwitchTime=0.8, status=1]', '添加', NULL, '33'),
	(658, 'id为1的用户在2018-01-28 01:38:38登录了系统。', 1, '潘志鹏', '2018-01-28 01:38:38', '1', '2018-01-28 01:26:12', '2018-01-28 01:38:38', '用户登录', NULL, ''),
	(659, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:38:47]\r\n对[游戏控制]\r\n做了[更新]操作:\r\n将旧值\r\n更新为GameControl [id=2, gameType=1, robotBankerRate=0.10, playerBankerRate=0.10, areaWarningLine=500000.00, areaOverlineChangeRate=0.80, takeBankerRate=0.010, takePlayerRate=0.010, sysWinUpperLimit=9999999999, sysLoseLowerLimit=666666, sysStatusSwitchTime=0.80, status=1]。', 1, '潘志鹏', '2018-01-28 01:38:47', '游戏控制', '', 'GameControl [id=2, gameType=1, robotBankerRate=0.10, playerBankerRate=0.10, areaWarningLine=500000.00, areaOverlineChangeRate=0.80, takeBankerRate=0.010, takePlayerRate=0.010, sysWinUpperLimit=9999999999, sysLoseLowerLimit=666666, sysStatusSwitchTime=0.80, status=1]', '更新', NULL, '33'),
	(660, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:38:57]\r\n对[游戏控制]\r\n做了[更新]操作:\r\n将旧值\r\n更新为GameControl [id=1, gameType=1, robotBankerRate=0.50, playerBankerRate=0.50, areaWarningLine=600000.00, areaOverlineChangeRate=0.50, takeBankerRate=0.005, takePlayerRate=0.005, sysWinUpperLimit=6000000000000, sysLoseLowerLimit=3000000000, sysStatusSwitchTime=0.50, status=1]。', 1, '潘志鹏', '2018-01-28 01:38:57', '游戏控制', '', 'GameControl [id=1, gameType=1, robotBankerRate=0.50, playerBankerRate=0.50, areaWarningLine=600000.00, areaOverlineChangeRate=0.50, takeBankerRate=0.005, takePlayerRate=0.005, sysWinUpperLimit=6000000000000, sysLoseLowerLimit=3000000000, sysStatusSwitchTime=0.50, status=1]', '更新', NULL, '33'),
	(661, 'id为1的用户在2018-01-28 01:40:20登录了系统。', 1, '潘志鹏', '2018-01-28 01:40:20', '1', '2018-01-28 01:38:38', '2018-01-28 01:40:20', '用户登录', NULL, ''),
	(662, 'id为1的用户在2018-01-28 01:44:37登录了系统。', 1, '潘志鹏', '2018-01-28 01:44:37', '1', '2018-01-28 01:40:20', '2018-01-28 01:44:37', '用户登录', NULL, ''),
	(663, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:44:42]\r\n对[游戏控制]\r\n做了[删除]操作:\r\n删除了[id：null]。', 1, '潘志鹏', '2018-01-28 01:44:42', '游戏控制', '[id：null]', '', '删除', NULL, '33'),
	(664, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:45:34]\r\n对[游戏控制]\r\n做了[删除]操作:\r\n删除了[id：null]。', 1, '潘志鹏', '2018-01-28 01:45:34', '游戏控制', '[id：null]', '', '删除', NULL, '33'),
	(665, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:46:32]\r\n对[游戏控制]\r\n做了[删除]操作:\r\n删除了[id：null]。', 1, '潘志鹏', '2018-01-28 01:46:32', '游戏控制', '[id：null]', '', '删除', NULL, '33'),
	(666, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:47:07]\r\n对[游戏控制]\r\n做了[删除]操作:\r\n删除了[id：null]。', 1, '潘志鹏', '2018-01-28 01:47:07', '游戏控制', '[id：null]', '', '删除', NULL, '33'),
	(667, 'id为1的用户在2018-01-28 01:51:19登录了系统。', 1, '潘志鹏', '2018-01-28 01:51:19', '1', '2018-01-28 01:44:37', '2018-01-28 01:51:19', '用户登录', NULL, ''),
	(668, 'id为[1]的用户[潘志鹏]\r\n在[2018-01-28 01:51:30]\r\n对[游戏控制]\r\n做了[删除]操作:\r\n删除了[id：2]。', 1, '潘志鹏', '2018-01-28 01:51:30', '游戏控制', '[id：2]', '', '删除', NULL, '33');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- 导出  表 sxwl.province 结构
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `code` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '行政编码',
  `name` varchar(50) NOT NULL COMMENT '行政名称',
  `type` int(50) DEFAULT NULL COMMENT '行政类型',
  `parent_code` int(11) DEFAULT NULL COMMENT '上级行政编码',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- 正在导出表  sxwl.province 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;

-- 导出  表 sxwl.resources 结构
DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `resources_id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源编号',
  `parent_resources_id` int(50) DEFAULT NULL COMMENT '上级资源编号',
  `resources_name` varchar(50) NOT NULL COMMENT '资源名称',
  `resources_url` varchar(200) DEFAULT NULL COMMENT '资源地址',
  `resources_type` char(1) DEFAULT NULL COMMENT '资源类型1--分类。2--页面。3--操作',
  `resources_path` varchar(200) DEFAULT NULL COMMENT '资源路径',
  `resources_icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` int(50) DEFAULT NULL COMMENT '创建人编号',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT NULL COMMENT '启用状态',
  PRIMARY KEY (`resources_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3305 DEFAULT CHARSET=utf8 COMMENT='权限或者说资源';

-- 正在导出表  sxwl.resources 的数据：~59 rows (大约)
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` (`resources_id`, `parent_resources_id`, `resources_name`, `resources_url`, `resources_type`, `resources_path`, `resources_icon`, `create_time`, `create_user_id`, `remark`, `status`) VALUES
	(1, 0, '系统管理', NULL, '1', NULL, '/portal/content/image/led/application.png', '2018-01-02 14:33:48', 1, 'fa fa-cogs', '1'),
	(2, 1, '用户角色权限', NULL, '1', NULL, '/portal/content/image/led/key.png', '2018-01-02 14:34:23', 1, 'fa fa-users', '1'),
	(3, 2, '用户管理', '/dynamic/console/users/index.jsp', '2', '/web/control/user/', '/portal/content/image/led/user.png', '2018-01-02 14:35:10', 1, 'glyphicon glyphicon-user', '1'),
	(4, 2, '角色管理', '/dynamic/console/role/index.jsp', '2', '/web/control/role/', '/portal/content/image/led/user_silhouette.png', '2018-01-02 14:34:52', 1, 'fa fa-key', '1'),
	(5, 1, '资源管理', '/dynamic/console/resources/index.jsp', '2', '/web/console/medicalAgencies/', '/portal/content/image/led/layout_split.png', '2018-01-02 14:42:35', 1, 'fa fa-sitemap', '1'),
	(6, 5, '资源添加', '/portal/resources/insertResources.do', '3', NULL, NULL, '2018-01-02 14:42:35', 1, 'fa fa-fire', '1'),
	(7, 5, '资源变更', '/portal/resources/updateResources.do', '3', NULL, '/portal/content/image/application/Application.gif', '2018-01-02 14:42:35', 1, 'fa fa-fire', '1'),
	(8, 5, '资源查询', '/portal/resources/findResourcesList.do', '3', NULL, '/portal/content/image/application/View.gif', '2018-01-02 14:42:35', 1, 'fa fa-fire', '1'),
	(9, 5, '资源删除', '/portal/resources/deleteResourcesByResourcesId.do', '3', NULL, NULL, '2018-01-02 14:42:35', 1, 'fa fa-fire', '1'),
	(10, 3, '用户添加', '/portal/users/insertUsers.do', '3', NULL, NULL, '2018-01-02 14:36:35', 1, 'fa fa-fire', '1'),
	(11, 3, '用户变更', '/portal/users/updateUsers.do', '3', NULL, '/portal/content/image/application/Application.gif', '2018-01-02 14:36:35', 1, 'fa fa-fire', '1'),
	(12, 3, '用户查询', '/portal/users/findUsersList.do', '3', NULL, '/portal/content/image/application/View.gif', '2018-01-02 14:36:35', 1, 'fa fa-fire', '1'),
	(13, 3, '用户删除', '/portal/users/updateUsersStatusByPrimaryKey.do', '3', NULL, '/portal/content/image/application/Delete.gif', '2018-01-02 14:36:35', 1, 'fa fa-fire', '1'),
	(14, 4, '角色添加', '/portal/role/insertRole.do', '3', NULL, '/portal/content/image/application/Add.gif', '2018-01-02 14:36:57', 1, 'fa fa-fire', '1'),
	(15, 4, '角色变更', '/portal/role/updateRole.do', '3', NULL, '/portal/content/image/application/Application.gif', '2018-01-02 14:36:57', 1, 'fa fa-fire', '1'),
	(16, 4, '角色查询', '/portal/role/findRoleList.do', '3', NULL, '/portal/content/image/application/View.gif', '2018-01-02 14:36:57', 1, 'fa fa-fire', '1'),
	(17, 4, '角色删除', '/portal/role/deleteRoleByRoleId.do', '3', NULL, '/portal/content/image/application/Delete.gif', '2018-01-02 14:36:57', 1, 'fa fa-fire', '1'),
	(18, 4, '分配权限', '/portal/role/insertRoleResources.do', '3', NULL, '/portal/content/image/application/Wrench.gif', '2018-01-02 14:36:57', 1, 'fa fa-fire', '1'),
	(19, 3, '分配角色', '/portal/users/insertUsersRole.do', '3', NULL, '/portal/content/image/application/Wrench.gif', '2018-01-02 14:36:57', 1, 'fa fa-fire', '1'),
	(20, 3, '初始密码', '/portal/users/updateUsersForInitPassword.do', '3', NULL, NULL, '2018-01-02 14:36:57', 1, 'fa fa-fire', '1'),
	(21, 1, '静态字典', '', '1', NULL, NULL, '2018-01-02 14:36:17', 1, 'fa fa-book', '1'),
	(22, 21, '字典类型管理', '/dynamic/console/dictCategory/index.jsp', '2', NULL, NULL, '2018-01-07 21:58:10', 1, 'fa fa-bookmark', '1'),
	(23, 21, '字典管理', '/dynamic/console/dict/index.jsp', '2', NULL, NULL, '2018-01-07 22:02:56', 1, 'fa fa-bookmark-o', '1'),
	(24, 1, '系统日志', '/dynamic/console/logs/index.jsp', '2', NULL, NULL, '2018-01-07 23:28:32', 1, 'fa fa-leaf', '1'),
	(25, 0, '游戏管理', '', '1', NULL, NULL, '2018-01-10 09:33:30', 1, 'fa fa-gamepad', '1'),
	(26, 25, '会员管理', '/dynamic/console/member/index.jsp', '2', NULL, NULL, '2018-01-10 10:08:18', 1, 'fa fa-users', '1'),
	(27, 25, '代理管理', '/dynamic/console/agent/index.jsp', '2', NULL, NULL, '2018-01-14 01:52:09', 1, 'fa fa-th', '1'),
	(28, 25, '代理申请', '/dynamic/console/agent/application/index.jsp', '2', NULL, NULL, '2018-01-18 14:51:39', 1, 'fa fa-envelope', '1'),
	(29, 31, '充值记录', '/dynamic/console/topUpRecords/index.jsp', '2', NULL, NULL, '2018-01-20 17:28:13', 1, 'fa fa-list', '1'),
	(30, 31, '游戏记录', '/dynamic/console/gameRecords/index.jsp', '2', NULL, NULL, '2018-01-25 18:19:50', 1, 'fa fa-gamepad', '1'),
	(31, 0, '记录管理', '', '1', NULL, NULL, '2018-01-25 23:03:31', 1, 'glyphicon glyphicon-record', '1'),
	(32, 0, '统计管理', '', '1', NULL, NULL, '2018-01-25 23:34:27', 1, 'fa fa-bar-chart-o', '1'),
	(33, 25, '游戏控制', '/dynamic/console/gameControl/index.jsp', '2', NULL, NULL, '2018-01-28 00:11:11', 1, 'fa fa-tachometer', '1'),
	(2201, 22, '类型添加', '/portal/dictCategory/insertDictCategory.do', '3', NULL, NULL, '2018-01-07 22:34:09', 1, 'fa fa-fire', '1'),
	(2202, 22, '类型变更', '/portal/dictCategory/updateDictCategory.do', '3', NULL, NULL, '2018-01-07 22:38:44', 1, 'fa fa-fire', '1'),
	(2203, 22, '类型查询', '/portal/dictCategory/findDictCategoryList.do', '3', NULL, NULL, '2018-01-07 22:40:06', 1, 'fa fa-fire', '1'),
	(2204, 22, '类型删除', '/portal/dictCategory/deleteDictCategoryByDictCategoryId.do', '3', NULL, NULL, '2018-01-07 22:41:10', 1, 'fa fa-fire', '1'),
	(2301, 23, '字典添加', '/portal/dict/insertDict.do', '3', NULL, NULL, '2018-01-07 22:45:10', 1, 'fa fa-fire', '1'),
	(2302, 23, '字典查询', '/portal/dict/findDictList.do', '3', NULL, NULL, '2018-01-07 22:46:59', 1, 'fa fa-fire', '1'),
	(2303, 23, '字典更新', '/portal/dict/updateDict.do', '3', NULL, NULL, '2018-01-07 22:48:45', 1, 'fa fa-fire', '1'),
	(2304, 23, '字典删除', '/portal/dict/deleteDictByDictId.do', '3', NULL, NULL, '2018-01-07 22:49:39', 1, 'fa fa-fire', '1'),
	(2401, 24, '日志查询', '/portal/logs/findList.do', '3', NULL, NULL, '2018-01-07 23:30:44', 1, 'fa fa-leaf', '1'),
	(2601, 26, '会员添加', '/portal/member/insertMember.do', '3', NULL, NULL, '2018-01-10 10:13:06', 1, 'fa fa-fire', '1'),
	(2602, 26, '会员删除', '/portal/member/updateMemberStatusByPrimaryKey.do', '3', NULL, NULL, '2018-01-10 10:13:06', 1, 'fa fa-fire', '1'),
	(2603, 26, '会员更新', '/portal/member/updateMember.do', '3', NULL, NULL, '2018-01-10 10:13:06', 1, 'fa fa-fire', '1'),
	(2604, 26, '会员查询', '/portal/member/findMemberList.do', '3', NULL, NULL, '2018-01-10 10:13:06', 1, 'fa fa-fire', '1'),
	(2605, 26, '会员充值', '/portal/member/topUpMember.do', '3', NULL, NULL, '2018-01-20 07:00:39', 1, 'fa fa-fire', '1'),
	(2606, 26, '设置代理', '/portal/member/setUpAgent.do', '3', NULL, NULL, '2018-01-23 09:51:31', 1, 'fa fa-fire', '1'),
	(2607, 26, '绑定会员', '/portal/member/bindMember.do', '3', NULL, NULL, '2018-01-23 16:41:09', 1, 'fa fa-fire', '1'),
	(2608, 26, '升级代理', '/portal/member/upgradeAgent.do', '3', NULL, NULL, '2018-01-23 16:41:09', 1, 'fa fa-fire', '1'),
	(2701, 27, '代理变更', '/portal/agent/updateAgent.do', '3', NULL, NULL, '2018-01-14 01:54:42', 1, 'fa fa-fire', '1'),
	(2702, 27, '代理查询', '/portal/agent/findAgentList.do', '3', NULL, NULL, '2018-01-14 01:55:37', 1, 'fa fa-fire', '1'),
	(2801, 28, '提交申请', '/portal/agent/application/submitApplication.do', '3', NULL, NULL, '2018-01-18 14:54:20', 1, 'fa fa-fire', '1'),
	(2901, 29, '充值查询', '/portal/topUpRecords/findRecordsList.do', '3', NULL, NULL, '2018-01-20 17:29:18', 1, 'fa fa-fire', '1'),
	(3001, 30, '游戏查询', '/portal/gameRecords/findRecordsList.do', '3', NULL, NULL, '2018-01-25 21:43:20', 1, 'fa fa-fire', '1'),
	(3301, 33, '控制添加', '/portal/gameControl/insertControl.do', '3', NULL, NULL, '2018-01-28 01:23:57', 1, 'fa fa-fire', '1'),
	(3302, 33, '控制查询', '/portal/gameControl/findControlList.do', '3', NULL, NULL, '2018-01-28 01:24:54', 1, 'fa fa-fire', '1'),
	(3303, 33, '控制更新', '/portal/gameControl/updateControl.do', '3', NULL, NULL, '2018-01-28 01:25:29', 1, 'fa fa-fire', '1'),
	(3304, 33, '控制删除', '/portal/gameControl/deleteControl.do', '3', NULL, NULL, '2018-01-28 01:26:00', 1, 'fa fa-fire', '1');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;

-- 导出  表 sxwl.role 结构
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建人编号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  sxwl.role 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `role_name`, `create_time`, `create_user_id`, `remark`) VALUES
	(1, '超级管理员', '2017-12-22 15:26:43', 1, '超级管理员'),
	(2, '高级代理', '2017-12-26 10:00:19', 1, '高级代理（查询、充值、统计、申请）'),
	(3, '中级代理', '2018-01-03 17:57:50', 1, '中级代理（查询、充值、统计、申请）'),
	(4, '初级代理', '2018-01-19 14:17:12', 1, '初级代理（查询、充值、申请）'),
	(5, '直属代理', '2018-01-19 14:19:22', 1, '直属代理（查询、充值）'),
	(6, '系统管理员', '2018-01-20 11:18:31', 1, '运营的正常功能（不包括与平台技术相关）');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 导出  表 sxwl.role_resources 结构
DROP TABLE IF EXISTS `role_resources`;
CREATE TABLE IF NOT EXISTS `role_resources` (
  `role_id` int(50) DEFAULT NULL COMMENT '角色编号',
  `resources_id` int(50) DEFAULT NULL COMMENT '资源编号',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色--权限表';

-- 正在导出表  sxwl.role_resources 的数据：~115 rows (大约)
/*!40000 ALTER TABLE `role_resources` DISABLE KEYS */;
INSERT INTO `role_resources` (`role_id`, `resources_id`, `create_time`) VALUES
	(5, 25, '2018-01-24 09:25:53'),
	(5, 26, '2018-01-24 09:25:53'),
	(5, 2604, '2018-01-24 09:25:53'),
	(5, 2605, '2018-01-24 09:25:53'),
	(5, 2607, '2018-01-24 09:25:53'),
	(5, 29, '2018-01-24 09:25:53'),
	(5, 2901, '2018-01-24 09:25:53'),
	(4, 25, '2018-01-25 22:15:08'),
	(4, 26, '2018-01-25 22:15:08'),
	(4, 2604, '2018-01-25 22:15:08'),
	(4, 2605, '2018-01-25 22:15:08'),
	(4, 2607, '2018-01-25 22:15:08'),
	(2, 25, '2018-01-26 11:29:28'),
	(2, 26, '2018-01-26 11:29:28'),
	(2, 2604, '2018-01-26 11:29:28'),
	(2, 2605, '2018-01-26 11:29:28'),
	(2, 2606, '2018-01-26 11:29:28'),
	(2, 2607, '2018-01-26 11:29:28'),
	(2, 2608, '2018-01-26 11:29:28'),
	(2, 31, '2018-01-26 11:29:28'),
	(2, 29, '2018-01-26 11:29:28'),
	(2, 2901, '2018-01-26 11:29:28'),
	(2, 30, '2018-01-26 11:29:28'),
	(2, 3001, '2018-01-26 11:29:28'),
	(2, 32, '2018-01-26 11:29:28'),
	(3, 25, '2018-01-26 11:29:34'),
	(3, 26, '2018-01-26 11:29:34'),
	(3, 2604, '2018-01-26 11:29:34'),
	(3, 2605, '2018-01-26 11:29:34'),
	(3, 2606, '2018-01-26 11:29:34'),
	(3, 2607, '2018-01-26 11:29:34'),
	(3, 31, '2018-01-26 11:29:34'),
	(3, 29, '2018-01-26 11:29:34'),
	(3, 2901, '2018-01-26 11:29:34'),
	(3, 30, '2018-01-26 11:29:34'),
	(3, 3001, '2018-01-26 11:29:34'),
	(3, 32, '2018-01-26 11:29:34'),
	(6, 1, '2018-01-26 11:29:39'),
	(6, 2, '2018-01-26 11:29:39'),
	(6, 3, '2018-01-26 11:29:39'),
	(6, 10, '2018-01-26 11:29:39'),
	(6, 11, '2018-01-26 11:29:39'),
	(6, 12, '2018-01-26 11:29:39'),
	(6, 4, '2018-01-26 11:29:39'),
	(6, 14, '2018-01-26 11:29:39'),
	(6, 15, '2018-01-26 11:29:39'),
	(6, 16, '2018-01-26 11:29:39'),
	(6, 24, '2018-01-26 11:29:39'),
	(6, 2401, '2018-01-26 11:29:39'),
	(6, 25, '2018-01-26 11:29:39'),
	(6, 26, '2018-01-26 11:29:39'),
	(6, 2602, '2018-01-26 11:29:39'),
	(6, 2603, '2018-01-26 11:29:39'),
	(6, 2604, '2018-01-26 11:29:39'),
	(6, 2605, '2018-01-26 11:29:39'),
	(6, 27, '2018-01-26 11:29:39'),
	(6, 2701, '2018-01-26 11:29:39'),
	(6, 2702, '2018-01-26 11:29:39'),
	(6, 31, '2018-01-26 11:29:39'),
	(6, 29, '2018-01-26 11:29:39'),
	(6, 2901, '2018-01-26 11:29:39'),
	(6, 30, '2018-01-26 11:29:39'),
	(6, 3001, '2018-01-26 11:29:39'),
	(6, 32, '2018-01-26 11:29:39'),
	(1, 1, '2018-01-28 01:26:08'),
	(1, 2, '2018-01-28 01:26:08'),
	(1, 3, '2018-01-28 01:26:08'),
	(1, 10, '2018-01-28 01:26:08'),
	(1, 11, '2018-01-28 01:26:08'),
	(1, 12, '2018-01-28 01:26:08'),
	(1, 13, '2018-01-28 01:26:08'),
	(1, 19, '2018-01-28 01:26:08'),
	(1, 4, '2018-01-28 01:26:08'),
	(1, 14, '2018-01-28 01:26:08'),
	(1, 15, '2018-01-28 01:26:08'),
	(1, 16, '2018-01-28 01:26:08'),
	(1, 17, '2018-01-28 01:26:08'),
	(1, 18, '2018-01-28 01:26:08'),
	(1, 5, '2018-01-28 01:26:08'),
	(1, 6, '2018-01-28 01:26:08'),
	(1, 7, '2018-01-28 01:26:08'),
	(1, 8, '2018-01-28 01:26:08'),
	(1, 9, '2018-01-28 01:26:08'),
	(1, 21, '2018-01-28 01:26:08'),
	(1, 22, '2018-01-28 01:26:08'),
	(1, 2201, '2018-01-28 01:26:08'),
	(1, 2202, '2018-01-28 01:26:08'),
	(1, 2203, '2018-01-28 01:26:08'),
	(1, 2204, '2018-01-28 01:26:08'),
	(1, 23, '2018-01-28 01:26:08'),
	(1, 2301, '2018-01-28 01:26:08'),
	(1, 2302, '2018-01-28 01:26:08'),
	(1, 2303, '2018-01-28 01:26:08'),
	(1, 2304, '2018-01-28 01:26:08'),
	(1, 24, '2018-01-28 01:26:08'),
	(1, 2401, '2018-01-28 01:26:08'),
	(1, 25, '2018-01-28 01:26:08'),
	(1, 26, '2018-01-28 01:26:08'),
	(1, 2603, '2018-01-28 01:26:08'),
	(1, 2604, '2018-01-28 01:26:08'),
	(1, 2605, '2018-01-28 01:26:08'),
	(1, 27, '2018-01-28 01:26:08'),
	(1, 2701, '2018-01-28 01:26:08'),
	(1, 2702, '2018-01-28 01:26:08'),
	(1, 33, '2018-01-28 01:26:08'),
	(1, 3301, '2018-01-28 01:26:08'),
	(1, 3302, '2018-01-28 01:26:08'),
	(1, 3303, '2018-01-28 01:26:08'),
	(1, 3304, '2018-01-28 01:26:08'),
	(1, 31, '2018-01-28 01:26:08'),
	(1, 29, '2018-01-28 01:26:08'),
	(1, 2901, '2018-01-28 01:26:08'),
	(1, 30, '2018-01-28 01:26:08'),
	(1, 3001, '2018-01-28 01:26:08'),
	(1, 32, '2018-01-28 01:26:08');
/*!40000 ALTER TABLE `role_resources` ENABLE KEYS */;

-- 导出  表 sxwl.top_up_records 结构
DROP TABLE IF EXISTS `top_up_records`;
CREATE TABLE IF NOT EXISTS `top_up_records` (
  `uuid` varchar(50) NOT NULL COMMENT 'uuid()',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `way` char(1) NOT NULL COMMENT '1-游戏内充值，2-代理后台充值3-管理员后台充值',
  `cost` int(11) DEFAULT NULL COMMENT '花费(当游戏内充值时候对应的是第三方传来的price)',
  `coins` int(11) NOT NULL DEFAULT '0' COMMENT '充值的金币数量',
  `gems` int(11) NOT NULL DEFAULT '0' COMMENT '房卡',
  `pk_card` int(11) NOT NULL DEFAULT '0' COMMENT '比武卡',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '玩家id(当游戏内充值时候对应的是第三方传来的orderuid)',
  `user_name` varchar(50) DEFAULT NULL COMMENT '玩家名称',
  `agent_id` int(11) DEFAULT NULL COMMENT '充值人id对应代理id',
  `agent_name` varchar(50) DEFAULT NULL COMMENT '代理名称',
  `order_id` varchar(50) DEFAULT NULL COMMENT 'UUID生成的订单编号',
  `paysapi_id` varchar(50) DEFAULT NULL COMMENT '一定存在。一个24位字符串，是此订单在PaysApi服务器上的唯一编号',
  `realprice` varchar(50) DEFAULT NULL COMMENT '一定存在。表示用户实际支付的金额。一般会和price值一致，如果同时存在多个用户支付同一金额，就会和price存在一定差额，差额一般在1-2分钱上下，越多人同时付款，差额越大。',
  `pay_status` char(1) DEFAULT '0' COMMENT '支付状态0--未成功 1--成功 2--',
  `create_time` datetime NOT NULL COMMENT '充值时间',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `orderid` (`order_id`),
  UNIQUE KEY `paysapi_id` (`paysapi_id`),
  KEY `user_id` (`user_id`),
  KEY `agent_id` (`agent_id`),
  KEY `user_name` (`user_name`),
  KEY `agent_name` (`agent_name`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='充值记录表';

-- 正在导出表  sxwl.top_up_records 的数据：~62 rows (大约)
/*!40000 ALTER TABLE `top_up_records` DISABLE KEYS */;
INSERT INTO `top_up_records` (`uuid`, `id`, `way`, `cost`, `coins`, `gems`, `pk_card`, `user_id`, `user_name`, `agent_id`, `agent_name`, `order_id`, `paysapi_id`, `realprice`, `pay_status`, `create_time`) VALUES
	('0204b8b6-035a-11e8-95bc-b06ebfd0b572', 119, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11598494299', NULL, NULL, '0', '2018-01-27 20:02:55'),
	('04905f23-034c-11e8-95bc-b06ebfd0b572', 76, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1515391262', NULL, NULL, '0', '2018-01-27 18:22:46'),
	('0e0d2c44-034f-11e8-95bc-b06ebfd0b572', 87, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12071395996', NULL, NULL, '0', '2018-01-27 18:44:30'),
	('1060e149-034d-11e8-95bc-b06ebfd0b572', 81, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12046592547', NULL, NULL, '0', '2018-01-27 18:30:15'),
	('14d07d91-0357-11e8-95bc-b06ebfd0b572', 108, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11700924101', NULL, NULL, '0', '2018-01-27 19:41:58'),
	('178ccd51-0354-11e8-95bc-b06ebfd0b572', 101, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12037586894', NULL, NULL, '0', '2018-01-27 19:20:34'),
	('18193432-0354-11e8-95bc-b06ebfd0b572', 102, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1903137498', NULL, NULL, '0', '2018-01-27 19:20:35'),
	('1bdeda48-034c-11e8-95bc-b06ebfd0b572', 77, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11164662153', NULL, NULL, '0', '2018-01-27 18:23:25'),
	('1c35da8f-0353-11e8-95bc-b06ebfd0b572', 98, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1803449848', NULL, NULL, '0', '2018-01-27 19:13:32'),
	('20193b4c-034c-11e8-95bc-b06ebfd0b572', 78, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12085253288', NULL, NULL, '0', '2018-01-27 18:23:32'),
	('219198ea-0358-11e8-95bc-b06ebfd0b572', 113, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1911693535', NULL, NULL, '0', '2018-01-27 19:49:29'),
	('2e6268b9-034e-11e8-95bc-b06ebfd0b572', 84, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11205860693', NULL, NULL, '0', '2018-01-27 18:38:15'),
	('333a13b0-0352-11e8-95bc-b06ebfd0b572', 93, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1817412947', NULL, NULL, '0', '2018-01-27 19:07:01'),
	('3c4bb749-0359-11e8-95bc-b06ebfd0b572', 114, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11239884212', NULL, NULL, '0', '2018-01-27 19:57:23'),
	('3f911c40-0356-11e8-95bc-b06ebfd0b572', 106, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1696430464', NULL, NULL, '0', '2018-01-27 19:36:00'),
	('4d9b0b15-034c-11e8-95bc-b06ebfd0b572', 79, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11548853664', NULL, NULL, '0', '2018-01-27 18:24:49'),
	('55405bda-034f-11e8-95bc-b06ebfd0b572', 88, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1880042255', NULL, NULL, '0', '2018-01-27 18:46:30'),
	('5563b06f-034f-11e8-95bc-b06ebfd0b572', 89, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1330869021', NULL, NULL, '0', '2018-01-27 18:46:30'),
	('5bfc46cb-0352-11e8-95bc-b06ebfd0b572', 94, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11739478900', NULL, NULL, '0', '2018-01-27 19:08:10'),
	('60a5d5af-0354-11e8-95bc-b06ebfd0b572', 103, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1439195992', NULL, NULL, '0', '2018-01-27 19:22:37'),
	('62f0892c-0357-11e8-95bc-b06ebfd0b572', 109, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1329603556', NULL, NULL, '0', '2018-01-27 19:44:09'),
	('69583283-034d-11e8-95bc-b06ebfd0b572', 82, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1347856612', NULL, NULL, '0', '2018-01-27 18:32:45'),
	('6bac9ac8-034b-11e8-95bc-b06ebfd0b572', 64, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11394989050', NULL, NULL, '0', '2018-01-27 18:18:29'),
	('6e834d76-034b-11e8-95bc-b06ebfd0b572', 65, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1246203731', NULL, NULL, '0', '2018-01-27 18:18:34'),
	('730badae-034e-11e8-95bc-b06ebfd0b572', 85, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11984268881', NULL, NULL, '0', '2018-01-27 18:40:10'),
	('7ce10340-0357-11e8-95bc-b06ebfd0b572', 110, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1900061742', NULL, NULL, '0', '2018-01-27 19:44:52'),
	('841d48fc-0359-11e8-95bc-b06ebfd0b572', 115, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11018436615', NULL, NULL, '0', '2018-01-27 19:59:24'),
	('871a4ea6-035b-11e8-95bc-b06ebfd0b572', 120, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11695241120', NULL, NULL, '0', '2018-01-27 20:13:48'),
	('8d3967a0-0354-11e8-95bc-b06ebfd0b572', 104, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11565165973', NULL, NULL, '0', '2018-01-27 19:23:51'),
	('9a9831e9-0353-11e8-95bc-b06ebfd0b572', 99, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11275100435', NULL, NULL, '0', '2018-01-27 19:17:04'),
	('9d4b7fea-0350-11e8-95bc-b06ebfd0b572', 90, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1235204359', NULL, NULL, '0', '2018-01-27 18:55:40'),
	('a6db632e-0359-11e8-95bc-b06ebfd0b572', 116, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1678062406', NULL, NULL, '0', '2018-01-27 20:00:22'),
	('abe54099-035b-11e8-95bc-b06ebfd0b572', 121, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11442252285', NULL, NULL, '0', '2018-01-27 20:14:49'),
	('ad3bbc73-034b-11e8-95bc-b06ebfd0b572', 66, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1985258210', NULL, NULL, '0', '2018-01-27 18:20:19'),
	('af9ead8e-034e-11e8-95bc-b06ebfd0b572', 86, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12118077729', NULL, NULL, '0', '2018-01-27 18:41:52'),
	('b24a103e-034b-11e8-95bc-b06ebfd0b572', 67, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11690962497', NULL, NULL, '0', '2018-01-27 18:20:28'),
	('b26d2535-0357-11e8-95bc-b06ebfd0b572', 111, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1364053824', NULL, NULL, '0', '2018-01-27 19:46:22'),
	('b2a4c76c-034b-11e8-95bc-b06ebfd0b572', 68, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11800925528', NULL, NULL, '0', '2018-01-27 18:20:29'),
	('b33a50ca-034b-11e8-95bc-b06ebfd0b572', 69, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11770170866', NULL, NULL, '0', '2018-01-27 18:20:30'),
	('b346f767-034b-11e8-95bc-b06ebfd0b572', 70, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11451629133', NULL, NULL, '0', '2018-01-27 18:20:30'),
	('b3691f18-034b-11e8-95bc-b06ebfd0b572', 71, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11801108318', NULL, NULL, '0', '2018-01-27 18:20:30'),
	('b38f9bd6-034b-11e8-95bc-b06ebfd0b572', 72, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1166393381', NULL, NULL, '0', '2018-01-27 18:20:30'),
	('b3b36b38-034b-11e8-95bc-b06ebfd0b572', 73, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12013490965', NULL, NULL, '0', '2018-01-27 18:20:30'),
	('b3c20977-034b-11e8-95bc-b06ebfd0b572', 74, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11943801594', NULL, NULL, '0', '2018-01-27 18:20:30'),
	('b5a5ff55-034c-11e8-95bc-b06ebfd0b572', 80, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1543006478', NULL, NULL, '0', '2018-01-27 18:27:43'),
	('b7e40cba-0352-11e8-95bc-b06ebfd0b572', 95, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12142513635', NULL, NULL, '0', '2018-01-27 19:10:44'),
	('bf3d6db9-0356-11e8-95bc-b06ebfd0b572', 107, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1887457287', NULL, NULL, '0', '2018-01-27 19:39:34'),
	('bf7c318a-0359-11e8-95bc-b06ebfd0b572', 117, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11144764430', NULL, NULL, '0', '2018-01-27 20:01:03'),
	('c14786c2-034b-11e8-95bc-b06ebfd0b572', 75, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1114041329', NULL, NULL, '0', '2018-01-27 18:20:53'),
	('c2e73e91-0354-11e8-95bc-b06ebfd0b572', 105, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11999127856', NULL, NULL, '0', '2018-01-27 19:25:21'),
	('c3e33909-035c-11e8-95bc-b06ebfd0b572', 124, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11836859333', NULL, NULL, '0', '2018-01-27 20:22:39'),
	('c5ea986d-035b-11e8-95bc-b06ebfd0b572', 122, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1176893584', NULL, NULL, '0', '2018-01-27 20:15:33'),
	('cb9d9aa6-034d-11e8-95bc-b06ebfd0b572', 83, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11063360816', NULL, NULL, '0', '2018-01-27 18:35:29'),
	('cf40c80b-0357-11e8-95bc-b06ebfd0b572', 112, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1128531041', NULL, NULL, '0', '2018-01-27 19:47:11'),
	('d6586472-0353-11e8-95bc-b06ebfd0b572', 100, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '12108429997', NULL, NULL, '0', '2018-01-27 19:18:44'),
	('d74059cb-0350-11e8-95bc-b06ebfd0b572', 91, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1591488925', NULL, NULL, '0', '2018-01-27 18:57:17'),
	('dfc1a2e4-035b-11e8-95bc-b06ebfd0b572', 123, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1656757187', NULL, NULL, '0', '2018-01-27 20:16:16'),
	('e164b8e2-0359-11e8-95bc-b06ebfd0b572', 118, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1141379842', NULL, NULL, '0', '2018-01-27 20:02:00'),
	('e87a62f1-0352-11e8-95bc-b06ebfd0b572', 96, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11231011600', NULL, NULL, '0', '2018-01-27 19:12:05'),
	('ef63ebff-0352-11e8-95bc-b06ebfd0b572', 97, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11599169325', NULL, NULL, '0', '2018-01-27 19:12:17'),
	('f1b82c2d-034a-11e8-95bc-b06ebfd0b572', 63, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '1729696073', NULL, NULL, '1', '2018-01-27 18:15:05'),
	('f4cc6dc2-0351-11e8-95bc-b06ebfd0b572', 92, '1', 1, 60000, 0, 0, 10000026, 'null', NULL, NULL, '11284118228', NULL, NULL, '0', '2018-01-27 19:05:17');
/*!40000 ALTER TABLE `top_up_records` ENABLE KEYS */;

-- 导出  表 sxwl.t_accounts 结构
DROP TABLE IF EXISTS `t_accounts`;
CREATE TABLE IF NOT EXISTS `t_accounts` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--账户表';

-- 正在导出表  sxwl.t_accounts 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_accounts` ENABLE KEYS */;

-- 导出  表 sxwl.t_games 结构
DROP TABLE IF EXISTS `t_games`;
CREATE TABLE IF NOT EXISTS `t_games` (
  `room_uuid` char(20) NOT NULL,
  `game_index` smallint(6) NOT NULL,
  `base_info` varchar(1024) NOT NULL,
  `create_time` datetime NOT NULL,
  `snapshots` char(255) DEFAULT NULL,
  `action_records` varchar(2048) DEFAULT NULL,
  `result` char(255) DEFAULT NULL,
  PRIMARY KEY (`room_uuid`,`game_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--游戏表';

-- 正在导出表  sxwl.t_games 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_games` ENABLE KEYS */;

-- 导出  表 sxwl.t_games_archive 结构
DROP TABLE IF EXISTS `t_games_archive`;
CREATE TABLE IF NOT EXISTS `t_games_archive` (
  `room_uuid` char(20) NOT NULL,
  `game_index` smallint(6) NOT NULL,
  `base_info` varchar(1024) NOT NULL,
  `create_time` datetime NOT NULL,
  `snapshots` char(255) DEFAULT NULL,
  `action_records` varchar(2048) DEFAULT NULL,
  `result` char(255) DEFAULT NULL,
  PRIMARY KEY (`room_uuid`,`game_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--游戏归档';

-- 正在导出表  sxwl.t_games_archive 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_games_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_games_archive` ENABLE KEYS */;

-- 导出  表 sxwl.t_games_tb 结构
DROP TABLE IF EXISTS `t_games_tb`;
CREATE TABLE IF NOT EXISTS `t_games_tb` (
  `room` varchar(50) NOT NULL COMMENT '某个房间(时间戳+roomId)',
  `id` int(11) unsigned NOT NULL COMMENT '某个人',
  `game_index` smallint(5) unsigned NOT NULL COMMENT '回合',
  `round` int(11) unsigned NOT NULL COMMENT '局数',
  `is_banker` char(1) NOT NULL COMMENT '0--不是 1--是',
  `base_info` varchar(1024) DEFAULT NULL,
  `chu` varchar(1024) DEFAULT NULL,
  `tian` varchar(1024) DEFAULT NULL,
  `mo` varchar(1024) DEFAULT NULL,
  `snapshots` char(255) DEFAULT NULL,
  `coins` varchar(2048) DEFAULT NULL COMMENT '当前金币',
  `result` int(11) DEFAULT NULL COMMENT '输赢',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`room`,`id`,`game_index`,`round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--游戏表--推饼';

-- 正在导出表  sxwl.t_games_tb 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `t_games_tb` DISABLE KEYS */;
INSERT INTO `t_games_tb` (`room`, `id`, `game_index`, `round`, `is_banker`, `base_info`, `chu`, `tian`, `mo`, `snapshots`, `coins`, `result`, `create_time`) VALUES
	('12345678911111222222', 10000026, 1, 2, '0', '12312', '20000', '30000000', '500000', '1', '5231564', 645451, '2018-01-25 22:37:21'),
	('12345678911111222222', 10000026, 1, 3, '0', '12312', '20000', '30000000', '500000', '1', '5231564', 645451, '2018-01-25 22:37:49'),
	('12345678911111222222', 10000026, 2, 3, '0', '12312', '20000', '30000000', '500000', '1', '5231564', 645451, '2018-01-25 22:37:53'),
	('12345678911111222222', 10000027, 1, 2, '1', '12312', '20000', '30000000', '500000', '1', '5231564', 645451, '2018-01-25 22:37:53');
/*!40000 ALTER TABLE `t_games_tb` ENABLE KEYS */;

-- 导出  表 sxwl.t_games_tb_large 结构
DROP TABLE IF EXISTS `t_games_tb_large`;
CREATE TABLE IF NOT EXISTS `t_games_tb_large` (
  `uuid` char(20) NOT NULL,
  `game_index` smallint(5) NOT NULL,
  `base_info` varchar(1024) NOT NULL,
  `create_time` datetime NOT NULL,
  `chu` varchar(1024) NOT NULL,
  `tian` varchar(1024) NOT NULL,
  `mo` varchar(1024) NOT NULL,
  `snapshots` char(255) DEFAULT NULL,
  `action_records` varchar(2048) DEFAULT NULL,
  `coins` int(11) DEFAULT NULL COMMENT '金币',
  `result` int(11) DEFAULT NULL COMMENT '输赢',
  PRIMARY KEY (`uuid`,`game_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--游戏表--推饼万人';

-- 正在导出表  sxwl.t_games_tb_large 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_games_tb_large` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_games_tb_large` ENABLE KEYS */;

-- 导出  表 sxwl.t_game_control 结构
DROP TABLE IF EXISTS `t_game_control`;
CREATE TABLE IF NOT EXISTS `t_game_control` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_type` varchar(10) NOT NULL COMMENT '0--麻将 1--普通房推饼2---万人房推饼',
  `robot_banker_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '机器人庄 牌率',
  `player_banker_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家庄 牌率',
  `area_warning_line` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '区域下注 警戒线',
  `area_overline_change_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '区域手牌调换率（当某个区域下注超过警戒线时，与庄家换牌的概率）',
  `take_banker_rate` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '庄家金币抽成率',
  `take_player_rate` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '玩家金币抽成率',
  `sys_win_upper_limit` bigint(20) NOT NULL DEFAULT '0' COMMENT '系统赢钱上限',
  `sys_lose_lower_limit` bigint(20) NOT NULL DEFAULT '0' COMMENT '系统输钱下限',
  `sys_status_switch_time` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '系统状态转换时间',
  `status` char(2) NOT NULL COMMENT '启用状态（同一时间只有一个1--启用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='游戏控制表';

-- 正在导出表  sxwl.t_game_control 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_game_control` DISABLE KEYS */;
INSERT INTO `t_game_control` (`id`, `game_type`, `robot_banker_rate`, `player_banker_rate`, `area_warning_line`, `area_overline_change_rate`, `take_banker_rate`, `take_player_rate`, `sys_win_upper_limit`, `sys_lose_lower_limit`, `sys_status_switch_time`, `status`) VALUES
	(1, '1', 0.50, 0.50, 600000.00, 0.50, 0.005, 0.005, 6000000000000, 3000000000, 0.50, '1');
/*!40000 ALTER TABLE `t_game_control` ENABLE KEYS */;

-- 导出  表 sxwl.t_guests 结构
DROP TABLE IF EXISTS `t_guests`;
CREATE TABLE IF NOT EXISTS `t_guests` (
  `guest_account` varchar(255) NOT NULL,
  PRIMARY KEY (`guest_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--游客表';

-- 正在导出表  sxwl.t_guests 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_guests` ENABLE KEYS */;

-- 导出  表 sxwl.t_message 结构
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE IF NOT EXISTS `t_message` (
  `type` varchar(32) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `version` varchar(32) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='GAME--公告横幅表';

-- 正在导出表  sxwl.t_message 的数据：2 rows
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` (`type`, `msg`, `version`) VALUES
	('notice', '幼麟游戏，卓越品质，值得信赖', '20161128'),
	('fkgm', '幼麟游戏，卓越品质，值得信赖', '20161128');
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;

-- 导出  表 sxwl.t_probability 结构
DROP TABLE IF EXISTS `t_probability`;
CREATE TABLE IF NOT EXISTS `t_probability` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `game_type` varchar(10) NOT NULL COMMENT '0--麻将 1--普通房推饼2---万人房推饼',
  `rob_banker_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '机器人庄 牌率',
  `player_banker_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '玩家庄 牌率',
  `area_warning_line` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '区域下注 警戒线',
  `area_overline_change_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '区域手牌调换率（当某个区域下注超过警戒线时，与庄家换牌的概率）',
  `take_banker_rate` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '庄家金币抽成率',
  `take_player_rate` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '玩家金币抽成率',
  `sys_win_upper_limit` int(50) NOT NULL DEFAULT '0' COMMENT '系统赢钱上限',
  `sys_lose_lower_limit` int(50) NOT NULL DEFAULT '0' COMMENT '系统输钱下限',
  `sys_status_switch_time` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '系统状态转换时间',
  `status` char(2) NOT NULL COMMENT '启用状态（同一时间只有一个1--启用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏控制表';

-- 正在导出表  sxwl.t_probability 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_probability` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_probability` ENABLE KEYS */;

-- 导出  表 sxwl.t_rooms 结构
DROP TABLE IF EXISTS `t_rooms`;
CREATE TABLE IF NOT EXISTS `t_rooms` (
  `uuid` char(20) NOT NULL,
  `id` char(8) NOT NULL,
  `base_info` varchar(256) NOT NULL DEFAULT '0',
  `round` varchar(256) NOT NULL DEFAULT '0' COMMENT '第几局',
  `create_time` datetime NOT NULL,
  `num_of_turns` int(11) NOT NULL DEFAULT '0',
  `next_button` int(11) NOT NULL DEFAULT '0',
  `user_id0` int(11) NOT NULL DEFAULT '0',
  `user_icon0` varchar(128) NOT NULL DEFAULT '',
  `user_name0` varchar(32) NOT NULL DEFAULT '',
  `user_score0` int(11) NOT NULL DEFAULT '0',
  `user_id1` int(11) NOT NULL DEFAULT '0',
  `user_icon1` varchar(128) NOT NULL DEFAULT '',
  `user_name1` varchar(32) NOT NULL DEFAULT '',
  `user_score1` int(11) NOT NULL DEFAULT '0',
  `user_id2` int(11) NOT NULL DEFAULT '0',
  `user_icon2` varchar(128) NOT NULL DEFAULT '',
  `user_name2` varchar(32) NOT NULL DEFAULT '',
  `user_score2` int(11) NOT NULL DEFAULT '0',
  `user_id3` int(11) NOT NULL DEFAULT '0',
  `user_icon3` varchar(128) NOT NULL DEFAULT '',
  `user_name3` varchar(32) NOT NULL DEFAULT '',
  `user_score3` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(16) DEFAULT NULL,
  `port` int(11) DEFAULT '0',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--房间表';

-- 正在导出表  sxwl.t_rooms 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_rooms` DISABLE KEYS */;
INSERT INTO `t_rooms` (`uuid`, `id`, `base_info`, `round`, `create_time`, `num_of_turns`, `next_button`, `user_id0`, `user_icon0`, `user_name0`, `user_score0`, `user_id1`, `user_icon1`, `user_name1`, `user_score1`, `user_id2`, `user_icon2`, `user_name2`, `user_score2`, `user_id3`, `user_icon3`, `user_name3`, `user_score3`, `ip`, `port`) VALUES
	('1515069233293267966', '267966', '{"type":"xzdd","baseScore":1,"zimo":0,"jiangdui":false,"hsz":false,"dianganghua":0,"menqing":false,"tiandihu":false,"maxFan":4,"maxGames":4,"creator":21}', '0', '2018-01-12 00:00:00', 0, 0, 21, '', '独孤天一', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, '192.168.1.171', 10000),
	('1515158744165350116', '350116', '{"type":"xzdd","baseScore":1,"zimo":0,"jiangdui":false,"hsz":false,"dianganghua":0,"menqing":false,"tiandihu":false,"maxFan":4,"maxGames":4,"creator":31}', '0', '2018-01-12 00:00:00', 0, 0, 31, '', '端木若白', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, '192.168.1.171', 10000);
/*!40000 ALTER TABLE `t_rooms` ENABLE KEYS */;

-- 导出  表 sxwl.t_rooms_tb 结构
DROP TABLE IF EXISTS `t_rooms_tb`;
CREATE TABLE IF NOT EXISTS `t_rooms_tb` (
  `uuid` char(20) NOT NULL COMMENT 'uuid唯一标识',
  `id` char(8) NOT NULL COMMENT 'id唯一标识',
  `base_info` varchar(256) NOT NULL DEFAULT '0' COMMENT '基础信息',
  `limit_of_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '人数限制0代表无',
  `is_full` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '是否满员0--未满1--满员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `num_of_turns` int(11) NOT NULL DEFAULT '0' COMMENT '暂时没用',
  `create_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人编号对应 t_users的主键',
  `cost_pk_card` int(11) NOT NULL DEFAULT '0' COMMENT '开此房间消耗的比武卡（用于统计）',
  `ip` varchar(16) DEFAULT NULL COMMENT '房间ip',
  `port` int(11) DEFAULT '0' COMMENT '房间端口',
  `user_id0` int(11) NOT NULL DEFAULT '0' COMMENT '玩家id',
  `user_icon0` varchar(128) NOT NULL DEFAULT '' COMMENT '玩家头像',
  `user_name0` varchar(32) NOT NULL DEFAULT '' COMMENT '玩家名称',
  `user_coins0` int(11) NOT NULL DEFAULT '0' COMMENT '玩家金币数',
  `user_id1` int(11) NOT NULL DEFAULT '0',
  `user_icon1` varchar(128) NOT NULL DEFAULT '',
  `user_name1` varchar(32) NOT NULL DEFAULT '',
  `user_coins1` int(11) NOT NULL DEFAULT '0',
  `user_coins9` int(11) NOT NULL DEFAULT '0',
  `user_id2` int(11) NOT NULL DEFAULT '0',
  `user_icon2` varchar(128) NOT NULL DEFAULT '',
  `user_name2` varchar(32) NOT NULL DEFAULT '',
  `user_coins2` int(11) NOT NULL DEFAULT '0',
  `user_id3` int(11) NOT NULL DEFAULT '0',
  `user_icon3` varchar(128) NOT NULL DEFAULT '',
  `user_name3` varchar(32) NOT NULL DEFAULT '',
  `user_coins3` int(11) NOT NULL DEFAULT '0',
  `user_id4` int(11) NOT NULL DEFAULT '0',
  `user_icon4` varchar(128) NOT NULL DEFAULT '',
  `user_name4` varchar(32) NOT NULL DEFAULT '',
  `user_coins4` int(11) NOT NULL DEFAULT '0',
  `user_id5` int(11) NOT NULL DEFAULT '0',
  `user_icon5` varchar(128) NOT NULL DEFAULT '',
  `user_name5` varchar(32) NOT NULL DEFAULT '',
  `user_coins5` int(11) NOT NULL DEFAULT '0',
  `user_id6` int(11) NOT NULL DEFAULT '0',
  `user_icon6` varchar(128) NOT NULL DEFAULT '',
  `user_name6` varchar(32) NOT NULL DEFAULT '',
  `user_coins6` int(11) NOT NULL DEFAULT '0',
  `user_id7` int(11) NOT NULL DEFAULT '0',
  `user_icon7` varchar(128) NOT NULL DEFAULT '',
  `user_name7` varchar(32) NOT NULL DEFAULT '',
  `user_coins7` int(11) NOT NULL DEFAULT '0',
  `user_id8` int(11) NOT NULL DEFAULT '0',
  `user_icon8` varchar(128) NOT NULL DEFAULT '',
  `user_name8` varchar(32) NOT NULL DEFAULT '',
  `user_coins8` int(11) NOT NULL DEFAULT '0',
  `user_id9` int(11) NOT NULL DEFAULT '0',
  `user_icon9` varchar(128) NOT NULL DEFAULT '',
  `user_name9` varchar(32) NOT NULL DEFAULT '',
  `user_id10` int(11) NOT NULL DEFAULT '0',
  `user_icon10` varchar(128) NOT NULL DEFAULT '',
  `user_name10` varchar(32) NOT NULL DEFAULT '',
  `user_coins10` int(11) NOT NULL DEFAULT '0',
  `user_id11` int(11) NOT NULL DEFAULT '0',
  `user_icon11` varchar(128) NOT NULL DEFAULT '',
  `user_name11` varchar(32) NOT NULL DEFAULT '',
  `user_coins11` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--房间表--推饼普通房';

-- 正在导出表  sxwl.t_rooms_tb 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_rooms_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_rooms_tb` ENABLE KEYS */;

-- 导出  表 sxwl.t_rooms_tb_large 结构
DROP TABLE IF EXISTS `t_rooms_tb_large`;
CREATE TABLE IF NOT EXISTS `t_rooms_tb_large` (
  `uuid` char(20) NOT NULL COMMENT 'uuid唯一标识',
  `user_id` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '玩家id',
  `base_info` varchar(256) NOT NULL DEFAULT '0' COMMENT '基础信息',
  `create_time` datetime NOT NULL COMMENT '进入房间时间',
  `ip` varchar(16) DEFAULT NULL COMMENT '玩家ip',
  `port` int(11) DEFAULT '0' COMMENT '玩家端口',
  `user_icon` varchar(128) NOT NULL DEFAULT '' COMMENT '玩家头像',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '玩家名称',
  `user_coins` int(11) NOT NULL DEFAULT '0' COMMENT '玩家金币数',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否退出了0--退出  1--没退出',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GAME--房间表--推饼万人房';

-- 正在导出表  sxwl.t_rooms_tb_large 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_rooms_tb_large` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_rooms_tb_large` ENABLE KEYS */;

-- 导出  表 sxwl.t_system_status 结构
DROP TABLE IF EXISTS `t_system_status`;
CREATE TABLE IF NOT EXISTS `t_system_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_type` varchar(10) NOT NULL DEFAULT '0' COMMENT '游戏类型',
  `income` int(20) NOT NULL DEFAULT '0' COMMENT '系统当前进账',
  `state` varchar(2) NOT NULL COMMENT '系统当前状态（0蓄水，1放水）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏系统状态表';

-- 正在导出表  sxwl.t_system_status 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_system_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_system_status` ENABLE KEYS */;

-- 导出  表 sxwl.t_users 结构
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE IF NOT EXISTS `t_users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(64) DEFAULT '' COMMENT '账号(最好用来对应微信号)',
  `name` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `sex` char(50) DEFAULT NULL COMMENT '性别1--男，2--女，',
  `headimg` varchar(256) DEFAULT NULL COMMENT '头像',
  `lv` varchar(50) DEFAULT '1' COMMENT '用户等级',
  `exp` int(11) DEFAULT '0' COMMENT '用户经验',
  `coins` int(11) DEFAULT '0' COMMENT '用户金币',
  `gems` int(11) DEFAULT '0' COMMENT '用户宝石(房卡)',
  `pk_card` int(11) DEFAULT '0' COMMENT '比武卡',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `roomid` varchar(8) DEFAULT NULL COMMENT '房间id 可用来判断是否在房间游戏',
  `gametype` varchar(50) DEFAULT NULL COMMENT '0--麻将，1--普通推饼，2--万人推饼',
  `history` varchar(4096) DEFAULT '',
  `wechat_id` varchar(500) DEFAULT NULL COMMENT '微信号（其实是openid）',
  `province` varchar(100) DEFAULT NULL COMMENT '用户个人资料填写的省份',
  `language` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL COMMENT '普通用户个人资料填写的城市',
  `country` varchar(100) DEFAULT NULL COMMENT '国家，如中国为CN',
  `union_id` varchar(500) DEFAULT NULL COMMENT '每个微信号对同一个公众号的唯一标识',
  `privilege` varchar(300) DEFAULT NULL COMMENT '用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号(成为代理必须)',
  `is_agent` varchar(1) DEFAULT '0' COMMENT '是否是代理',
  `agent_id` int(50) DEFAULT NULL COMMENT '代理编号，对应后台users表user_id',
  `agent_level` char(5) DEFAULT NULL COMMENT '1--初级，2--中级，3--高级,4--直属代理(暂且保留)',
  `parent_agent_id` int(50) DEFAULT NULL COMMENT '上级代理编号，对应后台users表user_id',
  `introducer` int(50) DEFAULT NULL COMMENT '介绍人编号，对应后台users表user_id',
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(1) DEFAULT '1' COMMENT '启用状态：0--禁用，1--启用',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `u_account` (`account`),
  UNIQUE KEY `u_wechat_id` (`wechat_id`),
  UNIQUE KEY `u_mobile` (`mobile`),
  UNIQUE KEY `u_agent_id` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000032 DEFAULT CHARSET=utf8 COMMENT='GAME--用户表';

-- 正在导出表  sxwl.t_users 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
INSERT INTO `t_users` (`userid`, `account`, `name`, `sex`, `headimg`, `lv`, `exp`, `coins`, `gems`, `pk_card`, `score`, `roomid`, `gametype`, `history`, `wechat_id`, `province`, `language`, `city`, `country`, `union_id`, `privilege`, `mobile`, `is_agent`, `agent_id`, `agent_level`, `parent_agent_id`, `introducer`, `last_login_time`, `create_time`, `status`) VALUES
	(10000026, 'oYGsJwDF2WgPQ9G7tpf_xm5-73do', '小陈陈', '2', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1cCc1yR1RAqJCy0qxOZSwyXBO6EZbVL5OpbsThHFV0UPEXX9FrtPA9P3QzNc9m9p1v8ibwUoaKcQ/132', '0', 0, 320, 520, 520, 0, NULL, NULL, '', 'o3Wn30c-pd7QJsYhXcKk3SAGqJb0', '', 'zh_CN', '', '', 'oYGsJwDF2WgPQ9G7tpf_xm5-73do', NULL, '18012345678', '1', 3, '2', 2, NULL, '2018-01-26 16:19:46', '2018-01-19 17:52:53', '1'),
	(10000027, 'oYGsJwOn_7OJs71Y3zqbqk_HzlxA', ' pao.', '1', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKJGHQtaabEGza9tUict7Y6Dn8icBYBtjicy84Cbed2Gy7MMUfTSYrjmqWaOt9A7JDicKeZMd6iaZFiaIYA/132', '0', 0, 9999, 1009, 99999, 0, NULL, NULL, '', 'o3Wn30Wq4iPVD71wLPFdOqhOa-g0', '河南', 'zh_CN', '郑州', '中国', 'oYGsJwOn_7OJs71Y3zqbqk_HzlxA', NULL, NULL, '0', NULL, NULL, NULL, NULL, '2018-01-20 12:35:27', '2018-01-19 18:12:48', '1'),
	(10000028, 'oYGsJwKA5OgkeXlot1GpM4NOGiKM', '永', '1', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJUGVtQ9T0lpVAlkbNQ1N62576OxsGGR67mDibgBKJ0pYkNnewpJ25D9wu7cpf1ib8fP41JlgyzoMOw/132', '0', 0, 283, 3497, 3482, 0, NULL, NULL, '', 'o3Wn30RouVFI4P0HfXPGK91aqkMk', '河南', 'zh_CN', '郑州', '中国', 'oYGsJwKA5OgkeXlot1GpM4NOGiKM', NULL, '15697824567', '1', 2, '3', NULL, NULL, '2018-01-20 11:58:15', '2018-01-20 11:58:15', '1'),
	(10000029, 'oYGsJwI-DOPicHIO2sMkZtBn0YHU', 'dk', '1', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKmVah0XkicZoKvQ4ibuLQGQk7ZqRic74cl3qKulPbc0aJGuBUKyyoflxRO8iagmC6z0PjEY7gqicb5xxQ/132', '0', 0, 100, 56, 70, 0, NULL, NULL, '', 'o3Wn30WVWMfnMWYAIpgbbF6aWKN8', '河南', 'zh_CN', '郑州', '中国', 'oYGsJwI-DOPicHIO2sMkZtBn0YHU', NULL, '15000001111', '1', 18, '2', 2, NULL, '2018-01-23 09:57:10', '2018-01-23 09:57:10', '1'),
	(10000030, 'oYGsJwDV68nTWoK1q88jGjFDXDBA', '郑向阳', '1', 'http://wx.qlogo.cn/mmopen/vi_32/mzZkwf53jx0NmiapEic4b863ic0ju6cRoNz6qYdHP2YwDibU5bUJlcic40YCJhG1vmqctOA3jsXk2HBuwVvwiboI8yfg/132', '0', 0, 500, 500, 500, 0, NULL, NULL, '', 'o3Wn30Z_OFBf8XZ1xS-gNj4c6iQI', '河南', 'zh_CN', '驻马店', '中国', 'oYGsJwDV68nTWoK1q88jGjFDXDBA', NULL, NULL, '1', 4, '1', 3, NULL, '2018-01-23 09:59:03', '2018-01-23 09:59:03', '1'),
	(10000031, 'oYGsJwAGDp5cQ1QPGoBj5Pk16J1s', '女人无情便是王', '2', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKmZtAPkTbibP99bH5r1SLia2tVSJPia2AlRUjcNGicDXKZnNkyeWAVAh9P0QXkEJY3hgqxcjuibdQCcYg/132', '0', 0, 20, 10, 20, 0, NULL, NULL, '', 'o3Wn30TjIfEC3_VXYakbsNPqVSGg', '河南', 'zh_CN', '洛阳', '中国', 'oYGsJwAGDp5cQ1QPGoBj5Pk16J1s', NULL, '18039231111', '1', 19, '1', 2, NULL, '2018-01-23 10:01:26', '2018-01-23 10:01:26', '1');
/*!40000 ALTER TABLE `t_users` ENABLE KEYS */;

-- 导出  表 sxwl.users 结构
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `account` varchar(50) NOT NULL COMMENT '账号唯一',
  `password` varchar(100) NOT NULL COMMENT '创建时间',
  `sex` char(1) NOT NULL COMMENT '性别',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `department_id` int(50) DEFAULT NULL COMMENT '部门编号',
  `area_code` varchar(50) DEFAULT NULL COMMENT '行政编号',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `status` char(5) NOT NULL COMMENT '启用状态',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `mobile` varchar(50) NOT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `seat` varchar(50) DEFAULT NULL COMMENT '工位',
  `user_level` varchar(2) DEFAULT NULL COMMENT '用户等级',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account_unique` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- 正在导出表  sxwl.users 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `account`, `password`, `sex`, `id_card`, `name`, `department_id`, `area_code`, `birthday`, `status`, `last_login_time`, `mobile`, `email`, `seat`, `user_level`, `create_time`) VALUES
	(1, 'sxwlpzp', '7c6c29686e7849ed0ae0a74989d3e630', '1', '410102198909080032', '潘志鹏', NULL, NULL, '1989-09-08', '1', '2018-01-28 01:51:19', '18039231952', '364325668@qq.com', NULL, NULL, '2017-12-28 15:31:28'),
	(2, 'sxwlwyk', '670b14728ad9902aecba32e22fa4f6bd', '1', '410102199705200013', '王永科', NULL, NULL, '1997-05-20', '1', '2018-01-25 23:13:44', '18039231920', '440055678@qq.com', NULL, NULL, '2018-01-02 14:24:57'),
	(3, 'sxwlcmy', '670b14728ad9902aecba32e22fa4f6bd', '1', '410102199704100012', '陈梦圆', NULL, NULL, '1997-04-10', '1', '2018-01-06 17:33:29', '18039231955', '6781254@qq.com', NULL, NULL, '2018-01-02 14:25:50'),
	(4, 'sxwlzxy', '670b14728ad9902aecba32e22fa4f6bd', '2', '410102198012100012', '郑向阳', NULL, NULL, '1980-12-10', '1', '2018-01-20 15:49:17', '13912349874', '4598597156@qq.com', NULL, NULL, '2018-01-06 14:10:23'),
	(18, '15000001111', '87c0f15977ab48f5bf4266feda6ed065', '1', NULL, 'dk', NULL, NULL, NULL, '1', '2018-01-23 16:30:47', '15000001111', NULL, NULL, NULL, '2018-01-23 16:30:23'),
	(19, '18039231111', 'e2696219b90e23d4fab1b20321f30d26', '2', NULL, '女人无情便是王', NULL, NULL, NULL, '1', '2018-01-24 17:05:46', '18039231111', NULL, NULL, NULL, '2018-01-24 17:05:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 导出  表 sxwl.users_role 结构
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE IF NOT EXISTS `users_role` (
  `user_id` int(50) NOT NULL COMMENT '用户编号',
  `role_id` int(50) NOT NULL COMMENT '角色编号',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户--角色表';

-- 正在导出表  sxwl.users_role 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `users_role` DISABLE KEYS */;
INSERT INTO `users_role` (`user_id`, `role_id`, `create_time`) VALUES
	(3, 3, '2018-01-07 02:28:06'),
	(4, 6, '2018-01-20 15:48:24'),
	(2, 2, '2018-01-20 16:07:30'),
	(1, 1, '2018-01-23 11:52:18'),
	(18, 4, '2018-01-23 16:30:23'),
	(19, 4, '2018-01-24 17:05:46'),
	(10000029, 3, '2018-01-24 17:27:44');
/*!40000 ALTER TABLE `users_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
