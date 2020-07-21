/*
SQLyog Ultimate v8.32 
MySQL - 5.5.35 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

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

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `depid` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`depid`),
  KEY `dept_Index` (`depid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dept` */

insert  into `dept`(`depid`,`dname`) values (1,'物联网'),(2,'大数据'),(6,'财务部'),(8,'测试部'),(9,'技术部');

/*Table structure for table `e_express` */

DROP TABLE IF EXISTS `e_express`;

CREATE TABLE `e_express` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `kname` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `kdate` date DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `e_express` */

insert  into `e_express`(`kid`,`kname`,`area`,`kdate`,`price`) values (1,'圆通快递','宁夏颍川','2020-02-03','500万'),(3,'啦啦啦','12332132','2020-02-03','500万');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `eid` int(10) NOT NULL AUTO_INCREMENT,
  `ename` varchar(25) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `depid` int(10) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `depid` (`depid`),
  CONSTRAINT `depid` FOREIGN KEY (`depid`) REFERENCES `dept` (`depid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `emp` */

insert  into `emp`(`eid`,`ename`,`age`,`birthday`,`gender`,`pic`,`depid`) values (1,'张三',11,'2020-05-07','男','开心一笑.jpg',1),(3,'王五',12,'2020-05-07','女','开心一笑.jpg',2),(10,'田七',28,'2018-08-10','男','开心一笑.jpg',6),(18,'赵云',18,'2020-06-09','女','开心一笑.jpg',8),(19,'李四',20,'2020-06-11','男','开心一笑.jpg',6),(20,'张三123',18,'2018-08-10','男','开心一笑.jpg',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `log` */

insert  into `log`(`logId`,`userName`,`createTime`,`content`,`operation`,`ip`,`module`) values (1,'test','2017-11-29 14:31:04',NULL,'退出',NULL,NULL),(2,'test','2017-11-29 14:31:14',NULL,'登录','192.168.1.17',NULL),(3,'admin','2020-07-12 15:14:58',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(4,'admin','2020-07-12 16:12:45',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(5,'admin','2020-07-12 17:11:37',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(6,'admin','2020-07-13 10:31:15',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(7,'admin','2020-07-13 10:56:29',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(8,'admin','2020-07-13 11:04:22','intercept the method: com.xiaoshu.controller.EmpController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'u.ename\' in \'order clause\'\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\UserMapper.xml]\r\n### The error may involve com.xiaoshu.dao.UserMapper.selectUserAndRoleByExample-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select              u.userId, u.userName, u.password, u.userType, u.roleId, u.userDescription, r.rolename       from user u,role r                          WHERE 1 = 1                      and u.roleid = r.roleid             order by u.ename desc LIMIT 10\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'u.ename\' in \'order clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'u.ename\' in \'order clause\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(9,'admin','2020-07-13 11:04:27','intercept the method: com.xiaoshu.controller.EmpController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'u.birthday\' in \'order clause\'\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\UserMapper.xml]\r\n### The error may involve com.xiaoshu.dao.UserMapper.selectUserAndRoleByExample-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select              u.userId, u.userName, u.password, u.userType, u.roleId, u.userDescription, r.rolename       from user u,role r                          WHERE 1 = 1                      and u.roleid = r.roleid             order by u.birthday desc LIMIT 10\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'u.birthday\' in \'order clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'u.birthday\' in \'order clause\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(10,'admin','2020-07-13 19:31:57',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(11,'admin','2020-07-15 11:11:17',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(12,'admin','2020-07-15 11:15:01',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(13,'admin','2020-07-16 16:02:20',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(14,'admin','2020-07-17 10:33:54',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(15,'admin','2020-07-17 10:51:47',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(16,'admin','2020-07-17 11:03:17',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(17,'admin','2020-07-17 11:18:45',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(18,'admin','2020-07-17 11:18:45',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(19,'admin','2020-07-17 11:34:01',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(20,'admin','2020-07-17 11:37:22',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(21,'admin','2020-07-17 11:38:47',NULL,'退出',NULL,NULL),(22,'admin','2020-07-17 11:39:04',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(23,'admin','2020-07-17 11:43:19',NULL,'退出',NULL,NULL),(24,'admin','2020-07-17 11:43:31',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(25,'admin','2020-07-17 11:45:04',NULL,'退出',NULL,NULL),(26,'admin','2020-07-17 11:45:22',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(27,'admin','2020-07-17 16:24:36',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(28,'admin','2020-07-17 16:24:36',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(29,'admin','2020-07-17 17:08:26',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(30,'admin','2020-07-17 17:21:02','intercept the method: com.xiaoshu.controller.PersonController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.p_preson\' doesn\'t exist\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\PersonMapper.xml]\r\n### The error may involve com.xiaoshu.dao.PersonMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM p_preson, p_company c WHERE p.company_id = c.company_id\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.p_preson\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.p_preson\' doesn\'t exist','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(31,'admin','2020-07-17 17:27:40',NULL,'退出',NULL,NULL),(32,'admin','2020-07-17 17:27:51',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(33,'admin','2020-07-17 17:34:32',NULL,'退出',NULL,NULL),(34,'admin','2020-07-17 17:34:53',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(35,'admin','2020-07-19 19:06:08',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(36,'admin','2020-07-19 19:07:18',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(37,'admin','2020-07-19 19:59:37',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(38,'admin','2020-07-19 20:03:44','intercept the method: com.xiaoshu.controller.ExpressController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ExpressMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ExpressMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM express\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(39,'admin','2020-07-19 20:13:36',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(40,'admin','2020-07-19 20:13:45','intercept the method: com.xiaoshu.controller.ExpressController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ExpressMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ExpressMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM express\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(41,'admin','2020-07-19 20:26:55',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(42,'admin','2020-07-19 20:26:58','intercept the method: com.xiaoshu.controller.ExpressController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ExpressMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ExpressMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM express\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(43,'admin','2020-07-19 20:27:44','intercept the method: com.xiaoshu.controller.ExpressController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ExpressMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ExpressMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM express\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.express\' doesn\'t exist','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(44,'admin','2020-07-19 20:34:05',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(45,'admin','2020-07-19 20:38:47',NULL,'退出',NULL,NULL),(46,'admin','2020-07-19 20:39:00',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(47,'admin','2020-07-20 09:55:43',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(48,'admin','2020-07-20 10:00:47',NULL,'退出',NULL,NULL),(49,'admin','2020-07-20 10:01:04',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(50,'admin','2020-07-20 10:20:19','intercept the method: com.xiaoshu.controller.ExpressController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%圆%) tmp_count\' at line 2\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ExpressMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ExpressMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select * from e_express     WHERE  e_express.kname like %圆%) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%圆%) tmp_count\' at line 2\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%圆%) tmp_count\' at line 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(51,'admin','2020-07-20 10:20:23','intercept the method: com.xiaoshu.controller.ExpressController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%1%) tmp_count\' at line 2\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ExpressMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ExpressMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select * from e_express     WHERE  e_express.kname like %1%) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%1%) tmp_count\' at line 2\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%1%) tmp_count\' at line 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(52,'admin','2020-07-20 10:24:50','intercept the method: com.xiaoshu.controller.ExpressController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%圆%) tmp_count\' at line 2\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ExpressMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ExpressMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select * from e_express     WHERE  e_express.kname like %圆%) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%圆%) tmp_count\' at line 2\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'%圆%) tmp_count\' at line 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(53,'admin','2020-07-20 10:30:30',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(54,'admin','2020-07-20 14:04:19',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(55,'admin','2020-07-20 14:15:47',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(56,'admin','2020-07-20 14:15:49','intercept the method: com.xiaoshu.controller.StudentController.userListnested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'dname\' in \'class com.xiaoshu.entity.StudentExample\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(57,'admin','2020-07-20 14:20:40','intercept the method: com.xiaoshu.controller.StudentController.userListnested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'dname\' in \'class com.xiaoshu.entity.StudentExample\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(58,'admin','2020-07-20 14:21:50','intercept the method: com.xiaoshu.controller.StudentController.userListnested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'dname\' in \'class com.xiaoshu.entity.StudentExample\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(59,'admin','2020-07-20 14:27:32',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(60,'admin','2020-07-20 15:11:59','intercept the method: com.xiaoshu.controller.StudentController.indexnested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(61,'admin','2020-07-20 15:12:52','intercept the method: com.xiaoshu.controller.StudentController.userListnested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(62,'admin','2020-07-20 15:14:14','intercept the method: com.xiaoshu.controller.StudentController.userListnested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(63,'admin','2020-07-20 15:14:48',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(64,'admin','2020-07-20 15:44:03','intercept the method: com.xiaoshu.controller.StudentController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM student, school WHERE student.cid = school.cid AND cid = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\n; SQL []; Column \'cid\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(65,'admin','2020-07-20 15:44:06','intercept the method: com.xiaoshu.controller.StudentController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM student, school WHERE student.cid = school.cid AND cid = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\n; SQL []; Column \'cid\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(66,'admin','2020-07-20 15:44:17','intercept the method: com.xiaoshu.controller.StudentController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM student, school WHERE student.cid = school.cid AND cid = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\n; SQL []; Column \'cid\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(67,'admin','2020-07-20 15:45:02','intercept the method: com.xiaoshu.controller.StudentController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM student, school WHERE student.cid = school.cid AND cid = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous\n; SQL []; Column \'cid\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'cid\' in where clause is ambiguous','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(68,'admin','2020-07-20 15:48:52','intercept the method: com.xiaoshu.controller.StudentController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,c.cname as cname from student s,school c     WHERE s.cid = c.cid a) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(69,'admin','2020-07-20 15:48:57',NULL,'退出',NULL,NULL),(70,'admin','2020-07-20 15:49:10',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(71,'admin','2020-07-20 15:49:13','intercept the method: com.xiaoshu.controller.StudentController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,c.cname as cname from student s,school c     WHERE s.cid = c.cid a) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(72,'admin','2020-07-20 15:49:15','intercept the method: com.xiaoshu.controller.StudentController.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2\r\n### The error may exist in file [F:\\工作空间\\one03\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,c.cname as cname from student s,school c     WHERE s.cid = c.cid a) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a) tmp_count\' at line 2','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(73,'admin','2020-07-20 15:51:27',NULL,'退出',NULL,NULL),(74,'admin','2020-07-20 15:51:49',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(75,'admin','2020-07-20 16:03:22',NULL,'退出',NULL,NULL),(76,'admin','2020-07-20 16:03:45',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(77,'admin','2020-07-20 16:07:54',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(78,'admin','2020-07-20 16:18:34',NULL,'登录','0:0:0:0:0:0:0:1',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menuId`,`menuName`,`menuUrl`,`parentId`,`menuDescription`,`state`,`iconCls`,`seq`) values (1,'SSM系统','',-1,'主菜单','isParent','fa fa-university',1),(2,'系统管理','',1,'','isParent','fa fa-desktop',1),(3,'修改密码','javascript:editPassword();//',1,'','close','fa fa-key',4),(4,'安全退出','logout.htm',1,'','close','fa fa-user-times',5),(5,'菜单管理','menu/menuIndex.htm',2,'','','fa fa-sliders',4),(6,'角色管理','role/roleIndex.htm',2,'','','fa fa-users',3),(7,'用户管理','user/userIndex.htm',2,'','','fa fa-user',2),(8,'日志管理','log/logIndex.htm',2,'','','fa fa-tags',4),(10,'员工管理','person/personIndex.htm',2,'我去年买了个表',NULL,'fa fa-users',5),(11,'快递管理','express/expressIndex.htm',2,'买表',NULL,'fa fa-users',6),(12,'学生管理','student/studentIndex.htm',2,'呜呜呜',NULL,'fa fa-users',7);

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
) ENGINE=InnoDB AUTO_INCREMENT=10024 DEFAULT CHARSET=utf8 COMMENT='具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）';

/*Data for the table `operation` */

insert  into `operation`(`operationId`,`operationName`,`menuId`,`menuName`,`operationCode`,`iconCls`) values (10000,'添加',5,'菜单管理','add',''),(10001,'修改',5,'菜单管理','edit',''),(10002,'删除',5,'菜单管理','del',''),(10003,'添加',7,'用户管理','btn_add','glyphicon glyphicon-plus'),(10004,'修改',7,'用户管理','btn_edit','glyphicon glyphicon-pencil'),(10005,'删除',7,'用户管理','btn_delete','glyphicon glyphicon-remove'),(10006,'添加',6,'角色管理','btn_add','glyphicon glyphicon-plus'),(10007,'修改',6,'角色管理','btn_edit','glyphicon glyphicon-pencil'),(10008,'删除',6,'角色管理','btn_delete','glyphicon glyphicon-remove'),(10009,'授权',6,'角色管理','btn_rightCtrl','glyphicon glyphicon-eye-open'),(10010,'下载后台日志（log4j）',8,'日志管理','btn_downloadLog4j','glyphicon glyphicon-download-alt'),(10011,'手动备份（业务操作）',8,'日志管理','btn_manualBackup','glyphicon glyphicon-inbox'),(10012,'删除',8,'日志管理','btn_delete','glyphicon glyphicon-remove'),(10013,'按钮管理',5,'菜单管理','btnCtrl',''),(10014,'备份日志记录',8,'日志管理','btn_downloadLogBus','glyphicon glyphicon-download'),(10015,'添加',10,'员工管理','1','glyphicon glyphicon-plus'),(10016,'修改',10,'员工管理','2','glyphicon glyphicon-pencil'),(10017,'删除',10,'员工管理','3','glyphicon glyphicon-remove'),(10018,'新增',11,'快递管理','btn_add','glyphicon glyphicon-plus'),(10019,'修改',11,'快递管理','btn_edit','glyphicon glyphicon-pencil'),(10020,'删除',11,'快递管理','btn_delete','glyphicon glyphicon-remove'),(10021,'添加',12,'学生管理','btn_add','glyphicon glyphicon-plus'),(10022,'修改',12,'学生管理','btn_edit','glyphicon glyphicon-pencil'),(10023,'删除',12,'学生管理','btn_delete','glyphicon glyphicon-remove');

/*Table structure for table `p_company` */

DROP TABLE IF EXISTS `p_company`;

CREATE TABLE `p_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `p_company` */

insert  into `p_company`(`company_id`,`company_name`) values (1,'son'),(2,'person'),(3,'微软');

/*Table structure for table `p_person` */

DROP TABLE IF EXISTS `p_person`;

CREATE TABLE `p_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `p_person` */

insert  into `p_person`(`id`,`p_name`,`gender`,`company_id`,`date`) values (1,'张三','男',2,'2001-03-11'),(2,'lisi','男',1,'2001-03-11');

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

insert  into `role`(`roleId`,`roleName`,`menuIds`,`operationIds`,`roleDescription`) values (1,'超级管理员','1,2,3,4,5,6,7,8,10,11,12','10000,10001,10002,10013,10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014,10015,10016,10017,10018,10019,10020,10021,10022,10023','拥有全部权限的超级管理员角色'),(2,'测试员','1,2,3,4,5,6,7,8,10,11','10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014,10015,10016,10017','拥有系统所有业务功能的角色');

/*Table structure for table `school` */

DROP TABLE IF EXISTS `school`;

CREATE TABLE `school` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `school` */

insert  into `school`(`cid`,`cname`) values (1,'北京大学'),(2,'清华大学');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) DEFAULT NULL,
  `ddate` date DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`did`,`dname`,`ddate`,`age`,`sex`,`cid`) values (1,'张三','2001-05-05','19','男',2),(3,'李四','2020-07-16',NULL,'女',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`password`,`userType`,`roleId`,`userDescription`) values (1,'admin','admin',NULL,1,'超级管理员，供开发方使用'),(3,'javajdbc','123456',NULL,2,'啥也不是');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
