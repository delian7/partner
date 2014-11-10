# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: 191grp11
# Generation Time: 2014-11-06 04:16:20 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table courses
# ------------------------------------------------------------

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;

INSERT INTO `courses` (`id`, `course_title`, `instructor`, `created_at`, `updated_at`)
VALUES
	(36601,'Information & Comp Sci 31: Lab 1','',NULL,NULL),
	(36602,'Information & Comp Sci 31: Lab 2','',NULL,NULL),
	(36603,'Information & Comp Sci 31: Lab 3','',NULL,NULL),
	(36604,'Information & Comp Sci 31: Lab 4','',NULL,NULL),
	(36605,'Information & Comp Sci 31: Lab 5','',NULL,NULL),
	(36606,'Information & Comp Sci 31: Lab 6','',NULL,NULL),
	(36607,'Information & Comp Sci 31: Lab 7','',NULL,NULL),
	(36608,'Information & Comp Sci 31: Lab 8','',NULL,NULL),
	(36609,'Information & Comp Sci 31: Lab 9','',NULL,NULL),
	(36610,'Information & Comp Sci 31: Lab 10','',NULL,NULL),
	(36611,'Information & Comp Sci 31: Lab 11','',NULL,NULL),
	(36612,'Information & Comp Sci 31: Lab 12','',NULL,NULL),
	(36619,'Information & Comp Sci 32: Lab 1','',NULL,NULL),
	(36621,'Information & Comp Sci 32: Lab 2','',NULL,NULL),
	(36622,'Information & Comp Sci 32: Lab 3','',NULL,NULL),
	(36623,'Information & Comp Sci 32: Lab 4','',NULL,NULL),
	(36624,'Information & Comp Sci 32: Lab 5','',NULL,NULL),
	(36626,'Information & Comp Sci 32: Lab 7','',NULL,NULL),
	(36681,'Information & Comp Sci 45J: Lab 1','',NULL,NULL),
	(36682,'Information & Comp Sci 45J: Lab 2','',NULL,NULL),
	(36683,'Information & Comp Sci 45J: Lab 3','',NULL,NULL),
	(36684,'Information & Comp Sci 45J: Lab 4','',NULL,NULL),
	(37050,'In4matx 121, Sec. A, 4-unit Lecture','',NULL,NULL);

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table evaluations
# ------------------------------------------------------------



# Dump of table group_relations
# ------------------------------------------------------------

LOCK TABLES `group_relations` WRITE;
/*!40000 ALTER TABLE `group_relations` DISABLE KEYS */;

INSERT INTO `group_relations` (`id`, `group_id`, `user_id`, `project_id`, `course_id`, `accepted_at`, `status`, `created_at`, `updated_at`)
VALUES
	(159,70,0,5,37050,NULL,0,'2014-11-06 03:44:13','2014-11-06 03:44:13'),
	(160,70,4,5,37050,NULL,1,'2014-11-06 03:44:13','2014-11-06 03:44:13'),
	(161,70,5,5,37050,NULL,1,'2014-11-06 03:44:14','2014-11-06 03:44:14');

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `created_at`, `updated_at`)
VALUES
	(1,'Kay\'s Legion',2,0,NULL,NULL),
	(2,'UBO',2,0,NULL,NULL),
	(3,'Battle Toads',4,1,NULL,NULL);

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `active`, `group_size`, `created_at`, `updated_at`)
VALUES
	(1,'Smiley Faces',36601,1,2,'2014-10-21 03:45:50','2014-10-23 00:31:52'),
	(2,'Linked Lists',36684,1,2,'2014-10-21 03:52:36','2014-10-23 00:37:21'),
	(3,'Database Parsing',36624,1,2,'2014-10-22 06:54:02','2014-10-23 00:37:28'),
	(4,'Traffic Signal Simulator',37050,1,4,'2014-10-22 06:54:26','2014-10-23 00:37:00'),
	(5,'Interactive Teddy Bear Creation',37050,1,3,'2014-10-22 06:55:05','2014-10-22 06:55:05'),
	(6,'Social Restaurant Tables',37050,0,4,'2014-10-22 06:55:32','2014-10-22 06:55:32');

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rosters
# ------------------------------------------------------------

LOCK TABLES `rosters` WRITE;
/*!40000 ALTER TABLE `rosters` DISABLE KEYS */;

INSERT INTO `rosters` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,36601,0,NULL,NULL),
	(2,36601,1,NULL,NULL),
	(3,36601,2,NULL,NULL),
	(4,36601,3,NULL,NULL),
	(5,36601,6,NULL,NULL),
	(6,36624,2,NULL,NULL),
	(7,36624,4,NULL,NULL),
	(8,36624,0,NULL,NULL),
	(9,36624,3,NULL,NULL),
	(10,36624,1,NULL,NULL),
	(11,36684,6,NULL,NULL),
	(12,36684,3,NULL,NULL),
	(13,36684,5,NULL,NULL),
	(14,36684,0,NULL,NULL),
	(15,36684,1,NULL,NULL),
	(16,36684,2,NULL,NULL),
	(17,37050,0,NULL,NULL),
	(18,37050,2,NULL,NULL),
	(19,37050,6,NULL,NULL),
	(20,37050,5,NULL,NULL),
	(21,37050,3,NULL,NULL),
	(22,37050,4,NULL,NULL),
	(23,37050,1,NULL,NULL);

/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20140529148575'),
	('20140529194119'),
	('20140715214449'),
	('20140715214459'),
	('20140717232431'),
	('20140731231530'),
	('20140801165743');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `current_project`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',37050,5,60,'2014-11-06 00:05:23','2014-11-06 00:04:30','127.0.0.1','127.0.0.1',NULL,'622152_10151303211381368_1975951804_o.jpg','image/jpeg',143122,'2014-10-23 00:29:54',NULL,'2014-11-06 03:43:37'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',36684,1,12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-23 00:42:38'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',36684,1,12,'2014-11-05 18:22:09','2014-11-05 09:56:47','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-05 18:22:09'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',36684,1,2,'2014-11-05 09:50:18','2014-10-22 17:59:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-05 09:51:45'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',37050,5,8,'2014-11-05 23:48:06','2014-11-05 22:59:49','127.0.0.1','127.0.0.1',NULL,'1382955_10202520222632714_437838427_n.jpg','image/jpeg',60296,'2014-10-11 01:37:45',NULL,'2014-11-05 23:48:06'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',36684,5,12,'2014-11-06 00:05:20','2014-11-06 00:04:56','127.0.0.1','127.0.0.1',NULL,'10641277_10152392094266235_7300912786488460398_n.jpg','image/jpeg',55627,'2014-10-11 01:38:02',NULL,'2014-11-06 00:05:20'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',36684,5,8,'2014-11-05 23:50:43','2014-11-05 21:43:54','127.0.0.1','127.0.0.1',NULL,'10525581_10204567467375380_3907820298695189766_n.jpg','image/jpeg',68194,'2014-10-11 01:43:06',NULL,'2014-11-06 00:03:23');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
