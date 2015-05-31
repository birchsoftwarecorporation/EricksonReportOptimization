CREATE DATABASE  IF NOT EXISTS `reportoptimization` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `reportoptimization`;
-- MySQL dump 10.13  Distrib 5.1.73, for Win64 (unknown)
--
-- Host: localhost    Database: reportoptimization
-- ------------------------------------------------------
-- Server version	5.1.73-community

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
-- Table structure for table `builder`
--

DROP TABLE IF EXISTS `builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builder`
--

LOCK TABLES `builder` WRITE;
/*!40000 ALTER TABLE `builder` DISABLE KEYS */;
/*!40000 ALTER TABLE `builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builder_tract`
--

DROP TABLE IF EXISTS `builder_tract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builder_tract` (
  `builder_tracts_id` bigint(20) DEFAULT NULL,
  `tract_id` bigint(20) DEFAULT NULL,
  KEY `FK_651j6txvhvt16s2rbrma0gpeh` (`tract_id`),
  KEY `FK_9wk0qna4dcfkrmohyl0qhw736` (`builder_tracts_id`),
  CONSTRAINT `FK_9wk0qna4dcfkrmohyl0qhw736` FOREIGN KEY (`builder_tracts_id`) REFERENCES `builder` (`id`),
  CONSTRAINT `FK_651j6txvhvt16s2rbrma0gpeh` FOREIGN KEY (`tract_id`) REFERENCES `tract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builder_tract`
--

LOCK TABLES `builder_tract` WRITE;
/*!40000 ALTER TABLE `builder_tract` DISABLE KEYS */;
/*!40000 ALTER TABLE `builder_tract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `calc_percentage` int(11) DEFAULT NULL,
  `claim_percentage` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `labor_claim` int(11) DEFAULT NULL,
  `labor_cost` int(11) DEFAULT NULL,
  `progress_date` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--

LOCK TABLES `entry` WRITE;
/*!40000 ALTER TABLE `entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry_foreman`
--

DROP TABLE IF EXISTS `entry_foreman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_foreman` (
  `entry_foreman_id` bigint(20) NOT NULL,
  `foreman_id` bigint(20) DEFAULT NULL,
  KEY `FK_koybwhx1eeua5tv542eiyr0s4` (`foreman_id`),
  KEY `FK_d079kydoiltgr98ubebl1qfky` (`entry_foreman_id`),
  CONSTRAINT `FK_d079kydoiltgr98ubebl1qfky` FOREIGN KEY (`entry_foreman_id`) REFERENCES `entry` (`id`),
  CONSTRAINT `FK_koybwhx1eeua5tv542eiyr0s4` FOREIGN KEY (`foreman_id`) REFERENCES `foreman` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_foreman`
--

LOCK TABLES `entry_foreman` WRITE;
/*!40000 ALTER TABLE `entry_foreman` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry_foreman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foreman`
--

DROP TABLE IF EXISTS `foreman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foreman` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foreman`
--

LOCK TABLES `foreman` WRITE;
/*!40000 ALTER TABLE `foreman` DISABLE KEYS */;
/*!40000 ALTER TABLE `foreman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `excel_doc` tinyblob,
  `field_budget` int(11) DEFAULT NULL,
  `field_hours` int(11) DEFAULT NULL,
  `md5hash` varchar(255) COLLATE utf8_bin NOT NULL,
  `number` int(11) NOT NULL,
  `panel_budget` int(11) DEFAULT NULL,
  `panel_hours` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot_entry`
--

DROP TABLE IF EXISTS `lot_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lot_entry` (
  `lot_entries_id` bigint(20) DEFAULT NULL,
  `entry_id` bigint(20) DEFAULT NULL,
  KEY `FK_p8u7cht3fgsghb6euu7dc6l2r` (`entry_id`),
  KEY `FK_jykx8siompwyvrsohac1cehls` (`lot_entries_id`),
  CONSTRAINT `FK_jykx8siompwyvrsohac1cehls` FOREIGN KEY (`lot_entries_id`) REFERENCES `lot` (`id`),
  CONSTRAINT `FK_p8u7cht3fgsghb6euu7dc6l2r` FOREIGN KEY (`entry_id`) REFERENCES `entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot_entry`
--

LOCK TABLES `lot_entry` WRITE;
/*!40000 ALTER TABLE `lot_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `lot_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `drive` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_builder`
--

DROP TABLE IF EXISTS `region_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_builder` (
  `region_builders_id` bigint(20) DEFAULT NULL,
  `builder_id` bigint(20) DEFAULT NULL,
  KEY `FK_i463mn4by6idis9jj4q9ucmq7` (`builder_id`),
  KEY `FK_9r5udpus7ww0xhs2tn8562so7` (`region_builders_id`),
  CONSTRAINT `FK_9r5udpus7ww0xhs2tn8562so7` FOREIGN KEY (`region_builders_id`) REFERENCES `region` (`id`),
  CONSTRAINT `FK_i463mn4by6idis9jj4q9ucmq7` FOREIGN KEY (`builder_id`) REFERENCES `builder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_builder`
--

LOCK TABLES `region_builder` WRITE;
/*!40000 ALTER TABLE `region_builder` DISABLE KEYS */;
/*!40000 ALTER TABLE `region_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tract`
--

DROP TABLE IF EXISTS `tract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tract`
--

LOCK TABLES `tract` WRITE;
/*!40000 ALTER TABLE `tract` DISABLE KEYS */;
/*!40000 ALTER TABLE `tract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tract_lot`
--

DROP TABLE IF EXISTS `tract_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tract_lot` (
  `tract_lots_id` bigint(20) DEFAULT NULL,
  `lot_id` bigint(20) DEFAULT NULL,
  KEY `FK_k81njdxysottytj64qdivtgom` (`lot_id`),
  KEY `FK_jdko2nbir52pn6j0958si2dg3` (`tract_lots_id`),
  CONSTRAINT `FK_jdko2nbir52pn6j0958si2dg3` FOREIGN KEY (`tract_lots_id`) REFERENCES `tract` (`id`),
  CONSTRAINT `FK_k81njdxysottytj64qdivtgom` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tract_lot`
--

LOCK TABLES `tract_lot` WRITE;
/*!40000 ALTER TABLE `tract_lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `tract_lot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-30 13:20:30
