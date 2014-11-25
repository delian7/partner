# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: partner_up_development
# Generation Time: 2014-11-19 22:33:18 +0000
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
	(37200,'In4matx 191A, Sec. A, Lecture','ZIV DER HOEK','2014-11-19 01:07:56','2014-11-19 01:07:56');

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
	(3087,1068,4,18,37050,NULL,2,'2014-11-18 23:06:34','2014-11-18 23:06:34'),
	(3088,1068,5,18,37050,NULL,2,'2014-11-18 23:06:34','2014-11-18 23:06:34'),
	(3089,1068,6,18,37050,NULL,2,'2014-11-18 23:06:34','2014-11-18 23:06:34'),
	(3090,1068,0,18,37050,NULL,2,'2014-11-18 23:06:34','2014-11-18 23:06:34'),
	(3129,1086,0,5,36684,NULL,2,'2014-11-18 23:17:13','2014-11-18 23:17:13'),
	(3130,1086,5,5,36684,NULL,2,'2014-11-18 23:17:13','2014-11-19 00:03:04'),
	(3133,1088,0,7,36684,NULL,2,'2014-11-18 23:21:25','2014-11-18 23:21:25'),
	(3134,1088,6,7,36684,NULL,2,'2014-11-18 23:21:25','2014-11-18 23:21:25'),
	(3135,1089,5,7,36684,NULL,2,'2014-11-18 23:21:25','2014-11-18 23:21:25'),
	(3136,1090,4,6,36624,NULL,2,'2014-11-18 23:21:32','2014-11-18 23:21:32'),
	(3137,1090,0,6,36624,NULL,2,'2014-11-18 23:21:32','2014-11-18 23:21:32'),
	(3138,1091,0,9,36601,NULL,2,'2014-11-18 23:21:36','2014-11-18 23:21:36'),
	(3139,1091,6,9,36601,NULL,2,'2014-11-18 23:21:36','2014-11-18 23:21:36'),
	(3211,1129,37,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3212,1129,23,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3213,1130,35,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3214,1130,49,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3215,1131,52,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3216,1131,15,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3217,1132,47,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3218,1132,24,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3219,1133,55,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3220,1133,16,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3221,1134,9,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3222,1134,53,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3223,1135,58,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3224,1135,4,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3225,1136,36,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3226,1136,6,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3227,1137,12,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3228,1137,44,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3229,1138,8,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3230,1138,18,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3231,1139,46,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3232,1139,54,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3233,1140,43,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3234,1140,42,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3235,1141,20,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3236,1141,27,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3237,1142,56,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3238,1142,25,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3239,1143,38,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3240,1143,34,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3241,1144,7,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3242,1144,39,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3243,1145,57,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3244,1145,10,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3245,1146,48,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3246,1146,13,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3247,1147,41,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3248,1147,5,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3249,1148,14,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3250,1148,0,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3251,1149,11,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3252,1149,33,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3253,1150,50,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3254,1150,21,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3255,1151,22,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3256,1151,19,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3257,1152,26,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3258,1152,17,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3259,1153,28,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3260,1153,40,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3261,1154,31,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3262,1154,30,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3263,1155,29,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3264,1155,45,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3265,1156,32,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(3266,1156,51,23,37200,NULL,2,'2014-11-19 01:47:39','2014-11-19 01:47:39');

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `project_id`, `course_id`, `created_at`, `updated_at`)
VALUES
	(1068,'Team Plu',NULL,NULL,18,37050,'2014-11-18 23:06:34','2014-11-19 21:18:03'),
	(1088,'Team 1',NULL,NULL,7,36684,'2014-11-18 23:21:25','2014-11-18 23:21:25'),
	(1089,'Team 2 ,,,',NULL,NULL,7,36684,'2014-11-18 23:21:25','2014-11-18 23:21:25'),
	(1090,'Team Emu',NULL,NULL,6,36624,'2014-11-18 23:21:32','2014-11-18 23:21:32'),
	(1091,'Team Cyan',NULL,NULL,9,36601,'2014-11-18 23:21:36','2014-11-18 23:21:36'),
	(1092,'Team Silver',NULL,NULL,9,36601,'2014-11-18 23:21:36','2014-11-18 23:21:36'),
	(1129,'Team 1',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1130,'Team 2',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1131,'Team 3',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1132,'Team 4',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1133,'Team 5',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1134,'Team 6',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1135,'Team 7',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1136,'Team 8',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1137,'Team 9',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1138,'Team 10',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1139,'Team 11',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1140,'Team 12',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1141,'Team 13',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1142,'Team 14',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1143,'Team 15',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1144,'Team 16',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1145,'Team 17',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1146,'Team 18',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1147,'Team 19',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1148,'Team 20',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1149,'Team 21',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1150,'Team 22',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1151,'Team 23',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1152,'Team 24',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1153,'Team 25',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1154,'Team 26',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1155,'Team 27',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1156,'Team 28',NULL,NULL,23,37200,'2014-11-19 01:47:39','2014-11-19 01:47:39'),
	(1165,'4444',NULL,NULL,23,37200,'2014-11-19 21:35:48','2014-11-19 21:35:48'),
	(1166,'444',NULL,NULL,23,37200,'2014-11-19 21:40:40','2014-11-19 21:40:40');

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
	(11,18,37050),
	(12,20,37200),
	(13,22,37200),
	(14,22,37200),
	(15,22,37200),
	(16,22,37200),
	(17,22,37200),
	(18,22,37200),
	(19,22,37200),
	(20,23,37200);

/*!40000 ALTER TABLE `project_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `allow_repeat`, `name_gen`, `allow_randomization`, `active`, `group_size`, `autogroup`, `evaluation_id`,  `created_at`, `updated_at`)
VALUES
	(0,NULL,0,0,0,NULL,1,2,0, '2014-11-15 01:42:50','2014-11-15 01:42:50'),
	(5,'Linked Lists',36684,1,0,NULL,1,2,0,NULL,'2014-11-18 07:00:54','2014-11-18 20:47:12'),
	(6,'WTB naxx rub',36624,0,2,NULL,1,2,0,NULL,'2014-11-18 07:08:18','2014-11-18 23:10:33'),
	(7,'Smiley Faces',36684,1,0,NULL,1,2,0,NULL,'2014-11-18 07:08:37','2014-11-18 20:47:17'),
	(8,'Requirements Elicitation',36624,1,1,NULL,1,5,0,NULL,'2014-11-18 17:01:26','2014-11-18 18:44:19'),
	(9,'Lemon Party',36601,1,3,NULL,1,3,0,NULL,'2014-11-18 18:41:59','2014-11-18 19:52:29'),
	(10,'WTB van queef run',36624,0,1,NULL,1,2,0,NULL,'2014-11-18 18:43:37','2014-11-18 18:43:56'),
	(18,'Social Table',37050,0,2,NULL,1,3,0,NULL,'2014-11-18 19:42:40','2014-11-19 00:00:40'),
	(23,'In4matx 191A  Sec. A - New Project',37200,0,0,NULL,1,2,0,NULL,'2014-11-19 01:07:56','2014-11-19 01:07:56');

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
	(344,37200,2,'2014-11-19 01:07:56','2014-11-19 01:07:56'),
	(397,37200,0,'2014-11-19 01:07:56','2014-11-19 01:07:56'),
	(398,37200,4,'2014-11-19 01:07:56','2014-11-19 01:07:56'),
	(399,37200,5,'2014-11-19 01:07:56','2014-11-19 01:07:56'),
	(400,37200,6,'2014-11-19 01:07:56','2014-11-19 01:07:56'),
	(401,37200,1,'2014-11-19 01:07:56','2014-11-19 01:07:56'),
	(416,37200,7,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(417,37200,8,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(418,37200,9,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(419,37200,10,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(420,37200,11,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(421,37200,12,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(422,37200,13,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(423,37200,14,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(424,37200,15,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(425,37200,16,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(426,37200,17,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(427,37200,18,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(428,37200,19,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(429,37200,20,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(430,37200,21,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(431,37200,22,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(432,37200,23,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(433,37200,24,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(434,37200,25,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(435,37200,26,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(436,37200,27,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(437,37200,28,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(438,37200,29,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(439,37200,30,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(440,37200,31,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(441,37200,32,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(442,37200,33,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(443,37200,34,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(444,37200,35,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(445,37200,36,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(446,37200,37,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(447,37200,38,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(448,37200,39,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(449,37200,40,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(450,37200,41,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(451,37200,42,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(452,37200,43,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(453,37200,44,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(454,37200,45,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(455,37200,46,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(456,37200,47,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(457,37200,48,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(458,37200,49,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(459,37200,50,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(460,37200,51,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(461,37200,52,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(462,37200,53,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(463,37200,54,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(464,37200,55,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(465,37200,56,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(466,37200,57,'2014-11-19 01:10:12','2014-11-19 01:10:12'),
	(467,37200,58,'2014-11-19 01:10:12','2014-11-19 01:10:12');

/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `current_project`, `description`, `availability`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',37050,18,'','Tuesdays after 5pm',95,'2014-11-19 05:26:37','2014-11-19 04:38:15','127.0.0.1','127.0.0.1',NULL,'1.jpg','image/jpeg',35914,'2014-11-18 06:57:42',NULL,'2014-11-19 05:26:37'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',37200,23,'','',12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-19 01:07:56'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',37200,23,'PAIR PROMRAGING!!!!','',38,'2014-11-19 21:29:09','2014-11-19 05:06:22','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-19 21:37:20'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',37200,23,'','',7,'2014-11-18 07:06:31','2014-11-17 08:39:02','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-19 01:10:12'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',37200,23,'','',10,'2014-11-06 21:19:03','2014-11-06 20:37:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-19 01:07:56'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',37050,18,'','',17,'2014-11-19 04:02:58','2014-11-19 00:02:17','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-19 04:37:30'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',37200,23,'','',10,'2014-11-11 08:04:39','2014-11-11 01:06:51','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-19 01:07:56'),
	(7,'dewaltg','student','Glenn','Dewalt',0,'dewaltg@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(8,'edmistons','student','Sharla','Edmiston',0,'edmistons@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(9,'torgersenf','student','Felicia','Torgersen',0,'torgersenf@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(10,'moritah','student','Harvey','Morita',0,'moritah@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(11,'kovacc','student','Corina','Kovac',0,'kovacc@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(12,'cantrellee','student','Ermelinda','Cantrelle',0,'cantrellee@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(13,'sylvestm','student','May','Sylvest',0,'sylvestm@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(14,'heinsc','student','Celestina','Heins',0,'heinsc@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(15,'konecnym','student','Major','Konecny',0,'konecnym@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(16,'lindleym','student','Mallory','Lindley',0,'lindleym@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(17,'meyery','student','Yuette','Meyer',0,'meyery@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(18,'brundiges','student','Sade','Brundige',0,'brundiges@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(19,'shuek','student','Kemberly','Shue',0,'shuek@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(20,'comfortc','student','Carey','Comfort',0,'comfortc@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(21,'bowsherr','student','Regena','Bowsher',0,'bowsherr@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(22,'oesterlings','student','Samual','Oesterling',0,'oesterlings@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(23,'sellarss','student','Star','Sellars',0,'sellarss@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(24,'loveridged','student','Doretta','Loveridge',0,'loveridged@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(25,'espiritun','student','Nickolas','Espiritu',0,'espiritun@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(26,'lambrechth','student','Heidy','Lambrecht',0,'lambrechth@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(27,'inoues','student','Stormy','Inoue',0,'inoues@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(28,'cockrellk','student','Kimber','Cockrell',0,'cockrellk@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(29,'jantzenk','student','Karyn','Jantzen',0,'jantzenk@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(30,'kohutc','student','Chu','Kohut',0,'kohutc@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(31,'torress','student','Shari','Torres',0,'torress@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(32,'manseaud','student','Duane','Manseau',0,'manseaud@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(33,'canavand','student','Delana','Canavan',0,'canavand@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(34,'foardc','student','Charlie','Foard',0,'foardc@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(35,'khalsaj','student','Joni','Khalsa',0,'khalsaj@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(36,'calkinsl','student','Leia','Calkins',0,'calkinsl@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(37,'youngquistd','student','Dominque','Youngquist',0,'youngquistd@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(38,'hammittd','student','Dirk','Hammitt',0,'hammittd@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(39,'brackenss','student','Sonya','Brackens',0,'brackenss@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(40,'sinclairk','student','Kathline','Sinclair',0,'sinclairk@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(41,'boths','student','Sabina','Both',0,'boths@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(42,'mosqueral','student','Lorriane','Mosquera',0,'mosqueral@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(43,'braunj','student','Jamal','Braun',0,'braunj@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(44,'jessep','student','Phylis','Jesse',0,'jessep@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(45,'durenm','student','Marget','Duren',0,'durenm@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(46,'goldsteins','student','Saturnina','Goldstein',0,'goldsteins@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(47,'briskij','student','Joselyn','Briski',0,'briskij@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(48,'ortegond','student','Diedre','Ortegon',0,'ortegond@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(49,'mclendond','student','Dawne','Mclendon',0,'mclendond@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(50,'hoya','student','Allen','Hoy',0,'hoya@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(51,'herringtons','student','Sima','Herrington',0,'herringtons@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(52,'pullinsn','student','Neva','Pullins',0,'pullinsn@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(53,'kovacm','student','Marian','Kovac',0,'kovacm@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(54,'braswellm','student','Magdalen','Braswell',0,'braswellm@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(55,'caleym','student','Mario','Caley',0,'caleym@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(56,'mellv','student','Valeria','Mell',0,'mellv@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(57,'mccurdyw','student','Wally','Mccurdy',0,'mccurdyw@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:12'),
	(58,'winesj','student','Jacob','Wines',0,'winesj@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-19 01:10:09'),
	(59,'altschulerd','student','Dillon','Altschuler',0,'altschulerd@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(60,'kaysp','student','Pearly','Kays',0,'kaysp@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(61,'hysmithv','student','Veda','Hysmith',0,'hysmithv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(62,'willitsf','student','Fanny','Willits',0,'willitsf@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(63,'koehlw','student','Wilburn','Koehl',0,'koehlw@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(64,'sherrowm','student','Myrl','Sherrow',0,'sherrowm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(65,'moffattt','student','Tasia','Moffatt',0,'moffattt@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(66,'palmern','student','Norris','Palmer',0,'palmern@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(67,'herlihyv','student','Vinita','Herlihy',0,'herlihyv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(68,'sipesj','student','Janyce','Sipes',0,'sipesj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(69,'hetzlers','student','Stefany','Hetzler',0,'hetzlers@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(70,'keilh','student','Hallie','Keil',0,'keilh@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09'),
	(71,'treacyj','student','Joi','Treacy',0,'treacyj@uci.edu',37200,23,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-19 01:10:09');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
