# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: partner_up_development
# Generation Time: 2014-11-18 23:07:29 +0000
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
	(37050,'In4matx 121, Sec. A, Lecture','',NULL,NULL);

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
	(3090,1068,0,18,37050,NULL,2,'2014-11-18 23:06:34','2014-11-18 23:06:34');

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `project_id`, `course_id`, `created_at`, `updated_at`)
VALUES
	(1068,'Team Plum',NULL,NULL,18,37050,'2014-11-18 23:06:34','2014-11-18 23:06:34');

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
	(11,18,37050);

/*!40000 ALTER TABLE `project_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `allow_repeat`, `name_gen`, `allow_randomization`, `active`, `group_size`, `autogroup`, `created_at`, `updated_at`)
VALUES
	(0,NULL,0,0,0,NULL,1,2,0,'2014-11-15 01:42:50','2014-11-15 01:42:50'),
	(5,'Linked Lists',36684,1,0,NULL,1,2,0,'2014-11-18 07:00:54','2014-11-18 20:47:12'),
	(6,'fuck you delian',36624,0,2,NULL,1,2,0,'2014-11-18 07:08:18','2014-11-18 21:15:45'),
	(7,'Smiley Faces',36684,1,0,NULL,1,2,0,'2014-11-18 07:08:37','2014-11-18 20:47:17'),
	(8,'Requirements Elicitation',36624,1,1,NULL,1,5,0,'2014-11-18 17:01:26','2014-11-18 18:44:19'),
	(9,'Lemon Party',36601,1,3,NULL,1,3,0,'2014-11-18 18:41:59','2014-11-18 19:52:29'),
	(10,'WTB van queef run',36624,0,1,NULL,1,2,0,'2014-11-18 18:43:37','2014-11-18 18:43:56'),
	(18,'Social Table',37050,0,3,NULL,1,4,0,'2014-11-18 19:42:40','2014-11-18 20:04:55');

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


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `current_project`, `description`, `availability`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',36684,5,'','Tuesdays after 5pm',83,'2014-11-18 23:05:46','2014-11-18 07:16:11','127.0.0.1','127.0.0.1',NULL,'1.jpg','image/jpeg',35914,'2014-11-18 06:57:42',NULL,'2014-11-18 23:05:58'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',0,0,'','',12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-18 17:00:01'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',37050,18,'PAIR PROMRAGING!!!!','',32,'2014-11-18 23:06:18','2014-11-18 16:59:53','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-18 23:06:28'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',0,0,'','',7,'2014-11-18 07:06:31','2014-11-17 08:39:02','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-18 07:06:31'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',0,0,'','',10,'2014-11-06 21:19:03','2014-11-06 20:37:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-18 17:00:01'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',0,0,'','',14,'2014-11-18 06:59:15','2014-11-06 20:38:20','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-18 17:00:01'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',0,0,'','',10,'2014-11-11 08:04:39','2014-11-11 01:06:51','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-18 17:00:01'),
	(7,'dewaltg','student','Glenn','Dewalt',0,'dewaltg@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(8,'edmistons','student','Sharla','Edmiston',0,'edmistons@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(9,'torgersenf','student','Felicia','Torgersen',0,'torgersenf@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(10,'moritah','student','Harvey','Morita',0,'moritah@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(11,'kovacc','student','Corina','Kovac',0,'kovacc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(12,'cantrellee','student','Ermelinda','Cantrelle',0,'cantrellee@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(13,'sylvestm','student','May','Sylvest',0,'sylvestm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(14,'heinsc','student','Celestina','Heins',0,'heinsc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(15,'konecnym','student','Major','Konecny',0,'konecnym@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(16,'lindleym','student','Mallory','Lindley',0,'lindleym@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(17,'meyery','student','Yuette','Meyer',0,'meyery@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(18,'brundiges','student','Sade','Brundige',0,'brundiges@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(19,'shuek','student','Kemberly','Shue',0,'shuek@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(20,'comfortc','student','Carey','Comfort',0,'comfortc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(21,'bowsherr','student','Regena','Bowsher',0,'bowsherr@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(22,'oesterlings','student','Samual','Oesterling',0,'oesterlings@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(23,'sellarss','student','Star','Sellars',0,'sellarss@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(24,'loveridged','student','Doretta','Loveridge',0,'loveridged@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(25,'espiritun','student','Nickolas','Espiritu',0,'espiritun@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(26,'lambrechth','student','Heidy','Lambrecht',0,'lambrechth@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(27,'inoues','student','Stormy','Inoue',0,'inoues@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(28,'cockrellk','student','Kimber','Cockrell',0,'cockrellk@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(29,'jantzenk','student','Karyn','Jantzen',0,'jantzenk@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(30,'kohutc','student','Chu','Kohut',0,'kohutc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(31,'torress','student','Shari','Torres',0,'torress@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(32,'manseaud','student','Duane','Manseau',0,'manseaud@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(33,'canavand','student','Delana','Canavan',0,'canavand@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(34,'foardc','student','Charlie','Foard',0,'foardc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(35,'khalsaj','student','Joni','Khalsa',0,'khalsaj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(36,'calkinsl','student','Leia','Calkins',0,'calkinsl@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(37,'youngquistd','student','Dominque','Youngquist',0,'youngquistd@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(38,'hammittd','student','Dirk','Hammitt',0,'hammittd@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(39,'brackenss','student','Sonya','Brackens',0,'brackenss@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(40,'sinclairk','student','Kathline','Sinclair',0,'sinclairk@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(41,'boths','student','Sabina','Both',0,'boths@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(42,'mosqueral','student','Lorriane','Mosquera',0,'mosqueral@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(43,'braunj','student','Jamal','Braun',0,'braunj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(44,'jessep','student','Phylis','Jesse',0,'jessep@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(45,'durenm','student','Marget','Duren',0,'durenm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(46,'goldsteins','student','Saturnina','Goldstein',0,'goldsteins@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(47,'briskij','student','Joselyn','Briski',0,'briskij@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(48,'ortegond','student','Diedre','Ortegon',0,'ortegond@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(49,'mclendond','student','Dawne','Mclendon',0,'mclendond@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(50,'hoya','student','Allen','Hoy',0,'hoya@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(51,'herringtons','student','Sima','Herrington',0,'herringtons@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(52,'pullinsn','student','Neva','Pullins',0,'pullinsn@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(53,'kovacm','student','Marian','Kovac',0,'kovacm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(54,'braswellm','student','Magdalen','Braswell',0,'braswellm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(55,'caleym','student','Mario','Caley',0,'caleym@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(56,'mellv','student','Valeria','Mell',0,'mellv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(57,'mccurdyw','student','Wally','Mccurdy',0,'mccurdyw@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
	(58,'winesj','student','Jacob','Wines',0,'winesj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-15 01:42:55','2014-11-18 17:00:01'),
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
