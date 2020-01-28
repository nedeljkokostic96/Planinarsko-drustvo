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
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osoba` (
  `osoba_id` int(11) NOT NULL AUTO_INCREMENT,
  `jmbg` varchar(13) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `datum_rodjenja` datetime NOT NULL,
  `broj_telefona` varchar(45) NOT NULL,
  `uloga` int(11) NOT NULL,
  `password` varchar(1000) NOT NULL,
  PRIMARY KEY (`osoba_id`),
  KEY `fk_osoba_uloga1_idx` (`uloga`),
  CONSTRAINT `fk_osoba_uloga1` FOREIGN KEY (`uloga`) REFERENCES `uloga` (`uloga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` (`osoba_id`, `jmbg`, `ime`, `prezime`, `datum_rodjenja`, `broj_telefona`, `uloga`, `password`) VALUES (1,'1102991802157','Tomislav','Perić','1991-02-11 00:00:00','4006',1,'123456'),(2,'2204974111989','Milica','Marić','1974-04-22 00:00:00','1003',2,'000000'),(3,'1911988093432','Stanislav','Blagić','1988-11-19 00:00:00','7942',1,'aaaaaa'),(4,'3009987994203','Blagoje','Stojankić','1987-09-30 00:00:00','5102',2,'bbbbbbb'),(5,'0708968642742','Emilija','Denčić','1968-08-07 00:00:00','7925',1,'111111'),(6,'0601998716981','Jelenka','Kremić','1998-01-06 00:00:00','0307',1,'121212'),(7,'1905990074338','Slavica','Mitić','1990-05-19 00:00:00','9012',1,'cccccc'),(8,'1234567891234','Jovan','Jovanovic','1990-11-12 00:00:00','123456',2,'000000'),(9,'1111112222223','Jovan','Bajic','1990-11-12 00:00:00','123456',2,'000000'),(10,'1111222233334','Nedeljko','Jovanovic','2001-01-29 00:03:00','0645524848',1,'222222');
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
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
