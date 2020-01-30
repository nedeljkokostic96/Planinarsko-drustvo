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
-- Table structure for table `planinarski_dom`
--

DROP TABLE IF EXISTS `planinarski_dom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planinarski_dom` (
  `planinarski_dom_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `planina` int(11) NOT NULL,
  `planinarsko_drustvo` int(11) NOT NULL,
  PRIMARY KEY (`planinarski_dom_id`),
  KEY `fk_planinarski_dom_planina1_idx` (`planina`),
  KEY `fk_planinarski_dom_planinarsko_drustvo1_idx` (`planinarsko_drustvo`),
  CONSTRAINT `fk_planinarski_dom_planina1` FOREIGN KEY (`planina`) REFERENCES `planina` (`planina_id`),
  CONSTRAINT `fk_planinarski_dom_planinarsko_drustvo1` FOREIGN KEY (`planinarsko_drustvo`) REFERENCES `planinarsko_drustvo` (`planinarsko_drustvo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planinarski_dom`
--

LOCK TABLES `planinarski_dom` WRITE;
/*!40000 ALTER TABLE `planinarski_dom` DISABLE KEYS */;
INSERT INTO `planinarski_dom` (`planinarski_dom_id`, `naziv`, `planina`, `planinarsko_drustvo`) VALUES (1,'Katyusha',1,1),(2,'Alistair Gordon',2,1),(3,'Zlato Zlatara',3,1),(4,'Predov Krst',4,1),(5,'Castellanopoulos',5,1),(6,'Krampitz',6,1),(7,'Ernst',7,1);
/*!40000 ALTER TABLE `planinarski_dom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30  5:09:45
