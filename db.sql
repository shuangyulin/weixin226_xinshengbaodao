/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - xinshengbaodao
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xinshengbaodao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xinshengbaodao`;

/*Table structure for table `caiwuxinxi` */

DROP TABLE IF EXISTS `caiwuxinxi`;

CREATE TABLE `caiwuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `caiwuxinxi_name` varchar(200) DEFAULT NULL COMMENT '标题 Search111',
  `caiwuxinxi_types` int(11) DEFAULT NULL COMMENT '财务类型 Search111',
  `caiwuxinxi_money` decimal(10,2) DEFAULT NULL COMMENT '相关金额',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='财务信息';

/*Data for the table `caiwuxinxi` */

insert  into `caiwuxinxi`(`id`,`caiwuxinxi_name`,`caiwuxinxi_types`,`caiwuxinxi_money`,`yonghu_id`,`create_time`) values (1,'标题1',3,'384.36',2,'2022-03-21 13:18:28'),(2,'标题2',1,'340.27',1,'2022-03-21 13:18:28'),(3,'标题3',2,'769.10',1,'2022-03-21 13:18:28'),(4,'标题4',3,'496.28',1,'2022-03-21 13:18:28'),(5,'标题5',2,'406.96',2,'2022-03-21 13:18:28');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/xinshengbaodao/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/xinshengbaodao/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/xinshengbaodao/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'caiwuxinxi_types','财务类型',1,'财务类型1',NULL,NULL,'2022-03-21 13:18:23'),(2,'caiwuxinxi_types','财务类型',2,'财务类型2',NULL,NULL,'2022-03-21 13:18:23'),(3,'caiwuxinxi_types','财务类型',3,'财务类型3',NULL,NULL,'2022-03-21 13:18:23'),(4,'yidaobaogao_yesno_types','处理状态',1,'处理中',NULL,NULL,'2022-03-21 13:18:23'),(5,'yidaobaogao_yesno_types','处理状态',2,'通过',NULL,NULL,'2022-03-21 13:18:23'),(6,'yidaobaogao_yesno_types','处理状态',3,'拒绝',NULL,NULL,'2022-03-21 13:18:23'),(7,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2022-03-21 13:18:23'),(8,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2022-03-21 13:18:23'),(9,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2022-03-21 13:18:23'),(10,'sex_types','性别',1,'男',NULL,NULL,'2022-03-21 13:18:23'),(11,'sex_types','性别',2,'女',NULL,NULL,'2022-03-21 13:18:23'),(12,'yonghu_types','报到状态',1,'未报到',NULL,NULL,'2022-03-21 13:18:23'),(13,'yonghu_types','报到状态',2,'已报到',NULL,NULL,'2022-03-21 13:18:23'),(14,'zhuanye_types','专业',1,'专业1',NULL,NULL,'2022-03-21 13:18:23'),(15,'zhuanye_types','专业',2,'专业2',NULL,NULL,'2022-03-21 13:18:23'),(16,'zhuanye_types','专业',3,'专业3',NULL,NULL,'2022-03-21 13:18:23'),(17,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-03-21 13:18:24'),(18,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-03-21 13:18:24');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '学生',
  `jiaowuchu_id` int(11) DEFAULT NULL COMMENT '教务处',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`jiaowuchu_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',2,NULL,NULL,'发布内容1',NULL,1,'2022-03-21 13:18:28','2022-03-21 13:18:28','2022-03-21 13:18:28'),(2,'帖子标题2',1,NULL,NULL,'发布内容2',NULL,1,'2022-03-21 13:18:28','2022-03-21 13:18:28','2022-03-21 13:18:28'),(3,'帖子标题3',2,NULL,NULL,'发布内容3',NULL,1,'2022-03-21 13:18:28','2022-03-21 13:18:28','2022-03-21 13:18:28'),(4,'帖子标题4',1,NULL,NULL,'发布内容4',NULL,1,'2022-03-21 13:18:28','2022-03-21 13:18:28','2022-03-21 13:18:28'),(5,'帖子标题5',3,NULL,NULL,'发布内容5',NULL,1,'2022-03-21 13:18:28','2022-03-21 13:18:28','2022-03-21 13:18:28'),(6,NULL,NULL,NULL,1,'管理评论',5,2,'2022-03-21 14:43:56',NULL,'2022-03-21 14:43:56'),(8,NULL,NULL,1,NULL,'回复123123',5,2,'2022-03-21 15:39:24',NULL,'2022-03-21 15:39:24'),(9,NULL,1,NULL,NULL,'学生回复',5,2,'2022-03-21 15:44:31',NULL,'2022-03-21 15:44:31');

/*Table structure for table `jiaowuchu` */

DROP TABLE IF EXISTS `jiaowuchu`;

CREATE TABLE `jiaowuchu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `jiaowuchu_name` varchar(200) DEFAULT NULL COMMENT '教务负责人名称 Search111 ',
  `jiaowuchu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `jiaowuchu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `jiaowuchu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `jiaowuchu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='教务处';

/*Data for the table `jiaowuchu` */

insert  into `jiaowuchu`(`id`,`username`,`password`,`jiaowuchu_name`,`jiaowuchu_photo`,`sex_types`,`jiaowuchu_phone`,`jiaowuchu_email`,`jiaowuchu_delete`,`create_time`) values (1,'a1','123456','教务负责人名称1','http://localhost:8080/xinshengbaodao/upload/jiaowuchu1.jpg',2,'17703786901','1@qq.com',1,'2022-03-21 13:18:28'),(2,'a2','123456','教务负责人名称2','http://localhost:8080/xinshengbaodao/upload/jiaowuchu2.jpg',2,'17703786902','2@qq.com',1,'2022-03-21 13:18:28'),(3,'a3','123456','教务负责人名称3','http://localhost:8080/xinshengbaodao/upload/jiaowuchu3.jpg',1,'17703786903','3@qq.com',1,'2022-03-21 13:18:28');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',1,'http://localhost:8080/xinshengbaodao/upload/news1.jpg','2022-03-21 13:18:28','公告详情1','2022-03-21 13:18:28'),(2,'公告标题2',1,'http://localhost:8080/xinshengbaodao/upload/news2.jpg','2022-03-21 13:18:28','公告详情2','2022-03-21 13:18:28'),(3,'公告标题3',1,'http://localhost:8080/xinshengbaodao/upload/news3.jpg','2022-03-21 13:18:28','公告详情3','2022-03-21 13:18:28'),(4,'公告标题4',3,'http://localhost:8080/xinshengbaodao/upload/news4.jpg','2022-03-21 13:18:28','公告详情4','2022-03-21 13:18:28'),(5,'公告标题5',3,'http://localhost:8080/xinshengbaodao/upload/news5.jpg','2022-03-21 13:18:28','公告详情5','2022-03-21 13:18:28');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','jiaowuchu','教务处','evyagyue4zxw0rjnt5ygos8fehr4bzo5','2022-03-21 13:25:31','2022-03-21 16:38:08'),(2,1,'admin','users','管理员','3hp5xkxutlv9zfj78fpd2gxdtvwh1ol3','2022-03-21 13:33:05','2022-03-21 16:49:01'),(3,1,'a1','yonghu','学生','hquc9frahannzxzyw3dqy9ukjvcowo50','2022-03-21 14:09:15','2022-03-21 16:46:05'),(4,2,'a2','yonghu','学生','jeic1dccd15e52mig5txjsq8lbkiz7g5','2022-03-21 15:45:08','2022-03-21 16:45:09'),(5,3,'a3','yonghu','学生','e15dikiej791tsw7j4g9iffvw8qaa0mg','2022-03-21 15:45:15','2022-03-21 16:45:15');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yidaobaogao` */

DROP TABLE IF EXISTS `yidaobaogao`;

CREATE TABLE `yidaobaogao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `zhuanye_types` int(11) DEFAULT NULL COMMENT '专业确认',
  `yidaobaogao_paizhao` varchar(200) DEFAULT NULL COMMENT '身份信息',
  `yidaobaogao_yesno_types` int(11) DEFAULT NULL COMMENT '处理状态',
  `yidaobaogao_yesno_text` text COMMENT '申请结果',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='已到报告';

/*Data for the table `yidaobaogao` */

insert  into `yidaobaogao`(`id`,`yonghu_id`,`zhuanye_types`,`yidaobaogao_paizhao`,`yidaobaogao_yesno_types`,`yidaobaogao_yesno_text`,`create_time`) values (1,2,2,'身份信息1',2,'通过123123','2022-03-21 13:18:28'),(3,1,1,'身份信息3',2,'通过','2022-03-21 13:18:28'),(6,3,2,'身份信息如果不正确不管理可以审核拒绝',1,'','2022-03-21 15:45:41');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '学生姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_types` int(11) DEFAULT NULL COMMENT '报到状态 Search111 ',
  `zhuanye_types` int(11) DEFAULT NULL COMMENT '专业',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='学生';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_id_number`,`yonghu_email`,`yonghu_types`,`zhuanye_types`,`yonghu_delete`,`create_time`) values (1,'a1','123456','学生姓名1','http://localhost:8080/xinshengbaodao/upload/yonghu1.jpg',2,'17703786901','410224199610232001','1@qq.com',2,1,1,'2022-03-21 13:18:28'),(2,'a2','123456','学生姓名2','http://localhost:8080/xinshengbaodao/upload/yonghu2.jpg',1,'17703786902','410224199610232002','2@qq.com',2,2,1,'2022-03-21 13:18:28'),(3,'a3','123456','学生姓名3','http://localhost:8080/xinshengbaodao/upload/yonghu3.jpg',2,'17703786903','410224199610232003','3@qq.com',1,NULL,1,'2022-03-21 13:18:28');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
