/*
SQLyog Ultimate v8.63 
MySQL - 5.5.15 : Database - mapic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mapic` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `mapic`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `pictureId` int(18) DEFAULT NULL,
  `commentType` int(4) DEFAULT NULL COMMENT '1:like 2:dislike 3:report 4:comment',
  `userId` int(18) DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL,
  `commentContent` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comment` */

insert  into `comment`(`id`,`pictureId`,`commentType`,`userId`,`creationTime`,`commentContent`) values (1,1,1,1,NULL,NULL);

/*Table structure for table `picture` */

DROP TABLE IF EXISTS `picture`;

CREATE TABLE `picture` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleteFlag` int(4) DEFAULT NULL,
  `likes` int(255) DEFAULT NULL,
  `dislikes` int(255) DEFAULT NULL,
  `report` int(255) DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL,
  `generateTime` datetime DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `userId` int(18) DEFAULT NULL,
  `hash` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `picture` */

insert  into `picture`(`id`,`url`,`title`,`description`,`deleteFlag`,`likes`,`dislikes`,`report`,`creationTime`,`generateTime`,`latitude`,`longitude`,`userId`,`hash`,`width`,`height`) values (1,'http://www.j.cn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,100,NULL,NULL,NULL,NULL),(2,'www.g.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,100,NULL,NULL,NULL,NULL);

/*Table structure for table `relationship` */

DROP TABLE IF EXISTS `relationship`;

CREATE TABLE `relationship` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `followerId` int(18) DEFAULT NULL,
  `followId` int(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `relationship` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `userId` int(18) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileNumber` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homeNumber` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `follows` int(255) DEFAULT NULL,
  `followed` int(255) DEFAULT NULL,
  `signature` mediumtext COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `userinfo` */

/*Table structure for table `userinfohistory` */

DROP TABLE IF EXISTS `userinfohistory`;

CREATE TABLE `userinfohistory` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `creationTime` datetime DEFAULT NULL,
  `userId` int(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `userinfohistory` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
