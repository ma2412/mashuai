/*
SQLyog Ultimate v8.32 
MySQL - 5.5.27 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `test`;

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `attachmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `attachmentName` varchar(50) DEFAULT NULL COMMENT '名称',
  `attachmentPath` varchar(50) DEFAULT NULL COMMENT '路径',
  `attachmentTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`attachmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `attachment` */

insert  into `attachment`(`attachmentId`,`attachmentName`,`attachmentPath`,`attachmentTime`) values (1,'手动备份20171129142347.xls','logs/backup','2017-11-29 14:23:47'),(2,'手动备份20171129142641.xls','logs/backup','2017-11-29 14:26:41'),(3,'手动备份20171129142920.xls','logs/backup','2017-11-29 14:29:20');

/*Table structure for table `d_dept` */

DROP TABLE IF EXISTS `d_dept`;

CREATE TABLE `d_dept` (
  `d_depid` int(11) NOT NULL AUTO_INCREMENT,
  `d_dname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`d_depid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `d_dept` */

insert  into `d_dept`(`d_depid`,`d_dname`) values (1,'技术部'),(2,'人事部'),(3,'财务部');

/*Table structure for table `e_emp` */

DROP TABLE IF EXISTS `e_emp`;

CREATE TABLE `e_emp` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(25) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(12) DEFAULT NULL,
  `age` int(30) DEFAULT NULL,
  `pic` varchar(40) DEFAULT NULL,
  `d_depid` int(11) DEFAULT NULL,
  `hobby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `e_emp` */

insert  into `e_emp`(`e_id`,`e_name`,`birthday`,`gender`,`age`,`pic`,`d_depid`,`hobby`) values (4,'李思78','2020-08-19','女',13,'22',1,'篮球,足球'),(5,'234','2020-08-05','女',13,'22',2,'足球'),(6,'2344','2020-08-06','女',13,'1596625371530.jpg',1,'篮球');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `emp` */

insert  into `emp`(`id`,`name`,`sex`,`pic`,`createtime`,`tid`) values (1,'一一','女',NULL,'2020-03-03',2),(2,'散散','男',NULL,'2020-04-09',1),(3,'二二','男',NULL,'2020-04-02',3),(4,'张三44','男','4','2020-08-12',2);

/*Table structure for table `express_company` */

DROP TABLE IF EXISTS `express_company`;

CREATE TABLE `express_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `express_company` */

insert  into `express_company`(`id`,`express_name`,`status`,`create_time`) values (1,'中通快递','好','2020-04-02'),(2,'韵达快递','好','2019-04-02');

/*Table structure for table `express_person` */

DROP TABLE IF EXISTS `express_person`;

CREATE TABLE `express_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `express_trait` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_time` date DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `express_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `express_person` */

insert  into `express_person`(`id`,`express_name`,`sex`,`express_trait`,`entry_time`,`create_time`,`express_type_id`) values (2,'李四','男','好','2020-03-04','2020-05-02',1),(3,'123','女','好','2020-08-12','2020-08-13',1);

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志',
  `userName` varchar(30) DEFAULT NULL COMMENT '操作人',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '详细',
  `operation` varchar(300) DEFAULT NULL COMMENT '操作类型（增删改）',
  `ip` varchar(60) DEFAULT NULL COMMENT 'IP地址',
  `module` varchar(40) DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `log` */

insert  into `log`(`logId`,`userName`,`createTime`,`content`,`operation`,`ip`,`module`) values (1,'test','2017-11-29 14:31:04',NULL,'退出',NULL,NULL),(2,'test','2017-11-29 14:31:14',NULL,'登录','192.168.1.17',NULL),(3,'admin','2020-08-05 14:49:03',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(4,'admin','2020-08-05 14:52:00',NULL,'退出',NULL,NULL),(5,'admin','2020-08-05 14:52:14',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(6,'admin','2020-08-05 15:16:20',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(7,'admin','2020-08-05 15:17:36',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(8,'admin','2020-08-05 15:23:41',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(9,'admin','2020-08-05 15:32:43',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(10,'admin','2020-08-05 15:45:48',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(11,'admin','2020-08-05 15:46:55',NULL,'退出',NULL,NULL),(12,'admin','2020-08-05 15:47:56',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(13,'admin','2020-08-05 15:50:35',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(14,'admin','2020-08-05 17:08:59',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(15,'admin','2020-08-05 17:14:14',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(16,'admin','2020-08-05 17:29:34',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(17,'admin','2020-08-05 17:29:49','intercept the method: com.xiaoshu.controller.EmpConteroller.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%李思78%) tmp_count\' at line 4\r\n### The error may exist in file [C:\\Users\\kang\\Desktop\\tomcat\\apache-tomcat-7.0.72\\webapps\\ssm\\WEB-INF\\classes\\mapper\\EmpMapper.xml]\r\n### The error may involve com.xiaoshu.dao.EmpMapper.findPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (SELECT e.*,t.d_dname as dname FROM e_emp e,d_dept t   WHERE e.d_depid=t.d_depid     and e.e_name like %李思78%) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%李思78%) tmp_count\' at line 4\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%李思78%) tmp_count\' at line 4','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(18,'admin','2020-08-05 17:35:14',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(19,'admin','2020-08-05 19:01:55',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(20,'admin','2020-08-05 19:14:42',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(21,'admin','2020-08-05 19:19:03',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(22,'admin','2020-08-05 19:40:24',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(23,'admin','2020-08-05 19:43:46',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(24,'admin','2020-08-06 16:46:20',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(25,'admin','2020-08-06 16:52:07',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(26,'admin','2020-08-06 16:55:29',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(27,'admin','2020-08-06 16:56:06',NULL,'退出',NULL,NULL),(28,'admin','2020-08-06 16:56:14',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(29,'admin','2020-08-06 17:03:17',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(30,'admin','2020-08-06 17:06:55',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(31,'admin','2020-08-06 17:07:58','intercept the method: com.xiaoshu.controller.PersonController.userListnested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.NumberFormatException: For input string: \"李四\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"李四\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(32,'admin','2020-08-06 17:25:58',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(33,'admin','2020-08-06 17:26:27','intercept the method: com.xiaoshu.controller.PersonController.userListnested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'idexpressName\' in \'class com.xiaoshu.entity.PersonVo\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(34,'admin','2020-08-06 17:27:47',NULL,'退出',NULL,NULL),(35,'admin','2020-08-06 17:27:57',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(36,'admin','2020-08-06 17:28:37',NULL,'退出',NULL,NULL),(37,'admin','2020-08-06 17:28:45',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(38,'admin','2020-08-06 17:30:18',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(39,'admin','2020-08-06 22:19:28',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(40,'admin','2020-08-06 22:26:51',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(41,'admin','2020-08-07 16:07:18',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(42,'admin','2020-08-07 16:23:32',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(43,'admin','2020-08-07 16:24:47',NULL,'退出',NULL,NULL),(44,'admin','2020-08-07 16:26:42',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(45,'admin','2020-08-07 18:35:52',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(46,'admin','2020-08-07 18:41:49',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(47,'admin','2020-08-07 18:42:00','intercept the method: com.xiaoshu.controller.EmpController.userListnested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'cid\' in \'class com.xiaoshu.entity.EmpVo\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(48,'admin','2020-08-07 18:44:08',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(49,'admin','2020-08-07 18:45:05',NULL,'退出',NULL,NULL),(50,'admin','2020-08-07 18:45:17',NULL,'登录','0:0:0:0:0:0:0:1',NULL);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menuId` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menuName` varchar(50) DEFAULT NULL COMMENT '名称',
  `menuUrl` varchar(100) DEFAULT NULL COMMENT '方法',
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `menuDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  `state` varchar(20) DEFAULT NULL COMMENT '状态/OPEN/CLOSED',
  `iconCls` varchar(50) DEFAULT NULL COMMENT '图标',
  `seq` int(11) DEFAULT NULL COMMENT '顺序排序',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menuId`,`menuName`,`menuUrl`,`parentId`,`menuDescription`,`state`,`iconCls`,`seq`) values (1,'SSM系统','',-1,'主菜单','isParent','fa fa-university',1),(2,'系统管理','',1,'','isParent','fa fa-desktop',1),(3,'修改密码','javascript:editPassword();//',1,'','close','fa fa-key',4),(4,'安全退出','logout.htm',1,'','close','fa fa-user-times',5),(5,'菜单管理','menu/menuIndex.htm',2,'','','fa fa-sliders',4),(6,'角色管理','role/roleIndex.htm',2,'','','fa fa-users',3),(7,'用户管理','user/userIndex.htm',2,'','','fa fa-user',2),(8,'日志管理','log/logIndex.htm',2,'','','fa fa-tags',4),(9,'学生管理','emp/empIndex.htm',2,'',NULL,'',5),(10,'快递人员管理','person/personIndex.htm',2,'',NULL,'',6),(11,'学生管理','emp/empIndex.htm',2,'',NULL,'',6);

/*Table structure for table `operation` */

DROP TABLE IF EXISTS `operation`;

CREATE TABLE `operation` (
  `operationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '具体的方法',
  `operationName` varchar(100) DEFAULT NULL COMMENT '方法名',
  `menuId` int(11) DEFAULT NULL COMMENT '所属菜单',
  `menuName` varchar(50) NOT NULL,
  `operationCode` varchar(50) DEFAULT NULL,
  `iconCls` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`operationId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=10025 DEFAULT CHARSET=utf8 COMMENT='具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）';

/*Data for the table `operation` */

insert  into `operation`(`operationId`,`operationName`,`menuId`,`menuName`,`operationCode`,`iconCls`) values (10000,'添加',5,'菜单管理','add',''),(10001,'修改',5,'菜单管理','edit',''),(10002,'删除',5,'菜单管理','del',''),(10003,'添加',7,'用户管理','btn_add','glyphicon glyphicon-plus'),(10004,'修改',7,'用户管理','btn_edit','glyphicon glyphicon-pencil'),(10005,'删除',7,'用户管理','btn_delete','glyphicon glyphicon-remove'),(10006,'添加',6,'角色管理','btn_add','glyphicon glyphicon-plus'),(10007,'修改',6,'角色管理','btn_edit','glyphicon glyphicon-pencil'),(10008,'删除',6,'角色管理','btn_delete','glyphicon glyphicon-remove'),(10009,'授权',6,'角色管理','btn_rightCtrl','glyphicon glyphicon-eye-open'),(10010,'下载后台日志（log4j）',8,'日志管理','btn_downloadLog4j','glyphicon glyphicon-download-alt'),(10011,'手动备份（业务操作）',8,'日志管理','btn_manualBackup','glyphicon glyphicon-inbox'),(10012,'删除',8,'日志管理','btn_delete','glyphicon glyphicon-remove'),(10013,'按钮管理',5,'菜单管理','btnCtrl',''),(10014,'备份日志记录',8,'日志管理','btn_downloadLogBus','glyphicon glyphicon-download'),(10015,'添加',9,'学生管理','btn_add',''),(10016,'修改',9,'学生管理','btn_edit',''),(10017,'删除',9,'学生管理','btn_delete',''),(10018,'导出',9,'学生管理','btn_export',''),(10019,'添加',10,'快递人员管理','btn_add',''),(10020,'修改',10,'快递人员管理','btn_edit',''),(10021,'删除',10,'快递人员管理','btn_delete',''),(10022,'添加',11,'学生管理','btn_add',''),(10023,'删除',11,'学生管理','btn_delete',''),(10024,'修改',11,'学生管理','btn_edit','');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `menuIds` varchar(200) DEFAULT NULL COMMENT '菜单IDs',
  `operationIds` varchar(200) DEFAULT NULL COMMENT '按钮IDS',
  `roleDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`,`menuIds`,`operationIds`,`roleDescription`) values (1,'超级管理员','1,2,3,4,5,6,7,8,11','10000,10001,10002,10013,10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014,10015,10016,10017,10018,10019,10020,10021,10022,10023,10024','拥有全部权限的超级管理员角色'),(2,'测试员','1,2,3,4,6,7,8','10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014','拥有系统所有业务功能的角色');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `tokenId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `userAgent` varchar(50) DEFAULT NULL COMMENT '用户（md5）',
  `token` varchar(100) DEFAULT NULL COMMENT 'md5(username+md5(useragent))',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `expireTime` datetime DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`tokenId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户登录信息（用于自动登录）';

/*Data for the table `token` */

insert  into `token`(`tokenId`,`userId`,`userAgent`,`token`,`createTime`,`expireTime`) values (1,1,'0b239ed7c13c034f6b834897f0b54bba','66895df164cf660402ab453a53496cd6','2017-11-29 14:26:21','2017-12-13 14:26:21');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `type` */

insert  into `type`(`cid`,`cname`) values (1,'张三'),(2,'李四'),(3,'王五');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `userType` tinyint(4) DEFAULT NULL COMMENT '用户类型',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `userDescription` varchar(200) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`password`,`userType`,`roleId`,`userDescription`) values (1,'admin','admin',NULL,1,'超级管理员，供开发方使用'),(2,'test','test',NULL,2,'测试员，供测试方使用');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
