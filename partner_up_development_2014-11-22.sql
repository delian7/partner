# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: partner_up_development
# Generation Time: 2014-11-22 23:22:52 +0000
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
	(0,'','',NULL,'2014-11-11 07:32:05'),
	(36601,'Information & Comp Sci 31: Lab 11','',NULL,'2014-11-19 00:04:27'),
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
	(37200,'In4matx 191A, Sec. A, Lecture','ZIV DER HOEK','2014-11-22 11:50:36','2014-11-22 11:50:36');

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
	(5183,2350,54,25,37200,NULL,2,'2014-11-22 23:21:21','2014-11-22 23:21:21'),
	(5184,2350,59,25,37200,NULL,1,'2014-11-22 23:21:21','2014-11-22 23:21:21'),
	(5185,2351,6,25,37200,NULL,2,'2014-11-22 23:21:36','2014-11-22 23:21:36'),
	(5186,2351,54,25,37200,NULL,1,'2014-11-22 23:21:36','2014-11-22 23:21:36'),
	(5187,2352,0,25,37200,NULL,2,'2014-11-22 23:21:44','2014-11-22 23:21:44'),
	(5188,2352,54,25,37200,NULL,1,'2014-11-22 23:21:44','2014-11-22 23:21:44'),
	(5189,2353,5,25,37200,NULL,2,'2014-11-22 23:21:55','2014-11-22 23:21:55'),
	(5190,2353,54,25,37200,NULL,1,'2014-11-22 23:21:55','2014-11-22 23:21:55');

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `project_id`, `course_id`, `created_at`, `updated_at`)
VALUES
	(2350,'Magdalen and Dillon',NULL,NULL,25,37200,'2014-11-22 23:21:21','2014-11-22 23:21:21'),
	(2351,'Delian and Magdalen',NULL,NULL,25,37200,'2014-11-22 23:21:36','2014-11-22 23:21:36'),
	(2352,'Christina and Magdalen',NULL,NULL,25,37200,'2014-11-22 23:21:44','2014-11-22 23:21:44'),
	(2353,'Vinayak and Magdalen',NULL,NULL,25,37200,'2014-11-22 23:21:55','2014-11-22 23:21:55');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_relations
# ------------------------------------------------------------

LOCK TABLES `project_relations` WRITE;
/*!40000 ALTER TABLE `project_relations` DISABLE KEYS */;

INSERT INTO `project_relations` (`id`, `project_id`, `course_id`)
VALUES
	(5,5,36684),
	(6,6,36624),
	(7,7,36684),
	(8,10,36624),
	(9,17,36601),
	(10,9,36601),
	(23,25,37200);

/*!40000 ALTER TABLE `project_relations` ENABLE KEYS */;
UNLOCK TABLES;


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
	(10,'WTB van cleef run',36624,0,1,1,2,0,'2014-11-18 18:43:37','2014-11-18 18:43:56'),
	(18,'Social Table',37050,0,2,1,3,0,'2014-11-18 19:42:40','2014-11-19 00:00:40'),
	(25,'In4matx 191A  Sec. A - New Project',37200,0,0,1,2,0,'2014-11-22 11:39:17','2014-11-22 11:39:17');

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
	(584,37200,2,'2014-11-22 11:50:36','2014-11-22 11:50:36'),
	(650,37200,0,'2014-11-22 11:52:28','2014-11-22 11:52:28'),
	(651,37200,4,'2014-11-22 11:52:28','2014-11-22 11:52:28'),
	(652,37200,5,'2014-11-22 11:52:28','2014-11-22 11:52:28'),
	(653,37200,6,'2014-11-22 11:52:28','2014-11-22 11:52:28'),
	(654,37200,1,'2014-11-22 11:52:28','2014-11-22 11:52:28'),
	(693,37200,44,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(694,37200,45,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(695,37200,46,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(696,37200,47,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(697,37200,48,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(698,37200,49,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(699,37200,50,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(700,37200,51,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(701,37200,52,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(702,37200,53,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(703,37200,54,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(704,37200,55,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(705,37200,56,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(706,37200,57,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(707,37200,58,'2014-11-22 11:58:32','2014-11-22 11:58:32'),
	(708,37200,3,'2014-11-22 11:58:36','2014-11-22 11:58:36'),
	(709,37200,59,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(710,37200,60,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(711,37200,61,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(712,37200,62,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(713,37200,63,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(714,37200,64,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(715,37200,65,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(716,37200,66,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(717,37200,67,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(718,37200,68,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(719,37200,69,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(720,37200,70,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(721,37200,71,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(722,37200,7,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(723,37200,8,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(724,37200,9,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(725,37200,10,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(726,37200,11,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(727,37200,12,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(728,37200,13,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(729,37200,14,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(730,37200,15,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(731,37200,16,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(732,37200,17,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(733,37200,18,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(734,37200,19,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(735,37200,20,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(736,37200,21,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(737,37200,22,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(738,37200,23,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(739,37200,24,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(740,37200,25,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(741,37200,26,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(742,37200,27,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(743,37200,28,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(744,37200,29,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(745,37200,30,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(746,37200,31,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(747,37200,32,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(748,37200,33,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(749,37200,34,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(750,37200,35,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(751,37200,36,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(752,37200,37,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(753,37200,38,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(754,37200,39,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(755,37200,40,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(756,37200,41,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(757,37200,42,'2014-11-22 12:40:07','2014-11-22 12:40:07'),
	(758,37200,43,'2014-11-22 12:40:07','2014-11-22 12:40:07');

/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `current_project`, `description`, `availability`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',37200,25,'','Tuesdays after 5pm',108,'2014-11-22 23:21:40','2014-11-22 13:10:49','127.0.0.1','127.0.0.1',NULL,'1.jpg','image/jpeg',35914,'2014-11-18 06:57:42',NULL,'2014-11-22 23:21:40'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',37200,25,'','',12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-22 11:52:28'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',37200,25,'PAIR PROMRAGING!!!!','',41,'2014-11-22 12:39:20','2014-11-21 06:54:15','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-22 12:39:20'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',37200,25,'','',7,'2014-11-18 07:06:31','2014-11-17 08:39:02','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-22 11:51:07'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',37200,25,'','',10,'2014-11-06 21:19:03','2014-11-06 20:37:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-22 11:52:28'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',37200,25,'','',18,'2014-11-22 23:21:50','2014-11-19 04:02:58','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-22 23:21:50'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',37200,25,'','',12,'2014-11-22 23:21:27','2014-11-22 12:40:12','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-22 23:21:27'),
	(7,'dewaltg','student','Glenn','Dewalt',0,'dewaltg@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(8,'edmistons','student','Sharla','Edmiston',0,'edmistons@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(9,'torgersenf','student','Felicia','Torgersen',0,'torgersenf@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(10,'moritah','student','Harvey','Morita',0,'moritah@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(11,'kovacc','student','Corina','Kovac',0,'kovacc@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(12,'cantrellee','student','Ermelinda','Cantrelle',0,'cantrellee@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(13,'sylvestm','student','May','Sylvest',0,'sylvestm@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(14,'heinsc','student','Celestina','Heins',0,'heinsc@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(15,'konecnym','student','Major','Konecny',0,'konecnym@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(16,'lindleym','student','Mallory','Lindley',0,'lindleym@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(17,'meyery','student','Yuette','Meyer',0,'meyery@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(18,'brundiges','student','Sade','Brundige',0,'brundiges@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(19,'shuek','student','Kemberly','Shue',0,'shuek@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(20,'comfortc','student','Carey','Comfort',0,'comfortc@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(21,'bowsherr','student','Regena','Bowsher',0,'bowsherr@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(22,'oesterlings','student','Samual','Oesterling',0,'oesterlings@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(23,'sellarss','student','Star','Sellars',0,'sellarss@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(24,'loveridged','student','Doretta','Loveridge',0,'loveridged@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(25,'espiritun','student','Nickolas','Espiritu',0,'espiritun@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(26,'lambrechth','student','Heidy','Lambrecht',0,'lambrechth@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(27,'inoues','student','Stormy','Inoue',0,'inoues@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(28,'cockrellk','student','Kimber','Cockrell',0,'cockrellk@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(29,'jantzenk','student','Karyn','Jantzen',0,'jantzenk@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(30,'kohutc','student','Chu','Kohut',0,'kohutc@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(31,'torress','student','Shari','Torres',0,'torress@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(32,'manseaud','student','Duane','Manseau',0,'manseaud@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(33,'canavand','student','Delana','Canavan',0,'canavand@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(34,'foardc','student','Charlie','Foard',0,'foardc@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(35,'khalsaj','student','Joni','Khalsa',0,'khalsaj@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(36,'calkinsl','student','Leia','Calkins',0,'calkinsl@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(37,'youngquistd','student','Dominque','Youngquist',0,'youngquistd@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(38,'hammittd','student','Dirk','Hammitt',0,'hammittd@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(39,'brackenss','student','Sonya','Brackens',0,'brackenss@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(40,'sinclairk','student','Kathline','Sinclair',0,'sinclairk@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(41,'boths','student','Sabina','Both',0,'boths@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(42,'mosqueral','student','Lorriane','Mosquera',0,'mosqueral@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(43,'braunj','student','Jamal','Braun',0,'braunj@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(44,'jessep','student','Phylis','Jesse',0,'jessep@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(45,'durenm','student','Marget','Duren',0,'durenm@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(46,'goldsteins','student','Saturnina','Goldstein',0,'goldsteins@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(47,'briskij','student','Joselyn','Briski',0,'briskij@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(48,'ortegond','student','Diedre','Ortegon',0,'ortegond@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(49,'mclendond','student','Dawne','Mclendon',0,'mclendond@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(50,'hoya','student','Allen','Hoy',0,'hoya@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(51,'herringtons','student','Sima','Herrington',0,'herringtons@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(52,'pullinsn','student','Neva','Pullins',0,'pullinsn@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(53,'kovacm','student','Marian','Kovac',0,'kovacm@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(54,'braswellm','student','Magdalen','Braswell',0,'braswellm@uci.edu',37200,25,'','',2,'2014-11-22 23:22:03','2014-11-22 13:11:10','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 23:22:03'),
	(55,'caleym','student','Mario','Caley',0,'caleym@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(56,'mellv','student','Valeria','Mell',0,'mellv@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(57,'mccurdyw','student','Wally','Mccurdy',0,'mccurdyw@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(58,'winesj','student','Jacob','Wines',0,'winesj@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-22 11:52:28'),
	(59,'altschulerd','student','Dillon','Altschuler',0,'altschulerd@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(60,'kaysp','student','Pearly','Kays',0,'kaysp@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(61,'hysmithv','student','Veda','Hysmith',0,'hysmithv@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(62,'willitsf','student','Fanny','Willits',0,'willitsf@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(63,'koehlw','student','Wilburn','Koehl',0,'koehlw@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(64,'sherrowm','student','Myrl','Sherrow',0,'sherrowm@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(65,'moffattt','student','Tasia','Moffatt',0,'moffattt@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(66,'palmern','student','Norris','Palmer',0,'palmern@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(67,'herlihyv','student','Vinita','Herlihy',0,'herlihyv@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(68,'sipesj','student','Janyce','Sipes',0,'sipesj@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(69,'hetzlers','student','Stefany','Hetzler',0,'hetzlers@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(70,'keilh','student','Hallie','Keil',0,'keilh@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28'),
	(71,'treacyj','student','Joi','Treacy',0,'treacyj@uci.edu',37200,25,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-22 11:52:28');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
