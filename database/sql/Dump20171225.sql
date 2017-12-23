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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_12_08_231327_create_projects_table',2),(4,'2017_12_08_232028_create_customers_table',2),(5,'2017_12_08_232155_create_timesheets_table',3),(6,'2017_12_08_232251_create_project_member_table',3),(7,'2017_12_10_164302_add_name_projects_table',4),(8,'2017_12_15_202415_add_user_id_timesheet_table',5),(9,'2017_12_16_042349_create_task_table',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_member`
--

LOCK TABLES `project_member` WRITE;
/*!40000 ALTER TABLE `project_member` DISABLE KEYS */;
INSERT INTO `project_member` VALUES (1,4,1,'2017-12-09 03:43:36','2017-12-09 03:43:36',NULL),(2,7,1,'2017-12-09 03:45:13','2017-12-09 03:45:13',NULL),(3,8,1,'2017-12-09 03:45:18','2017-12-09 03:45:18',NULL),(4,5,2,'2017-12-09 03:45:24','2017-12-09 03:45:24',NULL),(5,9,2,'2017-12-09 03:45:29','2017-12-09 03:45:29',NULL),(6,10,2,'2017-12-09 03:45:33','2017-12-09 03:45:33',NULL),(7,1,4,'2017-12-10 10:20:54','2017-12-10 10:20:54',NULL),(8,2,4,'2017-12-10 10:20:54','2017-12-10 10:20:54',NULL),(9,7,5,'2017-12-11 10:59:37','2017-12-11 10:59:37',NULL),(10,9,5,'2017-12-11 10:59:37','2017-12-11 10:59:37',NULL),(11,10,5,'2017-12-11 10:59:37','2017-12-11 10:59:37',NULL),(12,5,6,'2017-12-15 09:21:17','2017-12-15 09:21:17',NULL),(13,6,6,'2017-12-15 09:21:17','2017-12-15 09:21:17',NULL),(14,9,6,'2017-12-15 09:21:17','2017-12-15 09:21:17',NULL),(15,10,6,'2017-12-15 09:21:17','2017-12-15 09:21:17',NULL),(16,2,7,'2017-12-23 17:22:17','2017-12-23 17:22:17',NULL),(17,3,7,'2017-12-23 17:22:17','2017-12-23 17:22:17',NULL),(18,6,7,'2017-12-23 17:22:17','2017-12-23 17:22:17',NULL),(19,7,7,'2017-12-23 17:22:17','2017-12-23 17:22:17',NULL),(20,10,7,'2017-12-23 17:22:17','2017-12-23 17:22:17',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'p111',4,1,NULL,NULL,NULL,NULL,1,'2017-12-09 03:36:51','2017-12-10 10:00:13',NULL),(2,'p2',5,2,NULL,NULL,NULL,NULL,1,'2017-12-09 03:37:07','2017-12-09 03:37:07',NULL),(3,'p3',2,1,NULL,NULL,NULL,NULL,1,'2017-12-10 09:41:35','2017-12-10 09:41:35',NULL),(4,'p4',2,2,NULL,NULL,NULL,NULL,1,'2017-12-10 10:20:54','2017-12-10 10:20:54',NULL),(5,'pr4',2,1,NULL,NULL,NULL,NULL,1,'2017-12-11 10:59:37','2017-12-11 10:59:37',NULL),(6,'aaaaa',5,1,NULL,NULL,NULL,NULL,1,'2017-12-15 09:21:17','2017-12-15 09:21:17',NULL),(7,'project 8',2,1,'2017-12-27 17:00:00','2018-01-02 17:00:00','ahihi','do ngok',1,'2017-12-23 17:22:17','2017-12-23 17:22:17',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timesheet_id` int(11) NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'1',1,'2017-12-15 21:47:11','2017-12-15 21:47:11',NULL),(2,2,'1',1,'2017-12-15 23:06:10','2017-12-15 23:06:10',NULL),(3,3,'1',1,'2017-12-15 23:06:10','2017-12-15 23:06:10',NULL),(4,4,'task 1',1,'2017-12-17 16:31:41','2017-12-17 16:31:41',NULL),(5,4,'task 2',3,'2017-12-17 16:31:41','2017-12-17 16:31:41',NULL),(6,4,'task 3',4,'2017-12-17 16:31:41','2017-12-17 16:31:41',NULL),(7,5,'d1',1,'2017-12-17 17:36:48','2017-12-17 17:36:48',NULL),(8,5,'d2',2,'2017-12-17 17:36:48','2017-12-17 17:36:48',NULL),(9,6,'d12',1,'2017-12-17 17:37:51','2017-12-17 17:37:51',NULL),(10,6,'d22',2,'2017-12-17 17:37:51','2017-12-17 17:37:51',NULL),(11,7,'d11',2,'2017-12-17 17:37:51','2017-12-17 17:37:51',NULL),(12,7,'d22',1,'2017-12-17 17:37:52','2017-12-17 17:37:52',NULL),(13,237,'ahihi1',2,'2017-12-23 17:31:28','2017-12-23 17:31:28',NULL),(14,237,'ahihi2',2,'2017-12-23 17:31:28','2017-12-23 17:31:28',NULL),(15,237,'ahihi3',4,'2017-12-23 17:31:28','2017-12-23 17:31:28',NULL),(16,238,'qqqqqqqq',12,'2017-12-23 18:49:17','2017-12-23 18:49:17',NULL),(17,239,'qqqqqqqq',12,'2017-12-23 18:51:44','2017-12-23 18:51:44',NULL),(18,240,'qqqqqqqq',12,'2017-12-23 18:51:45','2017-12-23 18:51:45',NULL),(19,241,'3123',313,'2017-12-23 18:53:09','2017-12-23 18:53:09',NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_OT` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,2,'member1',1,'content',8,0,'2017-12-01 18:11:58',NULL,NULL),(2,2,'member1',1,'content',9,0,'2017-12-02 18:11:58',NULL,NULL),(3,2,'member1',1,'content',10,0,'2017-12-03 18:11:58',NULL,NULL),(4,2,'member1',1,'content',8,0,'2017-12-04 18:11:58',NULL,NULL),(5,2,'member1',1,'content',9,0,'2017-12-05 18:11:58',NULL,NULL),(6,2,'member1',1,'content',9,0,'2017-12-06 18:11:58',NULL,NULL),(7,2,'member1',1,'content',10,0,'2017-12-07 18:11:58',NULL,NULL),(8,2,'member1',1,'content',10,0,'2017-12-08 18:11:58',NULL,NULL),(9,2,'member1',1,'content',10,0,'2017-12-09 18:11:58',NULL,NULL),(10,2,'member1',1,'content',10,0,'2017-12-10 18:11:58',NULL,NULL),(11,2,'member1',1,'content',8,0,'2017-12-11 18:11:58',NULL,NULL),(12,2,'member1',1,'content',9,0,'2017-12-12 18:11:58',NULL,NULL),(13,2,'member1',1,'content',9,0,'2017-12-13 18:11:58',NULL,NULL),(14,2,'member1',1,'content',10,0,'2017-12-14 18:11:58',NULL,NULL),(15,2,'member1',1,'content',9,0,'2017-12-15 18:11:58',NULL,NULL),(16,2,'member1',1,'content',10,0,'2017-12-16 18:11:58',NULL,NULL),(17,2,'member1',1,'content',9,0,'2017-12-17 18:11:58',NULL,NULL),(18,2,'member1',1,'content',9,0,'2017-12-18 18:11:58',NULL,NULL),(19,2,'member1',1,'content',10,0,'2017-12-19 18:11:58',NULL,NULL),(20,2,'member1',1,'content',9,0,'2017-12-20 18:11:58',NULL,NULL),(21,2,'member1',1,'content',9,0,'2017-12-21 18:11:58',NULL,NULL),(22,2,'member1',1,'content',10,0,'2017-12-22 18:11:58',NULL,NULL),(23,2,'member1',1,'content',9,0,'2017-12-23 18:11:58',NULL,NULL),(24,2,'member1',1,'content',8,0,'2017-12-24 18:11:58',NULL,NULL),(25,2,'member1',1,'content',8,0,'2017-12-25 18:11:58',NULL,NULL),(26,2,'member1',1,'content',9,0,'2017-12-26 18:11:58',NULL,NULL),(27,2,'member1',1,'content',10,0,'2017-12-27 18:11:58',NULL,NULL),(28,2,'member1',1,'content',8,0,'2017-12-28 18:11:58',NULL,NULL),(29,2,'member1',1,'content',9,0,'2017-12-29 18:11:58',NULL,NULL),(30,3,'member1',1,'content',8,0,'2017-12-01 18:11:58',NULL,NULL),(31,3,'member1',1,'content',9,0,'2017-12-02 18:11:58',NULL,NULL),(32,3,'member1',1,'content',9,0,'2017-12-03 18:11:58',NULL,NULL),(33,3,'member1',1,'content',10,0,'2017-12-04 18:11:58',NULL,NULL),(34,3,'member1',1,'content',8,0,'2017-12-05 18:11:58',NULL,NULL),(35,3,'member1',1,'content',10,0,'2017-12-06 18:11:58',NULL,NULL),(36,3,'member1',1,'content',8,0,'2017-12-07 18:11:58',NULL,NULL),(37,3,'member1',1,'content',8,0,'2017-12-08 18:11:58',NULL,NULL),(38,3,'member1',1,'content',8,0,'2017-12-09 18:11:58',NULL,NULL),(39,3,'member1',1,'content',8,0,'2017-12-10 18:11:58',NULL,NULL),(40,3,'member1',1,'content',9,0,'2017-12-11 18:11:58',NULL,NULL),(41,3,'member1',1,'content',10,0,'2017-12-12 18:11:58',NULL,NULL),(42,3,'member1',1,'content',10,0,'2017-12-13 18:11:58',NULL,NULL),(43,3,'member1',1,'content',9,0,'2017-12-14 18:11:58',NULL,NULL),(44,3,'member1',1,'content',8,0,'2017-12-15 18:11:58',NULL,NULL),(45,3,'member1',1,'content',10,0,'2017-12-16 18:11:58',NULL,NULL),(46,3,'member1',1,'content',10,0,'2017-12-17 18:11:58',NULL,NULL),(47,3,'member1',1,'content',9,0,'2017-12-18 18:11:58',NULL,NULL),(48,3,'member1',1,'content',10,0,'2017-12-19 18:11:58',NULL,NULL),(49,3,'member1',1,'content',8,0,'2017-12-20 18:11:58',NULL,NULL),(50,3,'member1',1,'content',9,0,'2017-12-21 18:11:58',NULL,NULL),(51,3,'member1',1,'content',9,0,'2017-12-22 18:11:58',NULL,NULL),(52,3,'member1',1,'content',8,0,'2017-12-23 18:11:58',NULL,NULL),(53,3,'member1',1,'content',8,0,'2017-12-24 18:11:58',NULL,NULL),(54,3,'member1',1,'content',9,0,'2017-12-25 18:11:58',NULL,NULL),(55,3,'member1',1,'content',8,0,'2017-12-26 18:11:58',NULL,NULL),(56,3,'member1',1,'content',9,0,'2017-12-27 18:11:58',NULL,NULL),(57,3,'member1',1,'content',8,0,'2017-12-28 18:11:58',NULL,NULL),(58,3,'member1',1,'content',9,0,'2017-12-29 18:11:58',NULL,NULL),(59,4,'member1',1,'content',10,0,'2017-12-01 18:11:58',NULL,NULL),(60,4,'member1',1,'content',10,0,'2017-12-02 18:11:58',NULL,NULL),(61,4,'member1',1,'content',10,0,'2017-12-03 18:11:58',NULL,NULL),(62,4,'member1',1,'content',9,0,'2017-12-04 18:11:58',NULL,NULL),(63,4,'member1',1,'content',10,0,'2017-12-05 18:11:58',NULL,NULL),(64,4,'member1',1,'content',8,0,'2017-12-06 18:11:58',NULL,NULL),(65,4,'member1',1,'content',8,0,'2017-12-07 18:11:58',NULL,NULL),(66,4,'member1',1,'content',9,0,'2017-12-08 18:11:58',NULL,NULL),(67,4,'member1',1,'content',10,0,'2017-12-09 18:11:58',NULL,NULL),(68,4,'member1',1,'content',9,0,'2017-12-10 18:11:58',NULL,NULL),(69,4,'member1',1,'content',9,0,'2017-12-11 18:11:58',NULL,NULL),(70,4,'member1',1,'content',10,0,'2017-12-12 18:11:58',NULL,NULL),(71,4,'member1',1,'content',9,0,'2017-12-13 18:11:58',NULL,NULL),(72,4,'member1',1,'content',9,0,'2017-12-14 18:11:58',NULL,NULL),(73,4,'member1',1,'content',10,0,'2017-12-15 18:11:58',NULL,NULL),(74,4,'member1',1,'content',10,0,'2017-12-16 18:11:58',NULL,NULL),(75,4,'member1',1,'content',10,0,'2017-12-17 18:11:58',NULL,NULL),(76,4,'member1',1,'content',9,0,'2017-12-18 18:11:58',NULL,NULL),(77,4,'member1',1,'content',9,0,'2017-12-19 18:11:58',NULL,NULL),(78,4,'member1',1,'content',8,0,'2017-12-20 18:11:58',NULL,NULL),(79,4,'member1',1,'content',9,0,'2017-12-21 18:11:58',NULL,NULL),(80,4,'member1',1,'content',8,0,'2017-12-22 18:11:58',NULL,NULL),(81,4,'member1',1,'content',9,0,'2017-12-23 18:11:58',NULL,NULL),(82,4,'member1',1,'content',10,0,'2017-12-24 18:11:58',NULL,NULL),(83,4,'member1',1,'content',10,0,'2017-12-25 18:11:58',NULL,NULL),(84,4,'member1',1,'content',8,0,'2017-12-26 18:11:58',NULL,NULL),(85,4,'member1',1,'content',9,0,'2017-12-27 18:11:58',NULL,NULL),(86,4,'member1',1,'content',9,0,'2017-12-28 18:11:58',NULL,NULL),(87,4,'member1',1,'content',10,0,'2017-12-29 18:11:58',NULL,NULL),(88,5,'member1',1,'content',8,0,'2017-12-01 18:11:58',NULL,NULL),(89,5,'member1',1,'content',8,0,'2017-12-02 18:11:58',NULL,NULL),(90,5,'member1',1,'content',10,0,'2017-12-03 18:11:58',NULL,NULL),(91,5,'member1',1,'content',9,0,'2017-12-04 18:11:58',NULL,NULL),(92,5,'member1',1,'content',9,0,'2017-12-05 18:11:58',NULL,NULL),(93,5,'member1',1,'content',8,0,'2017-12-06 18:11:58',NULL,NULL),(94,5,'member1',1,'content',8,0,'2017-12-07 18:11:58',NULL,NULL),(95,5,'member1',1,'content',8,0,'2017-12-08 18:11:58',NULL,NULL),(96,5,'member1',1,'content',8,0,'2017-12-09 18:11:58',NULL,NULL),(97,5,'member1',1,'content',10,0,'2017-12-10 18:11:58',NULL,NULL),(98,5,'member1',1,'content',10,0,'2017-12-11 18:11:58',NULL,NULL),(99,5,'member1',1,'content',10,0,'2017-12-12 18:11:58',NULL,NULL),(100,5,'member1',1,'content',8,0,'2017-12-13 18:11:58',NULL,NULL),(101,5,'member1',1,'content',10,0,'2017-12-14 18:11:58',NULL,NULL),(102,5,'member1',1,'content',8,0,'2017-12-15 18:11:58',NULL,NULL),(103,5,'member1',1,'content',9,0,'2017-12-16 18:11:58',NULL,NULL),(104,5,'member1',1,'content',10,0,'2017-12-17 18:11:58',NULL,NULL),(105,5,'member1',1,'content',10,0,'2017-12-18 18:11:58',NULL,NULL),(106,5,'member1',1,'content',9,0,'2017-12-19 18:11:58',NULL,NULL),(107,5,'member1',1,'content',10,0,'2017-12-20 18:11:58',NULL,NULL),(108,5,'member1',1,'content',8,0,'2017-12-21 18:11:58',NULL,NULL),(109,5,'member1',1,'content',9,0,'2017-12-22 18:11:58',NULL,NULL),(110,5,'member1',1,'content',8,0,'2017-12-23 18:11:58',NULL,NULL),(111,5,'member1',1,'content',8,0,'2017-12-24 18:11:58',NULL,NULL),(112,5,'member1',1,'content',10,0,'2017-12-25 18:11:58',NULL,NULL),(113,5,'member1',1,'content',10,0,'2017-12-26 18:11:58',NULL,NULL),(114,5,'member1',1,'content',9,0,'2017-12-27 18:11:58',NULL,NULL),(115,5,'member1',1,'content',8,0,'2017-12-28 18:11:58',NULL,NULL),(116,5,'member1',1,'content',10,0,'2017-12-29 18:11:58',NULL,NULL),(117,6,'member1',1,'content',9,0,'2017-12-01 18:11:58',NULL,NULL),(118,6,'member1',1,'content',10,0,'2017-12-02 18:11:58',NULL,NULL),(119,6,'member1',1,'content',9,0,'2017-12-03 18:11:58',NULL,NULL),(120,6,'member1',1,'content',8,0,'2017-12-04 18:11:58',NULL,NULL),(121,6,'member1',1,'content',8,0,'2017-12-05 18:11:58',NULL,NULL),(122,6,'member1',1,'content',10,0,'2017-12-06 18:11:58',NULL,NULL),(123,6,'member1',1,'content',10,0,'2017-12-07 18:11:58',NULL,NULL),(124,6,'member1',1,'content',10,0,'2017-12-08 18:11:58',NULL,NULL),(125,6,'member1',1,'content',9,0,'2017-12-09 18:11:58',NULL,NULL),(126,6,'member1',1,'content',8,0,'2017-12-10 18:11:58',NULL,NULL),(127,6,'member1',1,'content',9,0,'2017-12-11 18:11:58',NULL,NULL),(128,6,'member1',1,'content',9,0,'2017-12-12 18:11:58',NULL,NULL),(129,6,'member1',1,'content',8,0,'2017-12-13 18:11:58',NULL,NULL),(130,6,'member1',1,'content',10,0,'2017-12-14 18:11:58',NULL,NULL),(131,6,'member1',1,'content',9,0,'2017-12-15 18:11:58',NULL,NULL),(132,6,'member1',1,'content',9,0,'2017-12-16 18:11:58',NULL,NULL),(133,6,'member1',1,'content',10,0,'2017-12-17 18:11:58',NULL,NULL),(134,6,'member1',1,'content',9,0,'2017-12-18 18:11:58',NULL,NULL),(135,6,'member1',1,'content',9,0,'2017-12-19 18:11:58',NULL,NULL),(136,6,'member1',1,'content',9,0,'2017-12-20 18:11:58',NULL,NULL),(137,6,'member1',1,'content',9,0,'2017-12-21 18:11:58',NULL,NULL),(138,6,'member1',1,'content',9,0,'2017-12-22 18:11:58',NULL,NULL),(139,6,'member1',1,'content',10,0,'2017-12-23 18:11:58',NULL,NULL),(140,6,'member1',1,'content',8,0,'2017-12-24 18:11:58',NULL,NULL),(141,6,'member1',1,'content',10,0,'2017-12-25 18:11:58',NULL,NULL),(142,6,'member1',1,'content',8,0,'2017-12-26 18:11:58',NULL,NULL),(143,6,'member1',1,'content',10,0,'2017-12-27 18:11:58',NULL,NULL),(144,6,'member1',1,'content',10,0,'2017-12-28 18:11:58',NULL,NULL),(145,6,'member1',1,'content',8,0,'2017-12-29 18:11:58',NULL,NULL),(146,7,'member1',1,'content',9,0,'2017-12-01 18:11:58',NULL,NULL),(147,7,'member1',1,'content',9,0,'2017-12-02 18:11:58',NULL,NULL),(148,7,'member1',1,'content',9,0,'2017-12-03 18:11:58',NULL,NULL),(149,7,'member1',1,'content',9,0,'2017-12-04 18:11:58',NULL,NULL),(150,7,'member1',1,'content',9,0,'2017-12-05 18:11:58',NULL,NULL),(151,7,'member1',1,'content',10,0,'2017-12-06 18:11:58',NULL,NULL),(152,7,'member1',1,'content',9,0,'2017-12-07 18:11:58',NULL,NULL),(153,7,'member1',1,'content',10,0,'2017-12-08 18:11:58',NULL,NULL),(154,7,'member1',1,'content',10,0,'2017-12-09 18:11:58',NULL,NULL),(155,7,'member1',1,'content',8,0,'2017-12-10 18:11:58',NULL,NULL),(156,7,'member1',1,'content',9,0,'2017-12-11 18:11:58',NULL,NULL),(157,7,'member1',1,'content',9,0,'2017-12-12 18:11:58',NULL,NULL),(158,7,'member1',1,'content',9,0,'2017-12-13 18:11:58',NULL,NULL),(159,7,'member1',1,'content',9,0,'2017-12-14 18:11:58',NULL,NULL),(160,7,'member1',1,'content',8,0,'2017-12-15 18:11:58',NULL,NULL),(161,7,'member1',1,'content',8,0,'2017-12-16 18:11:58',NULL,NULL),(162,7,'member1',1,'content',8,0,'2017-12-17 18:11:58',NULL,NULL),(163,7,'member1',1,'content',8,0,'2017-12-18 18:11:58',NULL,NULL),(164,7,'member1',1,'content',10,0,'2017-12-19 18:11:58',NULL,NULL),(165,7,'member1',1,'content',10,0,'2017-12-20 18:11:58',NULL,NULL),(166,7,'member1',1,'content',9,0,'2017-12-21 18:11:58',NULL,NULL),(167,7,'member1',1,'content',8,0,'2017-12-22 18:11:58',NULL,NULL),(168,7,'member1',1,'content',9,0,'2017-12-23 18:11:58',NULL,NULL),(169,7,'member1',1,'content',8,0,'2017-12-24 18:11:58',NULL,NULL),(170,7,'member1',1,'content',10,0,'2017-12-25 18:11:58',NULL,NULL),(171,7,'member1',1,'content',9,0,'2017-12-26 18:11:58',NULL,NULL),(172,7,'member1',1,'content',9,0,'2017-12-27 18:11:58',NULL,NULL),(173,7,'member1',1,'content',10,0,'2017-12-28 18:11:58',NULL,NULL),(174,7,'member1',1,'content',10,0,'2017-12-29 18:11:58',NULL,NULL),(175,8,'member1',1,'content',9,0,'2017-12-01 18:11:58',NULL,NULL),(176,8,'member1',1,'content',8,0,'2017-12-02 18:11:58',NULL,NULL),(177,8,'member1',1,'content',8,0,'2017-12-03 18:11:58',NULL,NULL),(178,8,'member1',1,'content',8,0,'2017-12-04 18:11:58',NULL,NULL),(179,8,'member1',1,'content',9,0,'2017-12-05 18:11:58',NULL,NULL),(180,8,'member1',1,'content',10,0,'2017-12-06 18:11:58',NULL,NULL),(181,8,'member1',1,'content',9,0,'2017-12-07 18:11:58',NULL,NULL),(182,8,'member1',1,'content',10,0,'2017-12-08 18:11:58',NULL,NULL),(183,8,'member1',1,'content',8,0,'2017-12-09 18:11:58',NULL,NULL),(184,8,'member1',1,'content',8,0,'2017-12-10 18:11:58',NULL,NULL),(185,8,'member1',1,'content',9,0,'2017-12-11 18:11:58',NULL,NULL),(186,8,'member1',1,'content',9,0,'2017-12-12 18:11:58',NULL,NULL),(187,8,'member1',1,'content',9,0,'2017-12-13 18:11:58',NULL,NULL),(188,8,'member1',1,'content',9,0,'2017-12-14 18:11:58',NULL,NULL),(189,8,'member1',1,'content',9,0,'2017-12-15 18:11:58',NULL,NULL),(190,8,'member1',1,'content',8,0,'2017-12-16 18:11:58',NULL,NULL),(191,8,'member1',1,'content',10,0,'2017-12-17 18:11:58',NULL,NULL),(192,8,'member1',1,'content',8,0,'2017-12-18 18:11:58',NULL,NULL),(193,8,'member1',1,'content',8,0,'2017-12-19 18:11:58',NULL,NULL),(194,8,'member1',1,'content',10,0,'2017-12-20 18:11:58',NULL,NULL),(195,8,'member1',1,'content',9,0,'2017-12-21 18:11:58',NULL,NULL),(196,8,'member1',1,'content',10,0,'2017-12-22 18:11:58',NULL,NULL),(197,8,'member1',1,'content',10,0,'2017-12-23 18:11:58',NULL,NULL),(198,8,'member1',1,'content',10,0,'2017-12-24 18:11:58',NULL,NULL),(199,8,'member1',1,'content',8,0,'2017-12-25 18:11:58',NULL,NULL),(200,8,'member1',1,'content',10,0,'2017-12-26 18:11:58',NULL,NULL),(201,8,'member1',1,'content',9,0,'2017-12-27 18:11:58',NULL,NULL),(202,8,'member1',1,'content',9,0,'2017-12-28 18:11:58',NULL,NULL),(203,8,'member1',1,'content',8,0,'2017-12-29 18:11:58',NULL,NULL),(204,9,'member1',1,'content',8,0,'2017-12-01 18:11:58',NULL,NULL),(205,9,'member1',1,'content',9,0,'2017-12-02 18:11:58',NULL,NULL),(206,9,'member1',1,'content',9,0,'2017-12-03 18:11:58',NULL,NULL),(207,9,'member1',1,'content',8,0,'2017-12-04 18:11:58',NULL,NULL),(208,9,'member1',1,'content',8,0,'2017-12-05 18:11:58',NULL,NULL),(209,9,'member1',1,'content',8,0,'2017-12-06 18:11:58',NULL,NULL),(210,9,'member1',1,'content',10,0,'2017-12-07 18:11:58',NULL,NULL),(211,9,'member1',1,'content',9,0,'2017-12-08 18:11:58',NULL,NULL),(212,9,'member1',1,'content',8,0,'2017-12-09 18:11:58',NULL,NULL),(213,9,'member1',1,'content',9,0,'2017-12-10 18:11:58',NULL,NULL),(214,9,'member1',1,'content',8,0,'2017-12-11 18:11:58',NULL,NULL),(215,9,'member1',1,'content',8,0,'2017-12-12 18:11:58',NULL,NULL),(216,9,'member1',1,'content',9,0,'2017-12-13 18:11:58',NULL,NULL),(217,9,'member1',1,'content',10,0,'2017-12-14 18:11:58',NULL,NULL),(218,9,'member1',1,'content',9,0,'2017-12-15 18:11:58',NULL,NULL),(219,9,'member1',1,'content',10,0,'2017-12-16 18:11:58',NULL,NULL),(220,9,'member1',1,'content',8,0,'2017-12-17 18:11:58',NULL,NULL),(221,9,'member1',1,'content',8,0,'2017-12-18 18:11:58',NULL,NULL),(222,9,'member1',1,'content',8,0,'2017-12-19 18:11:58',NULL,NULL),(223,9,'member1',1,'content',9,0,'2017-12-20 18:11:58',NULL,NULL),(224,9,'member1',1,'content',10,0,'2017-12-21 18:11:58',NULL,NULL),(225,9,'member1',1,'content',8,0,'2017-12-22 18:11:58',NULL,NULL),(226,9,'member1',1,'content',10,0,'2017-12-23 18:11:58',NULL,NULL),(227,9,'member1',1,'content',10,0,'2017-12-24 18:11:58',NULL,NULL),(228,9,'member1',1,'content',8,0,'2017-12-25 18:11:58',NULL,NULL),(229,9,'member1',1,'content',9,0,'2017-12-26 18:11:58',NULL,NULL),(230,9,'member1',1,'content',9,0,'2017-12-27 18:11:58',NULL,NULL),(231,9,'member1',1,'content',10,0,'2017-12-28 18:11:58',NULL,NULL),(232,9,'member1',1,'content',10,0,'2017-12-29 18:11:58',NULL,NULL),(233,4,'member1',2,'content',12,0,'2017-12-23 14:35:00',NULL,NULL),(234,5,'member1',2,'content',12,0,'2017-12-23 14:35:00',NULL,NULL),(235,6,'member1',2,'content',8,0,'2017-12-23 14:35:00',NULL,NULL),(236,7,'member1',2,'content',13,0,'2017-12-23 14:35:00',NULL,NULL),(237,1,'admin',4,'content',8,0,'2017-12-23 17:31:28','2017-12-23 17:31:28',NULL),(238,1,'admin',4,'content',12,0,'2017-12-23 18:49:17','2017-12-23 18:49:17',NULL),(239,1,'admin',4,'content',12,0,'2017-12-23 18:51:44','2017-12-23 18:51:44',NULL),(240,1,'admin',4,'content',12,0,'2017-12-23 18:51:45','2017-12-23 18:51:45',NULL),(241,1,'admin',4,'content',313,0,'2017-12-23 18:53:09','2017-12-23 18:53:09',NULL);
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
INSERT INTO `users` VALUES (1,'admin','admin@mail.com','$2y$10$s7o1RHWxvYMyT6TwilviW.OQuwhJ645egidWWYGSEQF9n3I5eA8Em',0,NULL,NULL,NULL,NULL,NULL,NULL,0,'jdYPJ12cLSK7DVbdWIKtTTjSreat3eRJwGhgSWR3vdYuAkkihDn1XlCmX0nj','2017-12-09 03:12:19','2017-12-09 03:14:59',NULL),(2,'pm','pm@mail.com','$2y$10$OV3Av5LEoylG.mwaTJhX8u7OQjnJm36Jc40pNr37VdnqAXEKRLptO',1,NULL,NULL,NULL,NULL,NULL,NULL,0,'WkDaQ6yc20BBBduErMJUx63zkehyYWqETgiu36ZK5tCyCqb0ssUUdsZLt9br','2017-12-09 03:20:33','2017-12-09 03:20:33',NULL),(3,'member','member@mail.com','$2y$10$vlo/lQpNzm0Itm12kTPCc.Lx9Jq7w0IsucNFCCmT9VybM9zd1xFdO',2,NULL,NULL,NULL,NULL,NULL,NULL,0,'T2545Zwp5fJL0Q7ANNOStbEMPl46XsSU4LaSYUTo4CaeaYnHzr8pynQqG8vK','2017-12-09 03:20:50','2017-12-09 03:20:50',NULL),(4,'pm1','pm1@mail.com','$2y$10$cKaBYArUhbQme9ePPo.Eu.9abbZV898c87agv9chxSloKz0C5F4si',1,NULL,NULL,NULL,NULL,NULL,NULL,0,'YbOpKBypx3o2ZBXanwk9iTTTDE7QUar5OPLMYNeZL1Ia0P2rqNBCctwYLAGC','2017-12-09 03:24:33','2017-12-09 03:24:33',NULL),(5,'pm2','pm2@mail.com','$2y$10$NuCUFv0mawQi0IdDQwSQtezBKs7h9PdU.cT7PEON6V3EihSdkKBTi',1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:24:41','2017-12-09 03:24:41',NULL),(6,'pm3','pm3@mail.com','$2y$10$sWoVxbiUs4sJWz/1N3/EwOucxYWcuyKEoRpoxWSgbWv.CVdIKP6Ie',1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:24:49','2017-12-09 03:24:49',NULL),(7,'member1','member1@mail.com','$2y$10$JZa5HevQ.eo42IrbuFtnzu/YLiDej4rMQGBLT39hZBDFhKpCQGaA2',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:01','2017-12-09 03:25:01',NULL),(8,'member2','member2@mail.com','$2y$10$z1GHqV/mOsz609eKqnP7hu.AFgNiRCotiyhMHjaCjJN8Gx5bJ2LZ6',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:08','2017-12-09 03:25:08',NULL),(9,'member3','member3@mail.com','$2y$10$x6K8fu3fX7gpAlbzxF9GrebInc2QT6yaRrFeMrD3yjCA4f7/DROWW',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:16','2017-12-09 03:25:16',NULL),(10,'member4','member4@mail.com','$2y$10$lEKwhzW6WchPpZx9vuhX8.xPus2ybMbRLJSScnWFOEmpb5g3wnXb6',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-12-09 03:25:24','2017-12-09 03:25:24',NULL);
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

-- Dump completed on 2017-12-25  1:05:55
