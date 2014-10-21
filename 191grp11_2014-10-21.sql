# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: 191grp11
# Generation Time: 2014-10-21 15:47:34 +0000
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

INSERT INTO `courses` (`id`, `course_title`, `instructor`, `active_proj`, `created_at`, `updated_at`)
VALUES
	(36601,'ICS31: Lab 1','',NULL,NULL,NULL),
	(36602,'ICS31: Lab 2','',NULL,NULL,NULL),
	(36603,'ICS31: Lab 3','',NULL,NULL,NULL),
	(36604,'ICS31: Lab 4','',NULL,NULL,NULL),
	(36605,'ICS31: Lab 5','',NULL,NULL,NULL),
	(36606,'ICS31: Lab 6','',NULL,NULL,NULL),
	(36607,'ICS31: Lab 7','',NULL,NULL,NULL),
	(36608,'ICS31: Lab 8','',NULL,NULL,NULL),
	(36609,'ICS31: Lab 9','',NULL,NULL,NULL),
	(36610,'ICS31: Lab 10','',NULL,NULL,NULL),
	(36611,'ICS31: Lab 11','',NULL,NULL,NULL),
	(36612,'ICS31: Lab 12','',NULL,NULL,NULL),
	(36613,'ICS31: Lab 13','',NULL,NULL,NULL),
	(36614,'ICS31: Lab 14','',NULL,NULL,NULL),
	(36615,'ICS31: Lab 15','',NULL,NULL,NULL),
	(36616,'ICS31: Lab 16','',NULL,NULL,NULL),
	(36619,'ICS32: Lab 1','',NULL,NULL,NULL),
	(36621,'ICS32: Lab 1','',NULL,NULL,NULL),
	(36622,'ICS32: Lab 1','',NULL,NULL,NULL),
	(36623,'ICS32: Lab 1','',NULL,NULL,NULL),
	(36624,'ICS32: Lab 1','',NULL,NULL,NULL),
	(36625,'ICS32: Lab 1','',NULL,NULL,NULL),
	(36626,'ICS32: Lab 1','',NULL,NULL,NULL),
	(36681,'ICS45J: Lab 1','',NULL,NULL,NULL),
	(36682,'ICS45J: Lab 2','',NULL,NULL,NULL),
	(36683,'ICS45J: Lab 3','',NULL,NULL,NULL),
	(36684,'ICS45J: Lab 4','',NULL,NULL,NULL);

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
	(1,1,6,1,36601,NULL,0,'2014-10-17 23:27:17','2014-10-17 23:27:17'),
	(2,1,4,1,36601,NULL,0,'2014-10-17 23:28:34','2014-10-17 23:28:34'),
	(3,1,5,1,36601,NULL,0,'2014-10-21 03:56:18','2014-10-21 03:56:18'),
	(4,1,0,1,36601,NULL,0,NULL,NULL),
	(5,2,0,1,36602,NULL,0,NULL,NULL);

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `created_at`, `updated_at`)
VALUES
	(1,'Kay\'s Legion',2,0,NULL,NULL),
	(2,'Ziv\'s Bitches',2,0,NULL,NULL);

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `group_size`, `created_at`, `updated_at`, `active`)
VALUES
	(1,'Smiley Faces #1',36601,3,'2014-10-21 03:45:50','2014-10-21 04:01:55',0),
	(3,NULL,37200,2,'2014-10-21 03:52:36','2014-10-21 03:52:36',NULL);

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rosters
# ------------------------------------------------------------

LOCK TABLES `rosters` WRITE;
/*!40000 ALTER TABLE `rosters` DISABLE KEYS */;

INSERT INTO `rosters` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,36601,0,NULL,NULL),
	(2,36601,4,NULL,NULL),
	(3,36601,5,NULL,NULL),
	(4,36601,6,NULL,NULL),
	(5,36601,2,NULL,NULL),
	(6,36601,3,NULL,NULL),
	(7,36602,2,NULL,NULL);

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

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',37200,29,'2014-10-21 06:20:30','2014-10-21 06:17:53','127.0.0.1','127.0.0.1',NULL,'622152_10151303211381368_1975951804_o.jpg','image/jpeg',143122,'2014-10-15 17:27:01',NULL,'2014-10-21 06:20:30'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',36601,7,'2014-10-21 06:18:01','2014-10-18 02:19:27','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-21 06:18:01'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',36602,3,'2014-10-20 05:46:31','2014-10-19 22:29:58','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 23:07:08'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',36601,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',36601,1,'2014-10-11 01:21:13','2014-10-11 01:21:13','127.0.0.1','127.0.0.1',NULL,'1382955_10202520222632714_437838427_n.jpg','image/jpeg',60296,'2014-10-11 01:37:45',NULL,'2014-10-11 01:37:45'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',36601,2,'2014-10-11 01:38:08','2014-10-11 01:37:53','127.0.0.1','127.0.0.1',NULL,'10641277_10152392094266235_7300912786488460398_n.jpg','image/jpeg',55627,'2014-10-11 01:38:02',NULL,'2014-10-11 01:38:08'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',36601,3,'2014-10-21 06:15:51','2014-10-11 01:42:58','127.0.0.1','127.0.0.1',NULL,'10525581_10204567467375380_3907820298695189766_n.jpg','image/jpeg',68194,'2014-10-11 01:43:06',NULL,'2014-10-21 06:15:51');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
