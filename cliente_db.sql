/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.33-0ubuntu0.18.04.1 : Database - admin_client_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`admin_client_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `admin_client_db`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/* Trigger structure for table `cliente` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `calcula_edad` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'admin_dev'@'%' */ /*!50003 TRIGGER `calcula_edad` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
	DECLARE edad INT;
  
	SELECT YEAR(CURDATE())-YEAR(New.fecha_nacimiento) 
	+ IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(New.fecha_nacimiento,'%m-%d'), 0 , -1 ) 
	 INTO edad;
	 
	SET New.edad = edad;
   
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
