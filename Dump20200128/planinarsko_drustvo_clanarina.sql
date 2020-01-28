-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: planinarsko_drustvo
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `clanarina`
--

DROP TABLE IF EXISTS `clanarina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clanarina` (
  `clanarina_id` int(11) NOT NULL AUTO_INCREMENT,
  `iznos` float DEFAULT NULL,
  `od_datum` datetime DEFAULT NULL,
  `do_datum` datetime DEFAULT NULL,
  `planinar` int(11) NOT NULL,
  `sekretar` int(11) NOT NULL,
  `planinarsko_drustvo` int(11) NOT NULL,
  PRIMARY KEY (`clanarina_id`),
  KEY `fk_clanarina_osoba1_idx` (`planinar`),
  KEY `fk_clanarina_osoba2_idx` (`sekretar`),
  KEY `fk_clanarina_planinarsko_drustvo1_idx` (`planinarsko_drustvo`),
  CONSTRAINT `fk_clanarina_osoba1` FOREIGN KEY (`planinar`) REFERENCES `osoba` (`osoba_id`),
  CONSTRAINT `fk_clanarina_osoba2` FOREIGN KEY (`sekretar`) REFERENCES `osoba` (`osoba_id`),
  CONSTRAINT `fk_clanarina_planinarsko_drustvo1` FOREIGN KEY (`planinarsko_drustvo`) REFERENCES `planinarsko_drustvo` (`planinarsko_drustvo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clanarina`
--

LOCK TABLES `clanarina` WRITE;
/*!40000 ALTER TABLE `clanarina` DISABLE KEYS */;
INSERT INTO `clanarina` (`clanarina_id`, `iznos`, `od_datum`, `do_datum`, `planinar`, `sekretar`, `planinarsko_drustvo`) VALUES (1,8400,'2020-01-26 19:12:34','2021-01-25 19:12:34',1,2,1),(2,8400,'2020-01-26 16:34:21','2021-01-25 16:34:21',3,2,1),(3,8400,'2020-01-26 16:34:32','2021-01-25 16:34:32',5,2,1),(4,8400,'2019-03-08 00:00:00','2020-03-08 00:00:00',6,4,1),(5,8400,'2020-01-26 16:19:56','2021-01-25 16:19:56',7,2,1),(8,8400,'2020-01-27 00:45:23','2021-01-26 00:45:23',10,4,1);
/*!40000 ALTER TABLE `clanarina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-28  6:10:58
