# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.37)
# Database: partner_up_development
# Generation Time: 2014-12-07 23:57:06 +0000
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
	(30001,'In4matx 151, Sec. A, Lecture','OLSON','2014-12-02 22:31:11','2014-12-02 22:31:11'),
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
	(36611,'I&CS 32, Lab 11, Lab','KAY, D.','2014-12-07 23:10:41','2014-12-07 23:10:41'),
	(36612,'Information & Comp Sci 31: Lab 12','',NULL,NULL),
	(36619,'Information & Comp Sci 32: Lab 1','',NULL,NULL),
	(36621,'Information & Comp Sci 32: Lab 2','',NULL,NULL),
	(36622,'Information & Comp Sci 32: Lab 3','',NULL,NULL),
	(36623,'Information & Comp Sci 32: Lab 4','',NULL,NULL),
	(36626,'Information & Comp Sci 32: Lab 7','',NULL,NULL),
	(36681,'Information & Comp Sci 45J: Lab 1','',NULL,NULL),
	(36682,'Information & Comp Sci 45J: Lab 2','',NULL,NULL),
	(36683,'Information & Comp Sci 45J: Lab 3','',NULL,NULL),
	(36684,'I&CS 45J, Lab 5','JACOBSON','2014-12-07 07:05:55','2014-12-07 18:14:03'),
	(37200,'In4matx 191A, Sec. A, Lecture','ZIV DER HOEK','2014-12-03 00:22:15','2014-12-03 00:22:15');

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table evaluations
# ------------------------------------------------------------



# Dump of table group_relations
# ------------------------------------------------------------

LOCK TABLES `group_relations` WRITE;
/*!40000 ALTER TABLE `group_relations` DISABLE KEYS */;

INSERT INTO `group_relations` (`id`, `group_id`, `user_id`, `project_id`, `course_id`, `accepted_at`, `status`)
VALUES
	(1,1,0,32,30001,NULL,2),
	(2,1,181,32,30001,NULL,1);

/*!40000 ALTER TABLE `group_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `limit`, `allow_repeat`, `project_id`, `course_id`, `created_at`, `updated_at`)
VALUES
	(1,'Christina and Sabina',NULL,NULL,32,30001,'2014-12-07 23:49:14','2014-12-07 23:49:14');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_relations
# ------------------------------------------------------------

LOCK TABLES `project_relations` WRITE;
/*!40000 ALTER TABLE `project_relations` DISABLE KEYS */;

INSERT INTO `project_relations` (`id`, `project_id`, `course_id`)
VALUES
	(5,5,36601),
	(6,6,36601),
	(7,7,36601),
	(8,10,36601),
	(9,18,36601),
	(26,20,30001),
	(31,26,36601),
	(37,32,30001),
	(44,37,36601),
	(51,41,37200),
	(53,40,36684),
	(58,45,36611),
	(59,9,36624),
	(60,30,30000);

/*!40000 ALTER TABLE `project_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `course_id`, `allow_repeat`, `name_gen`, `active`, `group_size`, `autogroup`, `evaluation_id`, `end_date`)
VALUES
	(0,NULL,0,0,0,1,2,0,NULL,NULL),
	(5,'Linked Lists',36601,1,0,1,2,0,NULL,NULL),
	(6,'Buckets',36601,0,2,1,2,0,NULL,NULL),
	(7,'Smiley Faces',36601,1,0,1,2,0,NULL,NULL),
	(8,'Requirements Elicitation',36624,1,1,1,5,0,NULL,NULL),
	(9,'Lemon Party',36624,1,3,1,3,0,NULL,NULL),
	(10,'Chicken Nuggets',36601,0,1,1,2,0,NULL,NULL),
	(18,'Social Table',37050,0,2,1,3,0,NULL,NULL),
	(20,'In4matx 151  Sec. A - New Project',30001,1,0,1,2,0,NULL,NULL),
	(26,'Credit Card Validation',36601,0,0,1,2,0,NULL,NULL),
	(30,'In4matx 141  Sec. A - New Project',30000,0,0,1,2,0,NULL,NULL),
	(32,'Pygame',30001,1,0,1,2,0,NULL,NULL),
	(37,'Traffic Signal Simulator',36601,1,0,1,4,0,NULL,NULL),
	(40,'WWEEWEW',36684,1,0,1,3,0,NULL,NULL),
	(41,'In4matx 191A  Sec. A - New Project',37200,0,0,1,3,0,NULL,NULL),
	(45,'I&CS 32  Lab 11 - New Project',36611,0,0,1,3,0,NULL,NULL);

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rosters
# ------------------------------------------------------------

LOCK TABLES `rosters` WRITE;
/*!40000 ALTER TABLE `rosters` DISABLE KEYS */;

INSERT INTO `rosters` (`id`, `course_id`, `user_id`)
VALUES
	(1,36601,0),
	(2,36601,1),
	(3,36601,2),
	(4,36601,3),
	(5,36601,6),
	(1447,30001,2),
	(1448,30001,147),
	(1449,30001,148),
	(1450,30001,149),
	(1451,30001,150),
	(1452,30001,151),
	(1453,30001,152),
	(1454,30001,153),
	(1455,30001,154),
	(1456,30001,155),
	(1457,30001,156),
	(1458,30001,157),
	(1459,30001,158),
	(1460,30001,159),
	(1461,30001,160),
	(1462,30001,161),
	(1463,30001,162),
	(1464,30001,163),
	(1465,30001,164),
	(1466,30001,165),
	(1467,30001,166),
	(1468,30001,167),
	(1469,30001,168),
	(1470,30001,169),
	(1471,30001,170),
	(1472,30001,171),
	(1473,30001,172),
	(1474,30001,173),
	(1475,30001,174),
	(1476,30001,175),
	(1477,30001,176),
	(1478,30001,177),
	(1479,30001,178),
	(1480,30001,179),
	(1481,30001,180),
	(1482,30001,181),
	(1483,30001,182),
	(1484,30001,183),
	(1485,30001,184),
	(1486,30001,185),
	(1487,30001,186),
	(1488,30001,187),
	(1489,30001,188),
	(1490,30001,189),
	(1491,30001,190),
	(1492,30001,191),
	(1493,30001,192),
	(1494,30001,193),
	(1495,30001,194),
	(1496,30001,195),
	(1497,30001,196),
	(1498,30001,197),
	(1499,30001,198),
	(1500,30001,0),
	(1501,30001,4),
	(1502,30001,5),
	(1503,30001,199),
	(1504,30001,1),
	(2029,37200,2),
	(2030,37200,184),
	(2031,37200,185),
	(2032,37200,186),
	(2033,37200,187),
	(2034,37200,188),
	(2035,37200,189),
	(2036,37200,190),
	(2037,37200,191),
	(2038,37200,192),
	(2039,37200,193),
	(2040,37200,194),
	(2041,37200,195),
	(2042,37200,196),
	(2043,37200,288),
	(2044,37200,289),
	(2045,37200,0),
	(2046,37200,4),
	(2047,37200,5),
	(2048,37200,290),
	(2049,37200,1),
	(2101,37200,342),
	(2102,37200,343),
	(2103,37200,344),
	(2104,37200,345),
	(2105,37200,346),
	(2106,37200,347),
	(2107,37200,348),
	(2108,37200,349),
	(2109,37200,350),
	(2110,37200,351),
	(2111,37200,352),
	(2112,37200,353),
	(2113,37200,354),
	(2114,37200,147),
	(2115,37200,148),
	(2116,37200,149),
	(2117,37200,150),
	(2118,37200,151),
	(2119,37200,152),
	(2120,37200,153),
	(2121,37200,154),
	(2122,37200,155),
	(2123,37200,156),
	(2124,37200,157),
	(2125,37200,158),
	(2126,37200,159),
	(2127,37200,160),
	(2128,37200,161),
	(2129,37200,162),
	(2130,37200,163),
	(2131,37200,164),
	(2132,37200,165),
	(2133,37200,166),
	(2134,37200,167),
	(2135,37200,168),
	(2136,37200,169),
	(2137,37200,170),
	(2138,37200,171),
	(2139,37200,172),
	(2140,37200,173),
	(2141,37200,174),
	(2142,37200,175),
	(2143,37200,176),
	(2144,37200,177),
	(2145,37200,178),
	(2146,37200,179),
	(2147,37200,180),
	(2148,37200,181),
	(2149,37200,182),
	(2150,37200,183),
	(2151,37200,3),
	(2318,36684,2),
	(2319,36684,147),
	(2320,36684,148),
	(2321,36684,149),
	(2322,36684,150),
	(2323,36684,151),
	(2324,36684,152),
	(2325,36684,153),
	(2326,36684,154),
	(2327,36684,155),
	(2328,36684,156),
	(2329,36684,157),
	(2330,36684,158),
	(2331,36684,159),
	(2332,36684,160),
	(2333,36684,161),
	(2334,36684,162),
	(2335,36684,163),
	(2336,36684,164),
	(2337,36684,165),
	(2338,36684,166),
	(2339,36684,167),
	(2340,36684,168),
	(2341,36684,169),
	(2342,36684,170),
	(2343,36684,171),
	(2344,36684,172),
	(2345,36684,173),
	(2346,36684,174),
	(2347,36684,175),
	(2348,36684,176),
	(2349,36684,177),
	(2350,36684,178),
	(2351,36684,179),
	(2352,36684,180),
	(2353,36684,181),
	(2354,36684,182),
	(2355,36684,183),
	(2356,36684,184),
	(2357,36684,185),
	(2358,36684,186),
	(2359,36684,187),
	(2360,36684,188),
	(2361,36684,189),
	(2362,36684,190),
	(2363,36684,191),
	(2364,36684,192),
	(2365,36684,193),
	(2366,36684,194),
	(2367,36684,195),
	(2368,36684,196),
	(2369,36684,288),
	(2370,36684,289),
	(2371,36684,0),
	(2372,36684,4),
	(2373,36684,5),
	(2374,36684,290),
	(2375,36684,1),
	(2608,36611,2),
	(2609,36611,147),
	(2610,36611,148),
	(2611,36611,149),
	(2612,36611,150),
	(2613,36611,151),
	(2614,36611,152),
	(2615,36611,153),
	(2616,36611,154),
	(2617,36611,155),
	(2618,36611,156),
	(2619,36611,157),
	(2620,36611,158),
	(2621,36611,159),
	(2622,36611,160),
	(2623,36611,161),
	(2624,36611,162),
	(2625,36611,163),
	(2626,36611,164),
	(2627,36611,165),
	(2628,36611,166),
	(2629,36611,167),
	(2630,36611,168),
	(2631,36611,169),
	(2632,36611,170),
	(2633,36611,171),
	(2634,36611,172),
	(2635,36611,173),
	(2636,36611,174),
	(2637,36611,175),
	(2638,36611,176),
	(2639,36611,177),
	(2640,36611,178),
	(2641,36611,179),
	(2642,36611,180),
	(2643,36611,181),
	(2644,36611,182),
	(2645,36611,183),
	(2646,36611,184),
	(2647,36611,185),
	(2648,36611,186),
	(2649,36611,187),
	(2650,36611,188),
	(2651,36611,189),
	(2652,36611,190),
	(2653,36611,191),
	(2654,36611,192),
	(2655,36611,193),
	(2656,36611,194),
	(2657,36611,195),
	(2658,36611,196),
	(2659,36611,288),
	(2660,36611,289),
	(2661,36611,0),
	(2662,36611,4),
	(2663,36611,5),
	(2664,36611,290),
	(2665,36611,1);

/*!40000 ALTER TABLE `rosters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ucinetid`, `uci_affiliations`, `first_name`, `last_name`, `role`, `email`, `current_course`, `current_project`, `description`, `availability`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `age_in_seconds`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `created_at`, `updated_at`)
VALUES
	(0,'ryderc','student','Christina','Ryder',0,'ryderc@uci.edu',30001,32,'','Tuesdays after 5pm',122,'2014-12-07 23:48:14','2014-12-07 23:32:16','127.0.0.1','127.0.0.1',NULL,'1.jpg','image/jpeg',35914,'2014-11-18 06:57:42',NULL,'2014-12-07 23:49:21'),
	(1,'msilberm','student, staff','Michael','Silberman',1,'msilberm@uci.edu',36611,45,'','',12,'2014-10-23 00:30:09','2014-10-22 23:55:41','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-07 23:10:42'),
	(2,'kay','staff,faculty,employee','David G','Kay',2,'kay@uci.edu',36611,45,'PAIR PROMRAGING!!!!','',60,'2014-12-07 23:53:06','2014-12-07 23:47:40','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-07 23:53:06'),
	(3,'ziv','student,staff,faculty,employee','Hadar','Ziv',3,'ziv@uci.edu',37200,41,'','',9,'2014-12-07 23:04:29','2014-12-02 22:44:42','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-07 23:04:29'),
	(4,'imcnicol','student','Ian','Mcnicol',0,'imcnicol@uci.edu',36611,45,'','',10,'2014-11-06 21:19:03','2014-11-06 20:37:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-07 23:10:42'),
	(5,'vdhingrej','student','Vinayak','Dhingreja',0,'vdhingrej@uci.edu',36611,45,'','',19,'2014-12-07 23:24:15','2014-11-22 23:21:50','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-07 23:24:15'),
	(147,'dewaltg','student','Glenn','Dewalt',0,'dewaltg@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(148,'edmistons','student','Sharla','Edmiston',0,'edmistons@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(149,'torgersenf','student','Felicia','Torgersen',0,'torgersenf@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(150,'moritah','student','Harvey','Morita',0,'moritah@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(151,'kovacc','student','Corina','Kovac',0,'kovacc@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(152,'cantrellee','student','Ermelinda','Cantrelle',0,'cantrellee@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(153,'sylvestm','student','May','Sylvest',0,'sylvestm@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(154,'heinsc','student','Celestina','Heins',0,'heinsc@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(155,'konecnym','student','Major','Konecny',0,'konecnym@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(156,'lindleym','student','Mallory','Lindley',0,'lindleym@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(157,'meyery','student','Yuette','Meyer',0,'meyery@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(158,'brundiges','student','Sade','Brundige',0,'brundiges@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(159,'shuek','student','Kemberly','Shue',0,'shuek@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(160,'comfortc','student','Carey','Comfort',0,'comfortc@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(161,'bowsherr','student','Regena','Bowsher',0,'bowsherr@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(162,'oesterlings','student','Samual','Oesterling',0,'oesterlings@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(163,'sellarss','student','Star','Sellars',0,'sellarss@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(164,'loveridged','student','Doretta','Loveridge',0,'loveridged@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(165,'espiritun','student','Nickolas','Espiritu',0,'espiritun@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(166,'lambrechth','student','Heidy','Lambrecht',0,'lambrechth@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(167,'inoues','student','Stormy','Inoue',0,'inoues@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(168,'cockrellk','student','Kimber','Cockrell',0,'cockrellk@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(169,'jantzenk','student','Karyn','Jantzen',0,'jantzenk@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(170,'kohutc','student','Chu','Kohut',0,'kohutc@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(171,'torress','student','Shari','Torres',0,'torress@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(172,'manseaud','student','Duane','Manseau',0,'manseaud@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(173,'canavand','student','Delana','Canavan',0,'canavand@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(174,'foardc','student','Charlie','Foard',0,'foardc@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(175,'khalsaj','student','Joni','Khalsa',0,'khalsaj@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(176,'calkinsl','student','Leia','Calkins',0,'calkinsl@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(177,'youngquistd','student','Dominque','Youngquist',0,'youngquistd@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(178,'hammittd','student','Dirk','Hammitt',0,'hammittd@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(179,'brackenss','student','Sonya','Brackens',0,'brackenss@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(180,'sinclairk','student','Kathline','Sinclair',0,'sinclairk@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(181,'boths','student','Sabina','Both',0,'boths@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(182,'mosqueral','student','Lorriane','Mosquera',0,'mosqueral@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:34','2014-12-07 23:10:41'),
	(183,'braunj','student','Jamal','Braun',0,'braunj@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(184,'jessep','student','Phylis','Jesse',0,'jessep@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(185,'durenm','student','Marget','Duren',0,'durenm@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(186,'goldsteins','student','Saturnina','Goldstein',0,'goldsteins@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(187,'briskij','student','Joselyn','Briski',0,'briskij@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(188,'ortegond','student','Diedre','Ortegon',0,'ortegond@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(189,'mclendond','student','Dawne','Mclendon',0,'mclendond@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(190,'hoya','student','Allen','Hoy',0,'hoya@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:41'),
	(191,'herringtons','student','Sima','Herrington',0,'herringtons@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:42'),
	(192,'pullinsn','student','Neva','Pullins',0,'pullinsn@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:42'),
	(193,'kovacm','student','Marian','Kovac',0,'kovacm@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:42'),
	(194,'braswellm','student','Magdalen','Braswell',0,'braswellm@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:42'),
	(195,'caleym','student','Mario','Caley',0,'caleym@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:42'),
	(196,'mellv','student','Valeria','Mell',0,'mellv@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:30:35','2014-12-07 23:10:42'),
	(209,'psalas','student','Salas','Priscilla',0,'psalas@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(210,'lschmidt','student','Schmidt','Larissa',0,'lschmidt@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(211,'efuentes','student','Fuentes','Ebony',0,'efuentes@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(212,'khart','student','Hart','Kylan',0,'khart@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(213,'hdorsey','student','Dorsey','Hayfa',0,'hdorsey@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(214,'wmoss','student','Moss','Wesley',0,'wmoss@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(215,'jdoyle','student','Doyle','Jarrod',0,'jdoyle@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(216,'akelley','student','Kelley','Aspen',0,'akelley@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(217,'nmcguire','student','Mcguire','Nehru',0,'nmcguire@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(218,'mmosley','student','Mosley','May',0,'mmosley@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(219,'avaldez','student','Valdez','Autumn',0,'avaldez@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:19','2014-12-02 22:52:29'),
	(220,'hroach','student','Roach','Hilel',0,'hroach@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(221,'oanthony','student','Anthony','Oscar',0,'oanthony@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(222,'droach','student','Roach','Demetria',0,'droach@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(223,'lvazquez','student','Vazquez','Lillith',0,'lvazquez@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(224,'ustuart','student','Stuart','Ursa',0,'ustuart@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(225,'omack','student','Mack','Octavius',0,'omack@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(226,'kfernandez','student','Fernandez','Kuame',0,'kfernandez@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(227,'nalford','student','Alford','Nell',0,'nalford@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(228,'mnielsen','student','Nielsen','Mari',0,'mnielsen@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(229,'abrewer','student','Brewer','Armando',0,'abrewer@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(230,'srowe','student','Rowe','Shelby',0,'srowe@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(231,'sdean','student','Dean','Sybill',0,'sdean@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(232,'xjacobs','student','Jacobs','Xaviera',0,'xjacobs@uci.edu',0,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-02 22:33:20','2014-12-02 22:52:29'),
	(288,'mccurdyw','student','Wally','Mccurdy',0,'mccurdyw@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-07 23:10:42'),
	(289,'winesj','student','Jacob','Wines',0,'winesj@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-07 23:10:42'),
	(290,'petrovd','student','Petrov','Delian',0,'petrovd@uci.edu',36611,45,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-07 23:10:42'),
	(291,'cmurray','student','Murray','Cailin',0,'cmurray@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(292,'ckirk','student','Kirk','Camille',0,'ckirk@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(293,'cgaines','student','Gaines','Candice',0,'cgaines@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(294,'btyler','student','Tyler','Blair',0,'btyler@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(295,'astuart','student','Stuart','Amy',0,'astuart@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(296,'croberson','student','Roberson','Camilla',0,'croberson@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(297,'cjimenez','student','Jimenez','Charde',0,'cjimenez@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(298,'jcobb','student','Cobb','Jada',0,'jcobb@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(299,'dduke','student','Duke','Dillon',0,'dduke@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(300,'ustephens','student','Stephens','Uriah',0,'ustephens@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(301,'cmooney','student','Mooney','Cara',0,'cmooney@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(302,'kwilkins','student','Wilkins','Kennan',0,'kwilkins@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(303,'oalbert','student','Albert','Orli',0,'oalbert@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(304,'dnorris','student','Norris','Desirae',0,'dnorris@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(305,'gwilson','student','Wilson','Gay',0,'gwilson@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(306,'clott','student','Lott','Chase',0,'clott@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(307,'dtran','student','Tran','Dalton',0,'dtran@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(308,'bherman','student','Herman','Bo',0,'bherman@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(309,'rgreer','student','Greer','Regina',0,'rgreer@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(310,'cwagner','student','Wagner','Clementine',0,'cwagner@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(311,'nvaldez','student','Valdez','Nash',0,'nvaldez@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(312,'iglass','student','Glass','Ignacia',0,'iglass@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(313,'mgarza','student','Garza','Morgan',0,'mgarza@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(314,'ccraig','student','Craig','Carol',0,'ccraig@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:15'),
	(315,'vkoch','student','Koch','Vaughan',0,'vkoch@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:15','2014-12-03 00:22:16'),
	(316,'lgates','student','Gates','Lynn',0,'lgates@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(317,'srasmussen','student','Rasmussen','Susan',0,'srasmussen@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(318,'hcrawford','student','Crawford','Hunter',0,'hcrawford@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(319,'wphillips','student','Phillips','Wallace',0,'wphillips@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(320,'aglover','student','Glover','Audra',0,'aglover@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(321,'jwilliam','student','William','Jack',0,'jwilliam@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(322,'latkinson','student','Atkinson','Lani',0,'latkinson@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(323,'klynch','student','Lynch','Karina',0,'klynch@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(324,'jspencer','student','Spencer','Jakeem',0,'jspencer@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(325,'jgriffith','student','Griffith','Joel',0,'jgriffith@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(326,'cbonner','student','Bonner','Constance',0,'cbonner@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(327,'scaldwell','student','Caldwell','Stone',0,'scaldwell@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(328,'ztillman','student','Tillman','Zeus',0,'ztillman@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(329,'rmcintosh','student','Mcintosh','Renee',0,'rmcintosh@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(330,'kestrada','student','Estrada','Kieran',0,'kestrada@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(331,'zphelps','student','Phelps','Zoe',0,'zphelps@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(332,'imccarty','student','Mccarty','Ignatius',0,'imccarty@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(333,'bcarr','student','Carr','Bert',0,'bcarr@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(334,'rle','student','Le','Roary',0,'rle@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(335,'amullen','student','Mullen','Akeem',0,'amullen@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(336,'jbass','student','Bass','Joseph',0,'jbass@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(337,'fsuarez','student','Suarez','Fatima',0,'fsuarez@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(338,'cwelch','student','Welch','Clinton',0,'cwelch@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(339,'mmorse','student','Morse','Mariam',0,'mmorse@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(340,'kray','student','Ray','Kennedy',0,'kray@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(341,'tgilbert','student','Gilbert','Trevor',0,'tgilbert@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:16','2014-12-03 00:22:16'),
	(342,'altschulerd','student','Dillon','Altschuler',0,'altschulerd@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(343,'kaysp','student','Pearly','Kays',0,'kaysp@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(344,'hysmithv','student','Veda','Hysmith',0,'hysmithv@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(345,'willitsf','student','Fanny','Willits',0,'willitsf@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(346,'koehlw','student','Wilburn','Koehl',0,'koehlw@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(347,'sherrowm','student','Myrl','Sherrow',0,'sherrowm@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(348,'moffattt','student','Tasia','Moffatt',0,'moffattt@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(349,'palmern','student','Norris','Palmer',0,'palmern@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(350,'herlihyv','student','Vinita','Herlihy',0,'herlihyv@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(351,'sipesj','student','Janyce','Sipes',0,'sipesj@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(352,'hetzlers','student','Stefany','Hetzler',0,'hetzlers@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(353,'keilh','student','Hallie','Keil',0,'keilh@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48'),
	(354,'treacyj','student','Joi','Treacy',0,'treacyj@uci.edu',37200,41,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 00:22:48','2014-12-03 00:22:48');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
