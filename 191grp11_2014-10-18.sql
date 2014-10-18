# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: 191grp11
# Generation Time: 2014-10-18 21:34:15 +0000
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

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `instructor` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;

INSERT INTO `courses` (`id`, `course_title`, `instructor`, `created_at`, `updated_at`)
VALUES
	(36520,'Boolean Algebra','',NULL,NULL),
	(36540,'Discreet Mathematics','',NULL,NULL),
	(36601,'Intro Lab1','',NULL,NULL),
	(36602,'Intro Lab2','',NULL,NULL),
	(36603,'Intro Lab3','',NULL,NULL),
	(36604,'Intro Lab4','',NULL,NULL);

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table evaluations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `evaluations`;

CREATE TABLE `evaluations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table group_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_relations`;

CREATE TABLE `group_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `accepted_at` time DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `group_relations` WRITE;
/*!40000 ALTER TABLE `group_relations` DISABLE KEYS */;

INSERT INTO `group_relations` (`id`, `group_id`, `user_id`, `project_id`, `course_id`, `accepted_at`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,6,1,36520,NULL,0,'2014-10-17 23:27:17','2014-10-17 23:27:17'),
	(2,1,4,1,36520,NULL,0,'2014-10-17 23:28:34','2014-10-17 23:28:34');

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `allow_repeat` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT '0',
  `course_id` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `group_id`, `course_id`, `created_at`, `updated_at`)
VALUES
	(1,1,36520,NULL,NULL),
	(2,2,36540,NULL,NULL),
	(3,3,36520,NULL,NULL);

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rosters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rosters`;

CREATE TABLE `rosters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rosters` WRITE;
/*!40000 ALTER TABLE `rosters` DISABLE KEYS */;

INSERT INTO `rosters` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,36520,0,NULL,NULL),
	(2,36520,4,NULL,NULL),
	(3,36520,5,NULL,NULL),
	(4,36520,6,NULL,NULL),
	(5,36520,2,NULL,NULL),
	(6,36520,3,NULL,NULL);

/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `campus_id` int(11) NOT NULL DEFAULT '0',
  `ucinetid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uci_affiliations` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_course` int(11) NOT NULL DEFAULT '0',
  `age_in_seconds` int(11) DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `index_users_on_ucinetid` (`ucinetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`campus_id`, `ucinetid`, `uci_affiliations`, `name`, `role`, `email`, `status`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `current_course`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina Ryder',0,'ryderc@uci.edu',0,7,'2014-10-18 21:23:27','2014-10-18 01:36:53','127.0.0.1','127.0.0.1',36520,NULL,'622152_10151303211381368_1975951804_o.jpg','image/jpeg',143122,'2014-10-15 17:27:01',NULL,'2014-10-18 21:23:27'),
	(1,'msilberm','student, staff','Michael Silberman',1,'msilberm@uci.edu',0,6,'2014-10-18 02:19:27','2014-10-18 01:25:59','127.0.0.1','127.0.0.1',36520,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-18 02:19:27'),
	(2,'kay','staff,faculty,employee','David G Kay',2,'kay@uci.edu',0,1,'2014-10-11 01:01:38','2014-10-11 01:01:38','127.0.0.1','127.0.0.1',36520,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-11 01:01:38'),
	(6,'petrovd','student','Delian Petrov',0,'petrovd@uci.edu',0,2,'2014-10-11 01:42:58','2014-10-11 01:21:06','127.0.0.1','127.0.0.1',36520,NULL,'10525581_10204567467375380_3907820298695189766_n.jpg','image/jpeg',68194,'2014-10-11 01:43:06',NULL,'2014-10-11 01:43:07'),
	(4,'imcnicol','student','Ian Mcnicol',0,'imcnicol@uci.edu',0,1,'2014-10-11 01:21:13','2014-10-11 01:21:13','127.0.0.1','127.0.0.1',36520,NULL,'1382955_10202520222632714_437838427_n.jpg','image/jpeg',60296,'2014-10-11 01:37:45',NULL,'2014-10-11 01:37:45'),
	(5,'vdhingrej','student','Vinayak Dhingreja',0,'vdhingrej@uci.edu',0,2,'2014-10-11 01:38:08','2014-10-11 01:37:53','127.0.0.1','127.0.0.1',36520,NULL,'10641277_10152392094266235_7300912786488460398_n.jpg','image/jpeg',55627,'2014-10-11 01:38:02',NULL,'2014-10-11 01:38:08'),
	(3,'ziv','student,staff,faculty,employee','Hadar Ziv',3,'ziv@uci.edu',0,0,NULL,NULL,NULL,NULL,36520,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
