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
-- Table structure for table `posjeta`
--

DROP TABLE IF EXISTS `posjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posjeta` (
  `posjeta_id` int(11) NOT NULL AUTO_INCREMENT,
  `termin` datetime DEFAULT NULL,
  `komentar` text,
  `rezervacija` int(11) NOT NULL,
  `znamenitost` int(11) NOT NULL,
  PRIMARY KEY (`posjeta_id`),
  KEY `fk_posjeta_rezervacija1_idx` (`rezervacija`),
  KEY `fk_posjeta_znamenitost1_idx` (`znamenitost`),
  CONSTRAINT `fk_posjeta_rezervacija1` FOREIGN KEY (`rezervacija`) REFERENCES `rezervacija` (`rezervacija_id`),
  CONSTRAINT `fk_posjeta_znamenitost1` FOREIGN KEY (`znamenitost`) REFERENCES `znamenitost` (`znamenitost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posjeta`
--

LOCK TABLES `posjeta` WRITE;
/*!40000 ALTER TABLE `posjeta` DISABLE KEYS */;
INSERT INTO `posjeta` (`posjeta_id`, `termin`, `komentar`, `rezervacija`, `znamenitost`) VALUES (1,'2019-03-03 00:00:00','Proleće je divno u ovom kraju!',4,5),(2,'2019-12-28 00:00:00','Zanimljivo iskustvo, preporuka svima.',1,4),(3,'2018-06-04 00:00:00','Odličan izbor za početak godišnjeg odmora!',3,2),(4,'2019-06-23 00:00:00','Jedva čekam sledeću godnu da ponovo dođem.',6,1),(5,'2019-04-11 00:00:00','Veoma prijatno u jeseni.',2,7),(6,'2019-09-01 00:00:00','Veoma hladno vreme, preporuka je dobro se obući!',5,3),(7,'2019-12-20 00:00:00','Pravi ambijent za proslavu nove Godine.',7,6),(12,'2019-12-30 00:00:00','Prvi promijenjen',12,8),(13,'2019-12-30 00:00:00','Drugi izmijenjen...............',13,8),(14,'2020-01-31 00:01:00','Jedva cekamo ponovo da idemo!',14,6);
/*!40000 ALTER TABLE `posjeta` ENABLE KEYS */;
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
