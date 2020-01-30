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
-- Table structure for table `iskustvo`
--

DROP TABLE IF EXISTS `iskustvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iskustvo` (
  `iskustvo_id` int(11) NOT NULL AUTO_INCREMENT,
  `iskustvo` text NOT NULL,
  `rezervacija` int(11) NOT NULL,
  PRIMARY KEY (`iskustvo_id`),
  KEY `fk_iskustvo_rezervacija1_idx` (`rezervacija`),
  CONSTRAINT `fk_iskustvo_rezervacija1` FOREIGN KEY (`rezervacija`) REFERENCES `rezervacija` (`rezervacija_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iskustvo`
--

LOCK TABLES `iskustvo` WRITE;
/*!40000 ALTER TABLE `iskustvo` DISABLE KEYS */;
INSERT INTO `iskustvo` (`iskustvo_id`, `iskustvo`, `rezervacija`) VALUES (1,'Temperatura bude za nijansu niža nego u dolinama i primetno niža nego u gradovima, vreme je promenljivo. Noći su znatno hladnije, obavezna je garderoba dugih rukava uveče i ujutro.',1),(2,'Meštani su ljubazni i predusretljivi, hrana dobra, prava domaćinska, kao da ste otišli kod bake na selo... Smeštaj je takođe dobar, sobe su velike i čiste.',2),(3,'Kada je u pitanju skijanje predstavlja, iznenađujuće mali ski centar, bar kada se uporedi sa drugim skijalištima ovog tipa. Sa ukupno 16 ski liftova i žičarom koja povezuje sve ski staze na dobro usklađen način, što uvek rezultira pozitivnim iskustvom skijaša koji posete ovaj ski centar, jer im olakšava menjanje staza',3),(4,'Konji su na neki način zaštitini znak ove planine, a možete ih iznajmiti za jahanje na posebnim stazama, iskustvo koje definitvno predstavlja deo neponovljivog šarma Katschberga. Tako da, ako ne želite samo da se prepustite samo skijanju, možete upisati školu jahanja dok ste tamo, bili napolju ili unutra. ',4),(5,'Tradicionalni šarm, vreli, prirodni termalni izvori, izvanredno skijanje na 2655 m nadmorske visine i staze koje će zadovoljiti i vrlo zahtevne skijaše, aktivan noćni život i kazino, luksuzni wellness centri, moderne prodavnice, restorani.',5),(6,'Ovaj moderan skijaški centar u poslednjih nekoliko godina doživljava punu ekspanziju. Najbrojniji su turisti iz regiona, ali iz godine u godinu ovde dolazi i sve veći broj turista sa zapada. Odlikuju ga izuzetno uređene staze, odlično održavani ski liftovi, kao i široka ponuda luksuznih hotela. Oni koji se odluče da svoje zimovanje provedu ovde mogu uživati u neverovatnim vidicima i prekrasnoj prirodi.',6),(7,'Jedna od najlepših i najlekovitijih planina u Evropi pružila je \" utočište. Okružena je netaknutom prirodom i šumama javora, smrče, borova...',7),(8,'Ovo je bilo izuzetno iskustvo i moracu da ga ponovim!',2),(9,'Nezaboravno!',2),(10,'Predobro je bilo!',13),(11,'Fino smo se proveli',12),(12,'Ekstra',12),(13,'super',14),(14,'aaaaaaaaaaaa',14),(15,'dassadasdasd',14),(16,'hghghgfhfghfg',13);
/*!40000 ALTER TABLE `iskustvo` ENABLE KEYS */;
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
