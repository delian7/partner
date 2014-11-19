# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: partner_up_development
# Generation Time: 2014-11-19 22:39:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `allow_repeat`, `name_gen`, `active`, `group_size`, `autogroup`, `created_at`, `updated_at`)
VALUES
	(0,NULL,0,0,0,1,2,0,'2014-11-15 01:42:50','2014-11-15 01:42:50'),
	(5,'Linked Lists',36684,1,0,1,2,0,'2014-11-18 07:00:54','2014-11-18 20:47:12'),
	(6,'WTB naxx rub',36624,0,2,1,2,0,'2014-11-18 07:08:18','2014-11-18 23:10:33'),
	(7,'Smiley Faces',36684,1,0,1,2,0,'2014-11-18 07:08:37','2014-11-18 20:47:17'),
	(8,'Requirements Elicitation',36624,1,1,1,5,0,'2014-11-18 17:01:26','2014-11-18 18:44:19'),
	(9,'Lemon Party',36601,1,3,1,3,0,'2014-11-18 18:41:59','2014-11-18 19:52:29'),
	(10,'WTB van queef run',36624,0,1,1,2,0,'2014-11-18 18:43:37','2014-11-18 18:43:56'),
	(18,'Social Table',37050,0,2,1,3,0,'2014-11-18 19:42:40','2014-11-19 00:00:40'),
	(23,'In4matx 191A  Sec. A - New Project',37200,0,0,1,2,0,'2014-11-19 01:07:56','2014-11-19 01:07:56');

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
