# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: partner_up_development
# Generation Time: 2014-11-12 16:23:05 +0000
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



# Dump of table groups
# ------------------------------------------------------------



# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `allow_repeat`, `allow_randomization`, `active`, `group_size`, `created_at`, `updated_at`)
VALUES
	(0,NULL,0,0,0,0,2,NULL,NULL),
	(1,'Smiley Faces',36601,0,0,1,2,'2014-10-21 03:45:50','2014-10-23 00:31:52'),
	(2,'Linked Lists',36684,0,0,1,2,'2014-10-21 03:52:36','2014-10-23 00:37:21'),
	(3,'Database Parsing',36624,0,0,1,2,'2014-10-22 06:54:02','2014-10-23 00:37:28'),
	(4,'Traffic Signal Simulator',37050,0,0,1,4,'2014-10-22 06:54:26','2014-10-23 00:37:00'),
	(5,'Interactive Teddy Bear Creation',37050,0,0,1,3,'2014-10-22 06:55:05','2014-10-22 06:55:05'),
	(6,'Social Restaurant Tables',37050,0,0,0,4,'2014-10-22 06:55:32','2014-10-22 06:55:32');

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
	(4,36601,5,NULL,NULL),
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
	(1324,36601,4,NULL,NULL),
	(1325,36601,3,NULL,NULL);

/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `current_project`, `description`, `availability`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',0,0,'','',87,'2014-11-12 07:57:31','2014-11-12 07:46:48','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-12 07:58:56'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',0,0,'','',12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-12 07:58:56'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',0,0,'','',30,'2014-11-12 07:57:37','2014-11-12 07:49:44','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-12 07:58:56'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',0,0,'','',5,'2014-11-11 22:46:51','2014-11-11 08:01:24','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-12 07:58:56'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',0,0,'','',13,'2014-11-12 07:42:36','2014-11-12 01:44:12','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-12 07:58:56'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',0,0,'','',15,'2014-11-12 03:52:57','2014-11-12 03:29:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-12 07:58:56'),
	(6,'petrovd','student','Delian','Petrov',0,'petrovd@uci.edu',0,0,'','',19,'2014-11-12 07:46:06','2014-11-12 05:35:17','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-12 07:58:56'),
	(7,'altschulerd','student','Dillon','Altschuler',0,'altschulerd@uci.edu',0,0,'','',1,'2014-11-12 07:45:29','2014-11-12 07:45:29','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:50:16','2014-11-12 07:56:44'),
	(8,'kaysp','student','Pearly','Kays',0,'kaysp@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(9,'hysmithv','student','Veda','Hysmith',0,'hysmithv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(10,'willitsf','student','Fanny','Willits',0,'willitsf@uci.edu',0,0,'','',1,'2014-11-12 05:38:18','2014-11-12 05:38:18','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(11,'koehlw','student','Wilburn','Koehl',0,'koehlw@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(12,'sherrowm','student','Myrl','Sherrow',0,'sherrowm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(13,'moffattt','student','Tasia','Moffatt',0,'moffattt@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(14,'palmern','student','Norris','Palmer',0,'palmern@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(15,'herlihyv','student','Vinita','Herlihy',0,'herlihyv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(16,'sipesj','student','Janyce','Sipes',0,'sipesj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(17,'hetzlers','student','Stefany','Hetzler',0,'hetzlers@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(18,'keilh','student','Hallie','Keil',0,'keilh@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(19,'treacyj','student','Joi','Treacy',0,'treacyj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:56:44'),
	(20,'dewaltg','student','Glenn','Dewalt',0,'dewaltg@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(21,'edmistons','student','Sharla','Edmiston',0,'edmistons@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(22,'torgersenf','student','Felicia','Torgersen',0,'torgersenf@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(23,'moritah','student','Harvey','Morita',0,'moritah@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(24,'kovacc','student','Corina','Kovac',0,'kovacc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(25,'cantrellee','student','Ermelinda','Cantrelle',0,'cantrellee@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(26,'sylvestm','student','May','Sylvest',0,'sylvestm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(27,'heinsc','student','Celestina','Heins',0,'heinsc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(28,'konecnym','student','Major','Konecny',0,'konecnym@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(29,'lindleym','student','Mallory','Lindley',0,'lindleym@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(30,'meyery','student','Yuette','Meyer',0,'meyery@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(31,'brundiges','student','Sade','Brundige',0,'brundiges@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(32,'shuek','student','Kemberly','Shue',0,'shuek@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(33,'comfortc','student','Carey','Comfort',0,'comfortc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(34,'bowsherr','student','Regena','Bowsher',0,'bowsherr@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(35,'oesterlings','student','Samual','Oesterling',0,'oesterlings@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(36,'sellarss','student','Star','Sellars',0,'sellarss@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(37,'loveridged','student','Doretta','Loveridge',0,'loveridged@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(38,'espiritun','student','Nickolas','Espiritu',0,'espiritun@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(39,'lambrechth','student','Heidy','Lambrecht',0,'lambrechth@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(40,'inoues','student','Stormy','Inoue',0,'inoues@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(41,'cockrellk','student','Kimber','Cockrell',0,'cockrellk@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(42,'jantzenk','student','Karyn','Jantzen',0,'jantzenk@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(43,'kohutc','student','Chu','Kohut',0,'kohutc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(44,'torress','student','Shari','Torres',0,'torress@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(45,'manseaud','student','Duane','Manseau',0,'manseaud@uci.edu',0,0,'','',1,'2014-11-12 07:44:29','2014-11-12 07:44:29','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(46,'canavand','student','Delana','Canavan',0,'canavand@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(47,'foardc','student','Charlie','Foard',0,'foardc@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(48,'khalsaj','student','Joni','Khalsa',0,'khalsaj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(49,'calkinsl','student','Leia','Calkins',0,'calkinsl@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(50,'youngquistd','student','Dominque','Youngquist',0,'youngquistd@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(51,'hammittd','student','Dirk','Hammitt',0,'hammittd@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(52,'brackenss','student','Sonya','Brackens',0,'brackenss@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(53,'sinclairk','student','Kathline','Sinclair',0,'sinclairk@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(54,'boths','student','Sabina','Both',0,'boths@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(55,'mosqueral','student','Lorriane','Mosquera',0,'mosqueral@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(56,'braunj','student','Jamal','Braun',0,'braunj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:55'),
	(57,'jessep','student','Phylis','Jesse',0,'jessep@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(58,'durenm','student','Marget','Duren',0,'durenm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(59,'goldsteins','student','Saturnina','Goldstein',0,'goldsteins@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(60,'briskij','student','Joselyn','Briski',0,'briskij@uci.edu',0,0,'','',1,'2014-11-12 07:20:44','2014-11-12 07:20:44','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(61,'ortegond','student','Diedre','Ortegon',0,'ortegond@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(62,'mclendond','student','Dawne','Mclendon',0,'mclendond@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(63,'hoya','student','Allen','Hoy',0,'hoya@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(64,'herringtons','student','Sima','Herrington',0,'herringtons@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(65,'pullinsn','student','Neva','Pullins',0,'pullinsn@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(66,'kovacm','student','Marian','Kovac',0,'kovacm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(67,'braswellm','student','Magdalen','Braswell',0,'braswellm@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(68,'caleym','student','Mario','Caley',0,'caleym@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(69,'mellv','student','Valeria','Mell',0,'mellv@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(70,'mccurdyw','student','Wally','Mccurdy',0,'mccurdyw@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56'),
	(71,'winesj','student','Jacob','Wines',0,'winesj@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-11 19:53:43','2014-11-12 07:58:56');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
