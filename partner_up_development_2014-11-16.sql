# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: partner_up_development
# Generation Time: 2014-11-16 09:39:27 +0000
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
	(37200,'In4matx 191A, Sec. A, Lecture','ZIV DER HOEK','2014-11-15 01:42:55','2014-11-15 01:42:55');

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
	(2369,733,18,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2370,733,8,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2371,734,52,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2372,734,5,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2373,735,58,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2374,735,54,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2375,736,25,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2376,736,20,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2377,737,47,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2378,737,56,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2379,738,23,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2380,738,31,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2381,739,19,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2382,739,33,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2383,740,26,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2384,740,4,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2385,741,55,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2386,741,36,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2387,742,46,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2388,742,10,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2389,743,32,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2390,743,27,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2391,744,29,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2392,744,28,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2393,745,6,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2394,745,38,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2395,746,51,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2396,746,13,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2397,747,45,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2398,747,57,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2399,748,21,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2400,748,42,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2401,749,40,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2402,749,37,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2403,750,12,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2404,750,16,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2405,751,9,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2406,751,39,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2407,752,7,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2408,752,17,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2409,753,43,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2410,753,22,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2411,754,15,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2412,754,34,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2413,755,14,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2414,755,53,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2415,756,41,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2416,756,0,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2417,757,35,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2418,757,24,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2419,758,11,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2420,758,50,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2421,759,30,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(2422,759,48,2,37200,NULL,2,'2014-11-16 09:32:57','2014-11-16 09:32:57');

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `project_id`, `course_id`, `created_at`, `updated_at`)
VALUES
	(733,'Team Vampires',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(734,'Team Pigs',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(735,'Team Monkeys',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(736,'Team Gnomes',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(737,'Team Sheep',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(738,'Team Fishes',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(739,'Team Exorcists',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(740,'Team Cats',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(741,'Team Enchanters',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(742,'Team Goblins',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(743,'Team Sorcerors',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(744,'Team Chimeras',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(745,'Team Witches',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(746,'Team Chickens',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(747,'Team Witches',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(748,'Team Druids',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(749,'Team Fishes',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(750,'Team Ants',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(751,'Team Buffalo',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(752,'Team Bees',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(753,'Team Dragons',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(754,'Team Bears',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(755,'Team Ogres',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(756,'Team Ducks',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(757,'Team Griffins',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(758,'Team Dragons',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(759,'Team Vampires',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(760,'Team Banshees',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57'),
	(761,'Team Oracles',NULL,NULL,2,37200,'2014-11-16 09:32:57','2014-11-16 09:32:57');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `allow_repeat`, `name_gen`, `active`, `group_size`, `autogroup`, `created_at`, `updated_at`)
VALUES
	(0,NULL,0,0,0,1,2,0,'2014-11-15 01:42:50','2014-11-15 01:42:50'),
	(2,'In4matx 191A  Sec. A - New Project',37200,0,2,1,2,0,'2014-11-15 01:42:55','2014-11-16 09:32:46');

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
	(1126,37050,55,NULL,NULL),
	(1127,37050,222,NULL,NULL),
	(1165,37200,44,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1166,37200,45,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1167,37200,46,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1168,37200,47,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1169,37200,48,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1170,37200,49,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1171,37200,50,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1172,37200,51,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1173,37200,52,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1174,37200,53,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1175,37200,54,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1176,37200,55,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1177,37200,56,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1178,37200,57,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1179,37200,58,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1180,37200,0,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1181,37200,4,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1182,37200,5,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1183,37200,6,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1184,37200,1,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1185,37200,2,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1186,37200,3,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(1237,37200,7,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1238,37200,8,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1239,37200,9,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1240,37200,10,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1241,37200,11,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1242,37200,12,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1243,37200,13,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1244,37200,14,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1245,37200,15,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1246,37200,16,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1247,37200,17,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1248,37200,18,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1249,37200,19,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1250,37200,20,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1251,37200,21,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1252,37200,22,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1253,37200,23,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1254,37200,24,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1255,37200,25,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1256,37200,26,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1257,37200,27,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1258,37200,28,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1259,37200,29,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1260,37200,30,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1261,37200,31,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1262,37200,32,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1263,37200,33,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1264,37200,34,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1265,37200,35,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1266,37200,36,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1267,37200,37,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1268,37200,38,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1269,37200,39,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1270,37200,40,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1271,37200,41,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1272,37200,42,'2014-11-16 08:59:55','2014-11-16 08:59:55'),
	(1273,37200,43,'2014-11-16 08:59:55','2014-11-16 08:59:55');

/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `current_project`, `description`, `availability`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',37200,2,'','Tuesdays after 5pm',74,'2014-11-16 08:53:37','2014-11-16 04:51:45','127.0.0.1','127.0.0.1',NULL,'good-girl-gina.jpg','image/jpeg',654147,'2014-11-16 08:56:45',NULL,'2014-11-16 08:56:46'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',37200,2,'','',12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',37200,2,'','',22,'2014-11-16 08:57:02','2014-11-16 05:07:51','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:02'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',37200,2,'','',5,'2014-11-16 05:07:21','2014-11-11 08:01:24','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 05:07:21'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',37200,2,'','',10,'2014-11-06 21:19:03','2014-11-06 20:37:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',37200,2,'','',13,'2014-11-06 20:38:20','2014-11-06 00:05:20','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',37200,2,'','',10,'2014-11-11 08:04:39','2014-11-11 01:06:51','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55'),
	(7,'dewaltg','student','Glenn','Dewalt',0,'dewaltg@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(8,'edmistons','student','Sharla','Edmiston',0,'edmistons@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(9,'torgersenf','student','Felicia','Torgersen',0,'torgersenf@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(10,'moritah','student','Harvey','Morita',0,'moritah@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(11,'kovacc','student','Corina','Kovac',0,'kovacc@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(12,'cantrellee','student','Ermelinda','Cantrelle',0,'cantrellee@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(13,'sylvestm','student','May','Sylvest',0,'sylvestm@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(14,'heinsc','student','Celestina','Heins',0,'heinsc@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(15,'konecnym','student','Major','Konecny',0,'konecnym@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(16,'lindleym','student','Mallory','Lindley',0,'lindleym@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(17,'meyery','student','Yuette','Meyer',0,'meyery@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(18,'brundiges','student','Sade','Brundige',0,'brundiges@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(19,'shuek','student','Kemberly','Shue',0,'shuek@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(20,'comfortc','student','Carey','Comfort',0,'comfortc@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(21,'bowsherr','student','Regena','Bowsher',0,'bowsherr@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(22,'oesterlings','student','Samual','Oesterling',0,'oesterlings@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(23,'sellarss','student','Star','Sellars',0,'sellarss@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(24,'loveridged','student','Doretta','Loveridge',0,'loveridged@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(25,'espiritun','student','Nickolas','Espiritu',0,'espiritun@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(26,'lambrechth','student','Heidy','Lambrecht',0,'lambrechth@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(27,'inoues','student','Stormy','Inoue',0,'inoues@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(28,'cockrellk','student','Kimber','Cockrell',0,'cockrellk@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(29,'jantzenk','student','Karyn','Jantzen',0,'jantzenk@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(30,'kohutc','student','Chu','Kohut',0,'kohutc@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(31,'torress','student','Shari','Torres',0,'torress@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(32,'manseaud','student','Duane','Manseau',0,'manseaud@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(33,'canavand','student','Delana','Canavan',0,'canavand@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(34,'foardc','student','Charlie','Foard',0,'foardc@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(35,'khalsaj','student','Joni','Khalsa',0,'khalsaj@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(36,'calkinsl','student','Leia','Calkins',0,'calkinsl@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(37,'youngquistd','student','Dominque','Youngquist',0,'youngquistd@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(38,'hammittd','student','Dirk','Hammitt',0,'hammittd@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(39,'brackenss','student','Sonya','Brackens',0,'brackenss@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(40,'sinclairk','student','Kathline','Sinclair',0,'sinclairk@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(41,'boths','student','Sabina','Both',0,'boths@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(42,'mosqueral','student','Lorriane','Mosquera',0,'mosqueral@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(43,'braunj','student','Jamal','Braun',0,'braunj@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-16 08:59:55'),
	(44,'jessep','student','Phylis','Jesse',0,'jessep@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(45,'durenm','student','Marget','Duren',0,'durenm@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(46,'goldsteins','student','Saturnina','Goldstein',0,'goldsteins@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(47,'briskij','student','Joselyn','Briski',0,'briskij@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(48,'ortegond','student','Diedre','Ortegon',0,'ortegond@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(49,'mclendond','student','Dawne','Mclendon',0,'mclendond@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(50,'hoya','student','Allen','Hoy',0,'hoya@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(51,'herringtons','student','Sima','Herrington',0,'herringtons@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(52,'pullinsn','student','Neva','Pullins',0,'pullinsn@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(53,'kovacm','student','Marian','Kovac',0,'kovacm@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(54,'braswellm','student','Magdalen','Braswell',0,'braswellm@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(55,'caleym','student','Mario','Caley',0,'caleym@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(56,'mellv','student','Valeria','Mell',0,'mellv@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(57,'mccurdyw','student','Wally','Mccurdy',0,'mccurdyw@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(58,'winesj','student','Jacob','Wines',0,'winesj@uci.edu',37200,2,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-15 01:42:55'),
	(59,'altschulerd','student','Dillon','Altschuler',0,'altschulerd@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(60,'kaysp','student','Pearly','Kays',0,'kaysp@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(61,'hysmithv','student','Veda','Hysmith',0,'hysmithv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(62,'willitsf','student','Fanny','Willits',0,'willitsf@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(63,'koehlw','student','Wilburn','Koehl',0,'koehlw@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(64,'sherrowm','student','Myrl','Sherrow',0,'sherrowm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(65,'moffattt','student','Tasia','Moffatt',0,'moffattt@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(66,'palmern','student','Norris','Palmer',0,'palmern@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(67,'herlihyv','student','Vinita','Herlihy',0,'herlihyv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(68,'sipesj','student','Janyce','Sipes',0,'sipesj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(69,'hetzlers','student','Stefany','Hetzler',0,'hetzlers@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(70,'keilh','student','Hallie','Keil',0,'keilh@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42'),
	(71,'treacyj','student','Joi','Treacy',0,'treacyj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-16 08:57:34','2014-11-16 08:59:42');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
