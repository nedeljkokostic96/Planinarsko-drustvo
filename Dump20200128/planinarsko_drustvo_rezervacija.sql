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
-- Table structure for table `rezervacija`
--

DROP TABLE IF EXISTS `rezervacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezervacija` (
  `rezervacija_id` int(11) NOT NULL AUTO_INCREMENT,
  `od_datum` datetime NOT NULL,
  `do_datum` datetime NOT NULL,
  `planinarski_dom` int(11) NOT NULL,
  `osoba` int(11) NOT NULL,
  PRIMARY KEY (`rezervacija_id`),
  KEY `fk_rezervacija_planinarski_dom1_idx` (`planinarski_dom`),
  KEY `fk_rezervacija_osoba1_idx` (`osoba`),
  CONSTRAINT `fk_rezervacija_osoba1` FOREIGN KEY (`osoba`) REFERENCES `osoba` (`osoba_id`),
  CONSTRAINT `fk_rezervacija_planinarski_dom1` FOREIGN KEY (`planinarski_dom`) REFERENCES `planinarski_dom` (`planinarski_dom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervacija`
--

LOCK TABLES `rezervacija` WRITE;
/*!40000 ALTER TABLE `rezervacija` DISABLE KEYS */;
INSERT INTO `rezervacija` (`rezervacija_id`, `od_datum`, `do_datum`, `planinarski_dom`, `osoba`) VALUES (1,'2019-12-25 00:00:00','2020-01-05 00:00:00',2,4),(2,'2020-03-01 00:00:00','2020-03-11 00:00:00',4,3),(3,'2020-06-01 00:00:00','2020-06-01 00:00:00',6,1),(4,'2020-06-20 00:00:00','2020-07-01 00:00:00',1,7),(5,'2020-04-11 00:00:00','2020-04-22 00:00:00',3,2),(6,'2020-09-01 00:00:00','2020-11-01 00:00:00',7,6),(7,'2020-12-20 00:00:00','2021-01-01 00:00:00',5,5),(12,'2019-12-30 00:00:00','2019-12-30 00:00:00',4,1),(13,'2019-12-30 00:00:00','2019-12-30 00:00:00',4,1),(14,'2020-01-01 00:02:00','2020-01-29 00:01:00',3,1);
/*!40000 ALTER TABLE `rezervacija` ENABLE KEYS */;
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
