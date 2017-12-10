-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: d3-operator
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chanel_comunication` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'linh',NULL,NULL,NULL,'2017-12-09 03:37:56','2017-12-09 03:37:56',NULL),(2,'Rin',NULL,NULL,NULL,'2017-12-09 03:38:00','2017-12-09 03:38:00',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_12_08_231327_create_projects_table',2),(4,'2017_12_08_232028_create_customers_table',2),(5,'2017_12_08_232155_create_timesheets_table',3),(6,'2017_12_08_232251_create_project_member_table',3),(7,'2017_12_10_164302_add_name_projects_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_member`
--

DROP TABLE IF EXISTS `project_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_member`
--

LOCK TABLES `project_member` WRITE;
/*!40000 ALTER TABLE `project_member` DISABLE KEYS */;
INSERT INTO `project_member` VALUES (1,4,1,'2017-12-09 03:43:36','2017-12-09 03:43:36',NULL),(2,7,1,'2017-12-09 03:45:13','2017-12-09 03:45:13',NULL),(3,8,1,'2017-12-09 03:45:18','2017-12-09 03:45:18',NULL),(4,5,2,'2017-12-09 03:45:24','2017-12-09 03:45:24',NULL),(5,9,2,'2017-12-09 03:45:29','2017-12-09 03:45:29',NULL),(6,10,2,'2017-12-09 03:45:33','2017-12-09 03:45:33',NULL),(7,1,4,'2017-12-10 10:20:54','2017-12-10 10:20:54',NULL),(8,2,4,'2017-12-10 10:20:54','2017-12-10 10:20:54',NULL);
/*!40000 ALTER TABLE `project_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  `specification` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `valid_state` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'p111',4,1,NULL,NULL,NULL,NULL,1,'2017-12-09 03:36:51','2017-12-10 10:00:13',NULL),(2,'p2',5,2,NULL,NULL,NULL,NULL,1,'2017-12-09 03:37:07','2017-12-09 03:37:07',NULL),(3,'p3',2,1,NULL,NULL,NULL,NULL,1,'2017-12-10 09:41:35','2017-12-10 09:41:35',NULL),(4,'p4',2,2,NULL,NULL,NULL,NULL,1,'2017-12-10 10:20:54','2017-12-10 10:20:54',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_OT` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL,
  `staff_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `valid_state` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@mail.com','$2y$10$s7o1RHWxvYMyT6TwilviW.OQuwhJ645egidWWYGSEQF9n3I5eA8Em',0,NULL,NULL,NULL,NULL,NULL,NULL,0,'FyLZIA9shZfMrB4zw0woyxbQoAcPeosK4jNdV9AODnjqa5dPJ7rnNqDEue2E','2017-12-09 03:12:19','2017-12-09 03:14:59',NULL),(2,'pm','pm@mail.com','$2y$10$OV3Av5LEoylG.mwaTJhX8u7OQjnJm36Jc40pNr37VdnqAXEKRLptO',1,NULL,NULL,NULL,NULL,NULL,NULL,0,'WkDaQ6yc20BBBduErMJUx63zkehyYWqETgiu36ZK5tCyCqb0ssUUdsZLt9br','2017-12-09 03:20:33','2017-12-09 03:20:33',NULL),(3,'member','member@mail.com','$2y$10$vlo/lQpNzm0Itm12kTPCc.Lx9Jq7w0IsucNFCCmT9VybM9zd1xFdO',2,NULL,NULL,NULL,NULL,NULL,NULL,0,'TimkNxkctAeGfnysLnqkCP5poWQW0aNolvxj82OS1Dbav5mLAiENXj3exC6V','2017-12-09 03:20:50','2017-12-09 03:20:50',NULL),(4,'pm1','pm1@mail.com','$2y$10$cKaBYArUhbQme9ePPo.Eu.9abbZV898c87agv9chxSloKz0C5F4si',1,NULL,NULL,NULL,NULL,NULL,NULL,0,'YbOpKBypx3o2ZBXanwk9iTTTDE7QUar5OPLMYNeZL1Ia0P2rqNBCctwYLAGC','2017-12-09 03:24:33','2017-12-09 03:24:33',NULL),(5,'pm2','pm2@mail.com','$2y$10$NuCUFv0mawQi0IdDQwSQtezBKs7h9PdU.cT7PEON6V3EihSdkKBTi',1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:24:41','2017-12-09 03:24:41',NULL),(6,'pm3','pm3@mail.com','$2y$10$sWoVxbiUs4sJWz/1N3/EwOucxYWcuyKEoRpoxWSgbWv.CVdIKP6Ie',1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:24:49','2017-12-09 03:24:49',NULL),(7,'member1','member1@mail.com','$2y$10$JZa5HevQ.eo42IrbuFtnzu/YLiDej4rMQGBLT39hZBDFhKpCQGaA2',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:01','2017-12-09 03:25:01',NULL),(8,'member2','member2@mail.com','$2y$10$z1GHqV/mOsz609eKqnP7hu.AFgNiRCotiyhMHjaCjJN8Gx5bJ2LZ6',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:08','2017-12-09 03:25:08',NULL),(9,'member3','member3@mail.com','$2y$10$x6K8fu3fX7gpAlbzxF9GrebInc2QT6yaRrFeMrD3yjCA4f7/DROWW',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:16','2017-12-09 03:25:16',NULL),(10,'member4','member4@mail.com','$2y$10$lEKwhzW6WchPpZx9vuhX8.xPus2ybMbRLJSScnWFOEmpb5g3wnXb6',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:24','2017-12-09 03:25:24',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11  0:28:35
