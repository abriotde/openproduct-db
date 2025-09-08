/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: openproduct
-- ------------------------------------------------------
-- Server version	11.4.7-MariaDB-0ubuntu0.25.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postCode` int(11) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `siret` varchar(100) DEFAULT NULL,
  `siretStatus` enum('ok','ko') DEFAULT NULL,
  `companyInfos` text DEFAULT NULL,
  `phoneNumber` varchar(16) DEFAULT NULL,
  `phoneNumber2` varchar(16) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `website` varchar(256) DEFAULT NULL,
  `websiteStatus` enum('ok','unknown','ko','ConnectionError','300','400','500') NOT NULL DEFAULT 'unknown',
  `status` enum('actif','pause','hs','unknown','non-interesse','hors-sujet','to-check') NOT NULL DEFAULT 'actif',
  `text` varchar(1024) DEFAULT NULL,
  `produces` varchar(512) DEFAULT NULL,
  `wikiTitle` varchar(100) DEFAULT NULL,
  `wikiDefaultTitle` varchar(100) DEFAULT NULL,
  `shortDescription` varchar(256) DEFAULT NULL,
  `openingHours` varchar(1024) DEFAULT NULL,
  `categories` varchar(16) DEFAULT NULL,
  `geoprecision` double DEFAULT 1,
  `sendEmail` enum('Never','Yes','wrongEmail') DEFAULT NULL,
  `nbMailSend` smallint(6) DEFAULT 0,
  `lastEmailSendDate` datetime DEFAULT NULL,
  `nbModeration` smallint(6) DEFAULT 0,
  `noteModeration` varchar(1024) DEFAULT NULL,
  `preferences` varchar(100) DEFAULT NULL,
  `tokenAccess` varchar(100) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `lastUpdateDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` tinyint(4) DEFAULT NULL,
  `labels` enum('EntreprisePatrimoineVivant','') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `latitude` (`latitude`,`longitude`),
  UNIQUE KEY `name` (`name`,`city`),
  KEY `postcode` (`postCode`)
) ENGINE=MyISAM AUTO_INCREMENT=12913 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

