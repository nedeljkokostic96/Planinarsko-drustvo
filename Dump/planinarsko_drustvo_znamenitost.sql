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
-- Table structure for table `znamenitost`
--

DROP TABLE IF EXISTS `znamenitost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `znamenitost` (
  `znamenitost_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `opis` text NOT NULL,
  `staza` int(11) NOT NULL,
  PRIMARY KEY (`znamenitost_id`),
  KEY `fk_znamenitost_staza1_idx` (`staza`),
  CONSTRAINT `fk_znamenitost_staza1` FOREIGN KEY (`staza`) REFERENCES `staza` (`staza_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `znamenitost`
--

LOCK TABLES `znamenitost` WRITE;
/*!40000 ALTER TABLE `znamenitost` DISABLE KEYS */;
INSERT INTO `znamenitost` (`znamenitost_id`, `naziv`, `opis`, `staza`) VALUES (1,'Baksanska Dolina','Na Baksanskoj dolini možete otići u banju ili saunu, brojne kafiće i restorane. Možete čak unajmiti brdski bicikl, baviti se ribolovom i pešačenjem. U ovom predelu šuma je bogata bobičastim voćem poput: jagoda, borovnica, crvena borovnica',1),(2,'Kislovodsk','Ovaj popularni SPA-grad nalazi se 50 km južno od \"Mineral Vody\" putem i samo 65 km od planine Elbrus. Dakle, kada se popnete na najvišu tačku Kislovodska (pomoću žičara ili pešačenjem), možete videti ceo Elbrus ispred sebe. Kislovodsk je simpatičan grad sa ogromnim parkom, mineralnim izvorima, kupkama, lepim zgradama koje su sagradili engleski, belgijski i italijanski arhitekti. Veliki ruski pesnici Puškin i Lermontov posetili su ovaj grad. ',1),(3,'Steall Waterfall',' Iog trčanja - od veoma prometnog parkirališta vodi Vas do predivnih otvorenih livada, pogleda preko vodopada i zanimljivih opcionalnih izazovnih mostova visokog žičara preko reke.',2),(4,'Muzej Vest Highland','Muzej postavljen na trgu Cameron, koji je nedaleko od centra Fort Villiam High Street. Bilo da je reč o  arheologiji, prirodnoj istoriji, obuci komandosa i naoružanju, planinskom životu, nošnji i čarima, viktorijanskim vremenima, srebru , kovanice i medalje, ili čak istorija planinskog spašavanja, sve se to može naći u muzeju Vest Highland.',2),(5,'Uvačko Jezero','Obilazak kanjona Uvca obavlja se brodovima i katamaranima koji polaze sa brane na Rastokama. Tura se satoji od vožnje čamcem kroz krivudave, nadaleko poznate, meandre, posete Ledenoj pećini i obilaska vidikovca Molitva sa kog se pruža pogled ka meandrima i koloniji beloglavih supova koji kruže nebom iznad jezera.',3),(6,'Most na reci Uvaci','Na 60-70 metara pod vodom, ostao je konzerviran i jedini sačuvan luk potopljenog kamenog mosta na Žvalama, koji je imao tri vitka, duga luka koje stariji meštani oko jezera još pamte. Po obodima jezera ostali su tek obrisi starog carskog puta koji je nekada povezivao Sarajevo i Carigrad čija je kaldrma sada duboko u jezerskim vodama.',3),(7,'Nacionalni Park Tara','Nacionalni park Tara obuhvata planinski predeo u zapadnoj Srbiji koji je stavljen pod zaštitu 1981. godine. Zaštićeno područje površine od skoro 25.000 hektara pokriva najveći deo planinskog masiva Tare i Zvijezde omeđenog tokom Drine između Bajine Bašte u Srbiji i Višegrada u Bosni.',4),(8,'Kućica na Drini','Kućica na Drini je simbol Bajine Bašte i jedno od najpoznatijih obeležja reke kod Srba poznate i kao Zelenika, ali i celog regiona Podrinja. Ovaj bajkoviti prizor stene sa kućicom dok je sa obe strane miluje smaragdno zelena voda predstavlja najlepši početak upoznavanja sa Bajinom Baštom.',4),(9,'Nacionalni Park Olimpus','Park je zaštićen posebnim zakonodavstvom. Prema „Posebnom propisu“ ulaz u Park je dozvoljen samo postojećim putevima i saobraćaj je dozvoljen od izlaska do zalaska sunca samo na formiranim stazama.',5),(10,'Olypmus Alpine Biblioteka','Sadrži i deli digitalni sadržaj dostupnih neprofitnih / nekomercijalnih informacija o istoriji penjanja planine. Olimpus. Zbirka bibliografskih informacija, digitalizovane stranice retkih knjiga i novijih publikacija posetiocu su na raspolaganju za onlajn distribuciju, istraživanje, proučavanje, kopiranje i upotrebu. Trenutno arhiva ima oko 300 naslova i preko 150 e-knjiga za istraživanje i mesečno se ažurira.',5),(11,'Oberharzer Wasserregal','Sistem brana, rezervoara, jarka i drugih građevina, od kojih je veći deo izgrađen od 16. do 19. veka za preusmeravanje i skladištenje vode koja je pokretala vodene točkove rudnika u oblasti Gornjeg Harca u Nemačkoj.',6),(12,'Harzer Vandernadel dom','Harzer Vandernadel je sistem nagrada za planinarenje u planinama Harz u centralnoj Nemačkoj. Planinar (ili brdski biciklist) može zaraditi nagrade na različitim nivoima izazova ako ode do različitih kontrolnih tačaka u mreži i žigosanje svoje knjižice za snimanje posete.',6),(13,'Muzej Grand Curtius ','Zasigurno živi u skladu sa svojim imenom i odmah je prepoznatljiva po svojoj impresivnoj unutrašnjosti od crvene cigle. Unutra je zgrada impresivno i pažljivo renovirana, ali takođe i muzej koji istražuje istoriju umetnosti od nastanka do modernog doba.',7),(14,'Rochehaut ','Predivna zelena brda, vijugava reka i gusta šuma čine zadivljujući pejzaž Rochehauta.Pešačenje u okolini je vrlo korisno, podudaranje terena za sve nivoe fitnesa sa sjajnim pogledom.',7);
/*!40000 ALTER TABLE `znamenitost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30  5:09:44
