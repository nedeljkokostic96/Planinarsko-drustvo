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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` (`osoba_id`, `jmbg`, `ime`, `prezime`, `datum_rodjenja`, `broj_telefona`, `uloga`, `password`) VALUES (1,'1102991802157','Tomislav','Perić','1991-02-11 00:00:00','4006',1,'$2a$10$N/xHMfYGmK1NZlC8AQyBoOA7jOboGfEW3xAMXJSHGsCiezidJrNqm'),(2,'2204974111989','Milica','Marić','1974-04-22 00:00:00','1003',2,'$2a$10$ib9ZmUCY/UpVumDw/JacYOI46xC1b5ZoxJEyhtDgYkh7sa6kcPfLO'),(3,'1911988093432','Stanislav','Blagić','1988-11-19 00:00:00','7942',1,'$2a$10$34DGGoXrTmDRl4lOLOCrauTp1NAbjAF1tW8WFPzRgrUf1i1ILfP5a'),(4,'3009987994203','Blagoje','Stojankić','1987-09-30 00:00:00','5102',2,'$2a$10$GODzML4lyiPEX2OIokgET.DWb83iaiHOGK1tBuTXnjKzWP9VKe22S'),(5,'0708968642742','Emilija','Denčić','1968-08-07 00:00:00','7925',1,'$2a$10$1RcXqxHBdcPjPQysbpNmlOwgcuVK9OVSKcpd0kg6FA4A7b6P8JIPC'),(6,'0601998716981','Jelenka','Kremić','1998-01-06 00:00:00','0307',1,'$2a$10$nnm.l4NW0GYqUjYsUQC8dOnNo/SUfWk.2GuoeJjZ/uxSOtB9yJv7a'),(7,'1905990074338','Slavica','Mitić','1990-05-19 00:00:00','9012',1,'$2a$10$i8qzQPWcoSOUhyEftl0CRuSr1YiQlB908WKoLnDv.ZS67tVkMZFF6'),(8,'1234567891234','Jovan','Jovanovic','1990-11-12 00:00:00','123456',2,'$2a$10$9df.tlNwSLIUE2NeOKRqZ.Om5yCJ5zIep4V7lC2Ng5qG0d3604VMe'),(9,'1111112222223','Jovan','Bajic','1990-11-12 00:00:00','123456',2,'$2a$10$AEAkvrIqfVJsCUNQYqGNAewjLy/3RCaAVsU.4U3nQu3sIG3DsCCui'),(10,'1111222233334','Nedeljko','Jovanovic','2001-01-29 00:03:00','0645524848',1,'$2a$10$J2SVNMHCLX8TT8euaY6nu.4JFcSE14.HcRliKOmHvldrlnIeJgOny'),(11,'0301993182882','Dule','Rajkovic','1993-01-03 00:01:00','0645524848',1,'$2a$10$vcX100YoeYHtgJkD8/NNIuQAy8C7NKC9CYe9Dmk5zzeIzG445dEPK'),(12,'1233211233214','Misko','Jovanovic','1994-01-18 00:03:00','0645524848',1,'$2a$10$fERVSyg67bwcLReXNNOKSOnzKe6Pz2jZQBsFRa1m0nUq0NibGBJYm'),(13,'4848484848484','Jovan','Markovic','2005-01-26 00:03:00','06488995544',1,'$2a$10$MF2fWOlPeFdf1GT0APEiBe7p/CXRuBo5GN0MdXDYK9qmP6ovIZ7mC');
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

-- Dump completed on 2020-01-30  5:09:45
