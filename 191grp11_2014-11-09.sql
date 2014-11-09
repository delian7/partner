# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: 191grp11
# Generation Time: 2014-11-09 21:29:14 +0000
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
	(0,'','',NULL,NULL),
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
	(37050,'In4matx 121, Sec. A, Lecture','',NULL,NULL),
	(37200,'In4matx 191A, Sec. A, Lecture','ZIV DER HOEK','2014-11-07 17:37:30','2014-11-07 17:37:30');

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
	(372,73,0,4,36684,NULL,2,'2014-11-09 07:47:26','2014-11-09 07:47:26'),
	(373,73,5,4,36684,NULL,2,'2014-11-09 07:47:26','2014-11-09 07:47:26'),
	(374,74,0,2,37200,NULL,2,'2014-11-09 08:26:23','2014-11-09 08:26:23'),
	(375,74,4,2,37200,NULL,2,'2014-11-09 08:26:23','2014-11-09 08:26:23'),
	(442,106,0,6,37050,NULL,2,'2014-11-09 21:23:52','2014-11-09 21:23:52'),
	(443,106,4,6,37050,NULL,1,'2014-11-09 21:23:52','2014-11-09 21:23:52');

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `created_at`, `updated_at`)
VALUES
	(73,'Christina\'s group for Traffic Signal Simulator',NULL,NULL,'2014-11-09 07:47:26','2014-11-09 07:47:26'),
	(74,'Christina ',NULL,NULL,'2014-11-09 08:26:23','2014-11-09 08:26:23'),
	(106,'Calculating Auxiliary Birds',NULL,NULL,'2014-11-09 21:23:52','2014-11-09 21:23:52');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `active`, `group_size`, `created_at`, `updated_at`)
VALUES
	(0,NULL,0,0,2,NULL,NULL),
	(1,'Smiley Faces',36601,1,2,'2014-10-21 03:45:50','2014-10-23 00:31:52'),
	(2,'Linked Lists',36684,1,2,'2014-10-21 03:52:36','2014-10-23 00:37:21'),
	(3,'Database Parsing',36624,1,2,'2014-10-22 06:54:02','2014-10-23 00:37:28'),
	(4,'Traffic Signal Simulator',37050,1,4,'2014-10-22 06:54:26','2014-10-23 00:37:00'),
	(5,'Interactive Teddy Bear Creation',37050,1,2,'2014-10-22 06:55:05','2014-10-22 06:55:05'),
	(6,'Social Restaurant Tables',37050,1,4,'2014-10-22 06:55:32','2014-10-22 06:55:32'),
	(9,'lkjlkj',30750,1,2,NULL,NULL),
	(140,'In4matx 191A,  Sec. A, Lecture New Project',37200,1,2,'2014-11-07 07:58:46','2014-11-07 07:58:46');

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
	(23,37050,1,NULL,NULL),
	(1054,37200,0,'2014-11-08 03:59:59','2014-11-08 03:59:59'),
	(1055,37200,4,'2014-11-08 03:59:59','2014-11-08 03:59:59'),
	(1056,37200,5,'2014-11-08 03:59:59','2014-11-08 03:59:59'),
	(1057,37200,6,'2014-11-08 03:59:59','2014-11-08 03:59:59'),
	(1058,37200,1,'2014-11-08 03:59:59','2014-11-08 03:59:59'),
	(1059,37200,2,'2014-11-08 03:59:59','2014-11-08 03:59:59'),
	(1060,37200,3,'2014-11-08 03:59:59','2014-11-08 03:59:59'),
	(1074,37200,202,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1075,37200,203,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1076,37200,204,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1077,37200,205,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1078,37200,206,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1079,37200,207,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1080,37200,208,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1081,37200,209,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1082,37200,210,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1083,37200,211,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1084,37200,212,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1085,37200,213,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1086,37200,214,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1087,37200,215,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1088,37200,216,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1089,37200,217,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1090,37200,218,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1091,37200,219,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1092,37200,220,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1093,37200,221,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1094,37200,222,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1095,37200,223,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1096,37200,224,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1097,37200,225,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1098,37200,226,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1099,37200,227,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1100,37200,228,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1101,37200,229,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1102,37200,230,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1103,37200,231,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1104,37200,232,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1105,37200,233,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1106,37200,234,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1107,37200,235,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1108,37200,236,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1109,37200,237,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1110,37200,238,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1111,37200,239,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1112,37200,240,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1113,37200,241,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1114,37200,242,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1115,37200,243,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1116,37200,244,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1117,37200,245,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1118,37200,246,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1119,37200,247,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1120,37200,248,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1121,37200,249,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1122,37200,250,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1123,37200,251,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1124,37200,252,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1125,37200,253,'2014-11-08 04:01:10','2014-11-08 04:01:10'),
	(1126,37050,55,NULL,NULL),
	(1127,37050,222,NULL,NULL),
	(1128,37200,223,'2014-11-08 03:59:59','2014-11-08 03:59:59');

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
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',37050,6,67,'2014-11-08 09:10:51','2014-11-08 04:11:13','127.0.0.1','127.0.0.1',NULL,'622152_10151303211381368_1975951804_o.jpg','image/jpeg',143122,'2014-10-23 00:29:54',NULL,'2014-11-09 20:13:09'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',37200,140,12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',37200,140,17,'2014-11-08 03:57:32','2014-11-07 19:46:14','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',37200,140,2,'2014-11-05 09:50:18','2014-10-22 17:59:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-07 07:58:46'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',37200,140,10,'2014-11-06 21:19:03','2014-11-06 20:37:26','127.0.0.1','127.0.0.1',NULL,'1382955_10202520222632714_437838427_n.jpg','image/jpeg',60296,'2014-10-11 01:37:45',NULL,'2014-11-08 03:59:59'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',37200,140,13,'2014-11-06 20:38:20','2014-11-06 00:05:20','127.0.0.1','127.0.0.1',NULL,'10641277_10152392094266235_7300912786488460398_n.jpg','image/jpeg',55627,'2014-10-11 01:38:02',NULL,'2014-11-08 03:59:59'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',37200,140,8,'2014-11-05 23:50:43','2014-11-05 21:43:54','127.0.0.1','127.0.0.1',NULL,'10525581_10204567467375380_3907820298695189766_n.jpg','image/jpeg',68194,'2014-10-11 01:43:06',NULL,'2014-11-08 03:59:59'),
	(202,'dewaltg','student','Glenn','Dewalt',0,'dewaltg@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(203,'edmistons','student','Sharla','Edmiston',0,'edmistons@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(204,'torgersenf','student','Felicia','Torgersen',0,'torgersenf@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(205,'moritah','student','Harvey','Morita',0,'moritah@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(206,'kovacc','student','Corina','Kovac',0,'kovacc@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(207,'cantrellee','student','Ermelinda','Cantrelle',0,'cantrellee@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(208,'sylvestm','student','May','Sylvest',0,'sylvestm@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(209,'heinsc','student','Celestina','Heins',0,'heinsc@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(210,'konecnym','student','Major','Konecny',0,'konecnym@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(211,'lindleym','student','Mallory','Lindley',0,'lindleym@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(212,'meyery','student','Yuette','Meyer',0,'meyery@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(213,'brundiges','student','Sade','Brundige',0,'brundiges@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(214,'shuek','student','Kemberly','Shue',0,'shuek@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(215,'comfortc','student','Carey','Comfort',0,'comfortc@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(216,'bowsherr','student','Regena','Bowsher',0,'bowsherr@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(217,'oesterlings','student','Samual','Oesterling',0,'oesterlings@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:58','2014-11-08 04:01:10'),
	(218,'sellarss','student','Star','Sellars',0,'sellarss@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(219,'loveridged','student','Doretta','Loveridge',0,'loveridged@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(220,'espiritun','student','Nickolas','Espiritu',0,'espiritun@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(221,'lambrechth','student','Heidy','Lambrecht',0,'lambrechth@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(222,'inoues','student','Stormy','Inoue',0,'inoues@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(223,'cockrellk','student','Kimber','Cockrell',0,'cockrellk@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(224,'jantzenk','student','Karyn','Jantzen',0,'jantzenk@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(225,'kohutc','student','Chu','Kohut',0,'kohutc@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(226,'torress','student','Shari','Torres',0,'torress@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(227,'manseaud','student','Duane','Manseau',0,'manseaud@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(228,'canavand','student','Delana','Canavan',0,'canavand@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(229,'foardc','student','Charlie','Foard',0,'foardc@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(230,'khalsaj','student','Joni','Khalsa',0,'khalsaj@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(231,'calkinsl','student','Leia','Calkins',0,'calkinsl@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(232,'youngquistd','student','Dominque','Youngquist',0,'youngquistd@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(233,'hammittd','student','Dirk','Hammitt',0,'hammittd@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(234,'brackenss','student','Sonya','Brackens',0,'brackenss@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(235,'sinclairk','student','Kathline','Sinclair',0,'sinclairk@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(236,'boths','student','Sabina','Both',0,'boths@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(237,'mosqueral','student','Lorriane','Mosquera',0,'mosqueral@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(238,'braunj','student','Jamal','Braun',0,'braunj@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(239,'jessep','student','Phylis','Jesse',0,'jessep@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(240,'durenm','student','Marget','Duren',0,'durenm@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(241,'goldsteins','student','Saturnina','Goldstein',0,'goldsteins@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(242,'briskij','student','Joselyn','Briski',0,'briskij@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(243,'ortegond','student','Diedre','Ortegon',0,'ortegond@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(244,'mclendond','student','Dawne','Mclendon',0,'mclendond@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(245,'hoya','student','Allen','Hoy',0,'hoya@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(246,'herringtons','student','Sima','Herrington',0,'herringtons@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(247,'pullinsn','student','Neva','Pullins',0,'pullinsn@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(248,'kovacm','student','Marian','Kovac',0,'kovacm@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(249,'braswellm','student','Magdalen','Braswell',0,'braswellm@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(250,'caleym','student','Mario','Caley',0,'caleym@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(251,'mellv','student','Valeria','Mell',0,'mellv@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(252,'mccurdyw','student','Wally','Mccurdy',0,'mccurdyw@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:01:10'),
	(253,'winesj','student','Jacob','Wines',0,'winesj@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 03:59:59','2014-11-08 04:00:40'),
	(254,'altschulerd','student','Dillon','Altschuler',0,'altschulerd@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(255,'kaysp','student','Pearly','Kays',0,'kaysp@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(256,'hysmithv','student','Veda','Hysmith',0,'hysmithv@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(257,'willitsf','student','Fanny','Willits',0,'willitsf@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(258,'koehlw','student','Wilburn','Koehl',0,'koehlw@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(259,'sherrowm','student','Myrl','Sherrow',0,'sherrowm@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(260,'moffattt','student','Tasia','Moffatt',0,'moffattt@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(261,'palmern','student','Norris','Palmer',0,'palmern@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(262,'herlihyv','student','Vinita','Herlihy',0,'herlihyv@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(263,'sipesj','student','Janyce','Sipes',0,'sipesj@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(264,'hetzlers','student','Stefany','Hetzler',0,'hetzlers@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(265,'keilh','student','Hallie','Keil',0,'keilh@uci.edu',0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01'),
	(266,'treacyj','student','Joi','Treacy',0,'treacyj@uci.edu',37200,140,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-08 04:01:10','2014-11-08 04:11:01');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
