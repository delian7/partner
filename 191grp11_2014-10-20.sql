# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: 191grp11
# Generation Time: 2014-10-20 23:08:32 +0000
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
	(36601,'ICS31: Lab 1','',NULL,NULL),
	(36602,'ICS31: Lab 2','',NULL,NULL),
	(36603,'ICS31: Lab 3','',NULL,NULL),
	(36604,'ICS31: Lab 4','',NULL,NULL),
	(36605,'ICS31: Lab 5','',NULL,NULL),
	(36606,'ICS31: Lab 6','',NULL,NULL),
	(36607,'ICS31: Lab 7','',NULL,NULL),
	(36608,'ICS31: Lab 8','',NULL,NULL),
	(36609,'ICS31: Lab 9','',NULL,NULL),
	(36610,'ICS31: Lab 10','',NULL,NULL),
	(36611,'ICS31: Lab 11','',NULL,NULL),
	(36612,'ICS31: Lab 12','',NULL,NULL),
	(36613,'ICS31: Lab 13','',NULL,NULL),
	(36614,'ICS31: Lab 14','',NULL,NULL),
	(36615,'ICS31: Lab 15','',NULL,NULL),
	(36616,'ICS31: Lab 16','',NULL,NULL),
	(36619,'ICS32: Lab 1','',NULL,NULL),
	(36621,'ICS32: Lab 1','',NULL,NULL),
	(36622,'ICS32: Lab 1','',NULL,NULL),
	(36623,'ICS32: Lab 1','',NULL,NULL),
	(36624,'ICS32: Lab 1','',NULL,NULL),
	(36625,'ICS32: Lab 1','',NULL,NULL),
	(36626,'ICS32: Lab 1','',NULL,NULL),
	(36681,'ICS45J: Lab 1','',NULL,NULL),
	(36682,'ICS45J: Lab 2','',NULL,NULL),
	(36683,'ICS45J: Lab 3','',NULL,NULL),
	(36684,'ICS45J: Lab 4','',NULL,NULL);

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
	(2,1,4,1,36601,NULL,0,'2014-10-17 23:28:34','2014-10-17 23:28:34');

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

INSERT INTO `projects` (`id`, `name`, `course_id`, `active`, `created_at`, `updated_at`)
VALUES
	(1,'',36601,1,'2014-10-20 23:05:38','2014-10-20 23:05:38');

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

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `name`, `role`, `email`, `current_course`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(1,'msilberm','student, staff','Michael Silberman',1,'msilberm@uci.edu',36601,6,'2014-10-18 02:19:27','2014-10-18 01:25:59','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-18 02:19:27'),
	(2,'fuuuf','staff,faculty,employee','David G Kay',2,'kay@uci.edu',36602,3,'2014-10-20 05:46:31','2014-10-19 22:29:58','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 23:07:08'),
	(3,'ziv','student,staff,faculty,employee','Hadar Ziv',3,'ziv@uci.edu',36601,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'imcnicol','student','Ian Mcnicol',0,'imcnicol@uci.edu',36601,1,'2014-10-11 01:21:13','2014-10-11 01:21:13','127.0.0.1','127.0.0.1',NULL,'1382955_10202520222632714_437838427_n.jpg','image/jpeg',60296,'2014-10-11 01:37:45',NULL,'2014-10-11 01:37:45'),
	(5,'vdhingrej','student','Vinayak Dhingreja',0,'vdhingrej@uci.edu',36601,2,'2014-10-11 01:38:08','2014-10-11 01:37:53','127.0.0.1','127.0.0.1',NULL,'10641277_10152392094266235_7300912786488460398_n.jpg','image/jpeg',55627,'2014-10-11 01:38:02',NULL,'2014-10-11 01:38:08'),
	(6,'petrovd','student','Delian Petrov',0,'petrovd@uci.edu',36601,2,'2014-10-11 01:42:58','2014-10-11 01:21:06','127.0.0.1','127.0.0.1',NULL,'10525581_10204567467375380_3907820298695189766_n.jpg','image/jpeg',68194,'2014-10-11 01:43:06',NULL,'2014-10-11 01:43:07'),
	(7,'ryderc','student','Christina Ryder',0,'ryderc@uci.edu',36601,8,'2014-10-19 22:25:42','2014-10-18 21:23:27','127.0.0.1','127.0.0.1',NULL,'622152_10151303211381368_1975951804_o.jpg','image/jpeg',143122,'2014-10-15 17:27:01',NULL,'2014-10-19 22:25:42'),
	(1109,'altschulerd','student','Dillon, Altschuler',0,'altschulerd@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1110,'kaysp','student','Pearly, Kays',0,'kaysp@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1111,'hysmithv','student','Veda, Hysmith',0,'hysmithv@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1112,'willitsf','student','Fanny, Willits',0,'willitsf@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1113,'koehlw','student','Wilburn, Koehl',0,'koehlw@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1114,'sherrowm','student','Myrl, Sherrow',0,'sherrowm@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1115,'moffattt','student','Tasia, Moffatt',0,'moffattt@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1116,'palmern','student','Norris, Palmer',0,'palmern@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1117,'herlihyv','student','Vinita, Herlihy',0,'herlihyv@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1118,'sipesj','student','Janyce, Sipes',0,'sipesj@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1119,'hetzlers','student','Stefany, Hetzler',0,'hetzlers@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1120,'keilh','student','Hallie, Keil',0,'keilh@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1121,'treacyj','student','Joi, Treacy',0,'treacyj@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1122,'dewaltg','student','Glenn, Dewalt',0,'dewaltg@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1123,'edmistons','student','Sharla, Edmiston',0,'edmistons@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1124,'torgersenf','student','Felicia, Torgersen',0,'torgersenf@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1125,'moritah','student','Harvey, Morita',0,'moritah@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1126,'kovacc','student','Corina, Kovac',0,'kovacc@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1127,'cantrellee','student','Ermelinda, Cantrelle',0,'cantrellee@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1128,'sylvestm','student','May, Sylvest',0,'sylvestm@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1129,'heinsc','student','Celestina, Heins',0,'heinsc@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1130,'konecnym','student','Major, Konecny',0,'konecnym@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1131,'lindleym','student','Mallory, Lindley',0,'lindleym@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1132,'meyery','student','Yuette, Meyer',0,'meyery@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1133,'brundiges','student','Sade, Brundige',0,'brundiges@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1134,'shuek','student','Kemberly, Shue',0,'shuek@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1135,'comfortc','student','Carey, Comfort',0,'comfortc@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1136,'bowsherr','student','Regena, Bowsher',0,'bowsherr@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1137,'oesterlings','student','Samual, Oesterling',0,'oesterlings@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1138,'sellarss','student','Star, Sellars',0,'sellarss@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1139,'loveridged','student','Doretta, Loveridge',0,'loveridged@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1140,'espiritun','student','Nickolas, Espiritu',0,'espiritun@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1141,'lambrechth','student','Heidy, Lambrecht',0,'lambrechth@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1142,'inoues','student','Stormy, Inoue',0,'inoues@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1143,'cockrellk','student','Kimber, Cockrell',0,'cockrellk@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1144,'jantzenk','student','Karyn, Jantzen',0,'jantzenk@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1145,'kohutc','student','Chu, Kohut',0,'kohutc@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1146,'torress','student','Shari, Torres',0,'torress@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1147,'manseaud','student','Duane, Manseau',0,'manseaud@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1148,'canavand','student','Delana, Canavan',0,'canavand@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1149,'foardc','student','Charlie, Foard',0,'foardc@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1150,'khalsaj','student','Joni, Khalsa',0,'khalsaj@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1151,'calkinsl','student','Leia, Calkins',0,'calkinsl@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1152,'youngquistd','student','Dominque, Youngquist',0,'youngquistd@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1153,'hammittd','student','Dirk, Hammitt',0,'hammittd@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1154,'brackenss','student','Sonya, Brackens',0,'brackenss@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1155,'sinclairk','student','Kathline, Sinclair',0,'sinclairk@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1156,'boths','student','Sabina, Both',0,'boths@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1157,'mosqueral','student','Lorriane, Mosquera',0,'mosqueral@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1158,'braunj','student','Jamal, Braun',0,'braunj@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1159,'jessep','student','Phylis, Jesse',0,'jessep@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1160,'durenm','student','Marget, Duren',0,'durenm@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1161,'goldsteins','student','Saturnina, Goldstein',0,'goldsteins@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1162,'briskij','student','Joselyn, Briski',0,'briskij@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1163,'ortegond','student','Diedre, Ortegon',0,'ortegond@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1164,'mclendond','student','Dawne, Mclendon',0,'mclendond@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1165,'hoya','student','Allen, Hoy',0,'hoya@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1166,'herringtons','student','Sima, Herrington',0,'herringtons@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:09','2014-10-20 22:02:09'),
	(1167,'pullinsn','student','Neva, Pullins',0,'pullinsn@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:10','2014-10-20 22:02:10'),
	(1168,'kovacm','student','Marian, Kovac',0,'kovacm@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:10','2014-10-20 22:02:10'),
	(1169,'braswellm','student','Magdalen, Braswell',0,'braswellm@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:10','2014-10-20 22:02:10'),
	(1170,'caleym','student','Mario, Caley',0,'caleym@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:10','2014-10-20 22:02:10'),
	(1171,'mellv','student','Valeria, Mell',0,'mellv@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:10','2014-10-20 22:02:10'),
	(1172,'mccurdyw','student','Wally, Mccurdy',0,'mccurdyw@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:10','2014-10-20 22:02:10'),
	(1173,'winesj','student','Jacob, Wines',0,'winesj@uci.edu',37200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-20 22:02:10','2014-10-20 22:02:10');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
