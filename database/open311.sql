CREATE DATABASE  IF NOT EXISTS `open311` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `open311`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: open311
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `AccountId_UNIQUE` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Ingrid','Terrazas',NULL,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(250) COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `keywords` varchar(1000) COLLATE utf8mb3_bin DEFAULT NULL,
  `group` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_id_UNIQUE` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'PASA',NULL,'ASF',NULL,'HDH');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request` (
  `service_request_id` int NOT NULL AUTO_INCREMENT,
  `lat` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `long` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `address_string` varchar(250) COLLATE utf8mb3_bin DEFAULT NULL,
  `account_id` int NOT NULL DEFAULT '1',
  `email` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb3_bin DEFAULT NULL,
  `media_url` varchar(5000) COLLATE utf8mb3_bin DEFAULT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb3_bin DEFAULT 'PENDIENTE',
  `service_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`service_request_id`),
  KEY `account_id_idx` (`account_id`),
  KEY `service_id_idx` (`service_id`),
  CONSTRAINT `account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT,
  CONSTRAINT `service_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_request`
--

LOCK TABLES `service_request` WRITE;
/*!40000 ALTER TABLE `service_request` DISABLE KEYS */;
INSERT INTO `service_request` VALUES (2,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6567095309','tertert',NULL,NULL,NULL,'PENDIENTE',1),(3,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6567095309','GHJFGHJ',NULL,'2023-08-31 00:07:49',NULL,'PENDIENTE',1),(4,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6567095309','fghdfghfdgh',NULL,'2023-08-31 00:39:37',NULL,NULL,1),(5,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6567095309','fghdfghfdgh',NULL,'2023-08-31 00:39:46',NULL,NULL,1),(6,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6567095309','1654hkjhkj',NULL,'2023-08-31 00:41:15',NULL,NULL,1),(7,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6564564544','1654hkjhkj',NULL,'2023-08-31 00:45:24',NULL,NULL,1),(8,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6561234567','ttttt',NULL,'2023-08-31 00:55:49',NULL,NULL,1),(9,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6561234567','ttttt',NULL,'2023-08-31 00:56:30',NULL,NULL,1),(10,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6569999999','pppp',NULL,'2023-08-31 00:59:18',NULL,NULL,1),(11,NULL,NULL,'ROSALIO HERNANDEZ',1,'iterrazas_@outlook.com','INGRID MARGARITA','ALVARADO','6569999999','pppp',NULL,'2023-08-31 01:00:02',NULL,NULL,1);
/*!40000 ALTER TABLE `service_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-31 10:22:29
