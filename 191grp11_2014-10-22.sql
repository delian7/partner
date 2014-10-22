# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: 191grp11
# Generation Time: 2014-10-22 19:41:21 +0000
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

INSERT INTO `projects` (`id`, `name`, `course_id`, `group_size`, `created_at`, `updated_at`, `active`)
VALUES
	(1,'Smiley Faces',36601,3,'2014-10-21 03:45:50','2014-10-22 06:55:38',0),
	(3,NULL,36602,2,'2014-10-21 03:52:36','2014-10-21 03:52:36',NULL),
	(11,'Database Parsing',36601,2,'2014-10-22 06:54:02','2014-10-22 06:54:02',NULL),
	(12,'Traffic Signal Simulator',36601,2,'2014-10-22 06:54:26','2014-10-22 06:54:40',NULL),
	(13,'Interactive Teddy Bear Creation',36602,4,'2014-10-22 06:55:05','2014-10-22 06:55:05',NULL),
	(14,'Social Restaurant Tables',36602,4,'2014-10-22 06:55:32','2014-10-22 06:55:32',NULL);

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
