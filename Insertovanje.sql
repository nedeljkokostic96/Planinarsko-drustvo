/*INSERT TABLE uloga:*/
INSERT INTO uloga(naziv) VALUES ('planinar');
INSERT INTO uloga(naziv) VALUES ('sekretar');


/*INSERT TABLE osoba:*/
INSERT INTO osoba (jmbg, ime, prezime, datum_rodjenja, broj_telefona, uloga) VALUES ('1102991802157','Tomislav','Perić','1991-02-11','4006','1', '123456');
INSERT INTO osoba (jmbg, ime, prezime, datum_rodjenja, broj_telefona, uloga) VALUES ('2204974111989','Milica','Marić','1974-04-22','1003','2', '000000');
INSERT INTO osoba (jmbg, ime, prezime, datum_rodjenja, broj_telefona, uloga) VALUES ('1911988093432','Stanislav','Blagić','1988-11-19','7942','1', '111111');
INSERT INTO osoba (jmbg, ime, prezime, datum_rodjenja, broj_telefona, uloga) VALUES ('3009987994203','Blagoje','Stojankić','1987-09-30','5102','2', 'aaaaaa');
INSERT INTO osoba (jmbg, ime, prezime, datum_rodjenja, broj_telefona, uloga) VALUES ('0708968642742','Emilija','Denčić','1968-08-07','7925','1', 'bbbbbb');
INSERT INTO osoba (jmbg, ime, prezime, datum_rodjenja, broj_telefona, uloga) VALUES ('0601998716981','Jelenka','Kremić','1998-01-06','0307','1', 'cccccc');
INSERT INTO osoba (jmbg, ime, prezime, datum_rodjenja, broj_telefona, uloga) VALUES ('1905990074338','Slavica','Mitić','1990-05-19','9012','1', '121212');

/*INSERT TABLE planina:*/
INSERT INTO planina (naziv, drzava) VALUES ('Elbrus', 'Rusija');
INSERT INTO planina (naziv, drzava) VALUES ('Ben Nevis', 'Velika Britanija');
INSERT INTO planina (naziv, drzava) VALUES ('Zlatar', 'Srbija');
INSERT INTO planina (naziv, drzava) VALUES ('Tara', 'Srbija');
INSERT INTO planina (naziv, drzava) VALUES ('Olimp', 'Grčka');
INSERT INTO planina (naziv, drzava) VALUES ('Harc', 'Nemačka');
INSERT INTO planina (naziv, drzava) VALUES ('Ardeni', 'Belgija');

/*INSERT TABLE staza:*/
INSERT INTO staza(naziv, tezina, planina) VALUES('Mingi Taw','7','1');
INSERT INTO staza(naziv, tezina, planina) VALUES('Glen','6','2');
INSERT INTO staza(naziv, tezina, planina) VALUES('Plava','2','3');
INSERT INTO staza(naziv, tezina, planina) VALUES('Biser Tare','2','4');
INSERT INTO staza(naziv, tezina, planina) VALUES('Larisa','5','5');
INSERT INTO staza(naziv, tezina, planina) VALUES('Saut Harc','7','6');
INSERT INTO staza(naziv, tezina, planina) VALUES('Kourt','6','7');

/*INSERT TABLE znamenitost:*/
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Baksanska Dolina','Na Baksanskoj dolini možete otići u banju ili saunu, brojne kafiće i restorane. Možete čak unajmiti brdski bicikl, baviti se ribolovom i pešačenjem. U ovom predelu šuma je bogata bobičastim voćem poput: jagoda, borovnica, crvena borovnica','1');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Kislovodsk','Ovaj popularni SPA-grad nalazi se 50 km južno od "Mineral Vody" putem i samo 65 km od planine Elbrus. Dakle, kada se popnete na najvišu tačku Kislovodska (pomoću žičara ili pešačenjem), možete videti ceo Elbrus ispred sebe. Kislovodsk je simpatičan grad sa ogromnim parkom, mineralnim izvorima, kupkama, lepim zgradama koje su sagradili engleski, belgijski i italijanski arhitekti. Veliki ruski pesnici Puškin i Lermontov posetili su ovaj grad. ','1');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Steall Waterfall',' Iog trčanja - od veoma prometnog parkirališta vodi Vas do predivnih otvorenih livada, pogleda preko vodopada i zanimljivih opcionalnih izazovnih mostova visokog žičara preko reke.','2');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Muzej Vest Highland','Muzej postavljen na trgu Cameron, koji je nedaleko od centra Fort Villiam High Street. Bilo da je reč o  arheologiji, prirodnoj istoriji, obuci komandosa i naoružanju, planinskom životu, nošnji i čarima, viktorijanskim vremenima, srebru , kovanice i medalje, ili čak istorija planinskog spašavanja, sve se to može naći u muzeju Vest Highland.','2');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Uvačko Jezero','Obilazak kanjona Uvca obavlja se brodovima i katamaranima koji polaze sa brane na Rastokama. Tura se satoji od vožnje čamcem kroz krivudave, nadaleko poznate, meandre, posete Ledenoj pećini i obilaska vidikovca Molitva sa kog se pruža pogled ka meandrima i koloniji beloglavih supova koji kruže nebom iznad jezera.','3');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Most na reci Uvaci','Na 60-70 metara pod vodom, ostao je konzerviran i jedini sačuvan luk potopljenog kamenog mosta na Žvalama, koji je imao tri vitka, duga luka koje stariji meštani oko jezera još pamte. Po obodima jezera ostali su tek obrisi starog carskog puta koji je nekada povezivao Sarajevo i Carigrad čija je kaldrma sada duboko u jezerskim vodama.','3');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Nacionalni Park Tara','Nacionalni park Tara obuhvata planinski predeo u zapadnoj Srbiji koji je stavljen pod zaštitu 1981. godine. Zaštićeno područje površine od skoro 25.000 hektara pokriva najveći deo planinskog masiva Tare i Zvijezde omeđenog tokom Drine između Bajine Bašte u Srbiji i Višegrada u Bosni.','4');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Kućica na Drini','Kućica na Drini je simbol Bajine Bašte i jedno od najpoznatijih obeležja reke kod Srba poznate i kao Zelenika, ali i celog regiona Podrinja. Ovaj bajkoviti prizor stene sa kućicom dok je sa obe strane miluje smaragdno zelena voda predstavlja najlepši početak upoznavanja sa Bajinom Baštom.','4');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Nacionalni Park Olimpus','Park je zaštićen posebnim zakonodavstvom. Prema „Posebnom propisu“ ulaz u Park je dozvoljen samo postojećim putevima i saobraćaj je dozvoljen od izlaska do zalaska sunca samo na formiranim stazama.','5');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Olypmus Alpine Biblioteka','Sadrži i deli digitalni sadržaj dostupnih neprofitnih / nekomercijalnih informacija o istoriji penjanja planine. Olimpus. Zbirka bibliografskih informacija, digitalizovane stranice retkih knjiga i novijih publikacija posetiocu su na raspolaganju za onlajn distribuciju, istraživanje, proučavanje, kopiranje i upotrebu. Trenutno arhiva ima oko 300 naslova i preko 150 e-knjiga za istraživanje i mesečno se ažurira.','5');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Oberharzer Wasserregal','Sistem brana, rezervoara, jarka i drugih građevina, od kojih je veći deo izgrađen od 16. do 19. veka za preusmeravanje i skladištenje vode koja je pokretala vodene točkove rudnika u oblasti Gornjeg Harca u Nemačkoj.','6');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Harzer Vandernadel dom','Harzer Vandernadel je sistem nagrada za planinarenje u planinama Harz u centralnoj Nemačkoj. Planinar (ili brdski biciklist) može zaraditi nagrade na različitim nivoima izazova ako ode do različitih kontrolnih tačaka u mreži i žigosanje svoje knjižice za snimanje posete.','6');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Muzej Grand Curtius ','Zasigurno živi u skladu sa svojim imenom i odmah je prepoznatljiva po svojoj impresivnoj unutrašnjosti od crvene cigle. Unutra je zgrada impresivno i pažljivo renovirana, ali takođe i muzej koji istražuje istoriju umetnosti od nastanka do modernog doba.','7');
INSERT INTO znamenitost(naziv, opis, staza) VALUES('Rochehaut ','Predivna zelena brda, vijugava reka i gusta šuma čine zadivljujući pejzaž Rochehauta.Pešačenje u okolini je vrlo korisno, podudaranje terena za sve nivoe fitnesa sa sjajnim pogledom.','7');


/*INSERT TABLE planinarsko_drustvo:*/
INSERT INTO planinarsko_drustvo(naziv, telefon, adresa) VALUES('Mladi planinari','770821','Jovana Hadži - Vasiljevića 12');


/*INSERT TABLE clanarina:*/
INSERT INTO clanarina(iznos, od_datum, do_datum, planinar, sekretar, planinarsko_drustvo) VALUES('8400.0','2019-07-02','2020-07-02', '1', '2', '1');
INSERT INTO clanarina(iznos, od_datum, do_datum, planinar, sekretar, planinarsko_drustvo) VALUES('8400.0','2019-11-22','2020-11-22', '4', '6', '2');
INSERT INTO clanarina(iznos, od_datum, do_datum, planinar, sekretar, planinarsko_drustvo) VALUES('8400.0','2019-03-13','2020-03-13', '5', '3', '3');
INSERT INTO clanarina(iznos, od_datum, do_datum, planinar, sekretar, planinarsko_drustvo) VALUES('8400.0','2019-03-08','2020-03-08', '1', '7', '4');
INSERT INTO clanarina(iznos, od_datum, do_datum, planinar, sekretar, planinarsko_drustvo) VALUES('8400.0','2019-06-16','2020-06-16', '4', '3', '5');
INSERT INTO clanarina(iznos, od_datum, do_datum, planinar, sekretar, planinarsko_drustvo) VALUES('8400.0','2019-08-02','2020-08-02', '1', '3', '6');
INSERT INTO clanarina(iznos, od_datum, do_datum, planinar, sekretar, planinarsko_drustvo) VALUES('8400.0','2019-04-22','2020-04-22', '5', '2', '7');

/*INSERT TABLE planinarski_dom:*/
INSERT INTO planinarski_dom(naziv, planina, planinarsko_drustvo) VALUES('Katyusha', '1', '5');
INSERT INTO planinarski_dom(naziv, planina, planinarsko_drustvo) VALUES('Alistair Gordon', '2', '4');
INSERT INTO planinarski_dom(naziv, planina, planinarsko_drustvo) VALUES('Zlato Zlatara', '3', '6');
INSERT INTO planinarski_dom(naziv, planina, planinarsko_drustvo) VALUES('Predov Krst', '4', '2');
INSERT INTO planinarski_dom(naziv, planina, planinarsko_drustvo) VALUES('Castellanopoulos', '5', '3');
INSERT INTO planinarski_dom(naziv, planina, planinarsko_drustvo) VALUES('Krampitz', '6', '7');
INSERT INTO planinarski_dom(naziv, planina, planinarsko_drustvo) VALUES('Ernst', '7', '1');

/*INSERT  TABLE rezervacija:*/
INSERT INTO rezervacija(od_datum, do_datum, planinarski_dom, osoba) VALUES('2019-12-25','2020-01-05','2','4');
INSERT INTO rezervacija(od_datum, do_datum, planinarski_dom, osoba) VALUES('2020-03-01','2020-03-11','4','3');
INSERT INTO rezervacija(od_datum, do_datum, planinarski_dom, osoba) VALUES('2020-06-01','2020-06-01','6','1');
INSERT INTO rezervacija(od_datum, do_datum, planinarski_dom, osoba) VALUES('2020-06-20','2020-07-01','1','7');
INSERT INTO rezervacija(od_datum, do_datum, planinarski_dom, osoba) VALUES('2020-04-11','2020-04-22','3','2');
INSERT INTO rezervacija(od_datum, do_datum, planinarski_dom, osoba) VALUES('2020-09-01','2020-11-01','7','6');
INSERT INTO rezervacija(od_datum, do_datum, planinarski_dom, osoba) VALUES('2020-12-20','2021-01-01','5','5');

/*INSERT TABLE iskustvo:*/
INSERT INTO iskustvo(iskustvo, rezervacija) VALUES('Temperatura bude za nijansu niža nego u dolinama i primetno niža nego u gradovima, vreme je promenljivo. Noći su znatno hladnije, obavezna je garderoba dugih rukava uveče i ujutro.', '1');
INSERT INTO iskustvo(iskustvo, rezervacija) VALUES('Meštani su ljubazni i predusretljivi, hrana dobra, prava domaćinska, kao da ste otišli kod bake na selo... Smeštaj je takođe dobar, sobe su velike i čiste.', '2');
INSERT INTO iskustvo(iskustvo, rezervacija) VALUES('Kada je u pitanju skijanje predstavlja, iznenađujuće mali ski centar, bar kada se uporedi sa drugim skijalištima ovog tipa. Sa ukupno 16 ski liftova i žičarom koja povezuje sve ski staze na dobro usklađen način, što uvek rezultira pozitivnim iskustvom skijaša koji posete ovaj ski centar, jer im olakšava menjanje staza', '3');
INSERT INTO iskustvo(iskustvo, rezervacija) VALUES('Konji su na neki način zaštitini znak ove planine, a možete ih iznajmiti za jahanje na posebnim stazama, iskustvo koje definitvno predstavlja deo neponovljivog šarma Katschberga. Tako da, ako ne želite samo da se prepustite samo skijanju, možete upisati školu jahanja dok ste tamo, bili napolju ili unutra. ', '4');
INSERT INTO iskustvo(iskustvo, rezervacija) VALUES('Tradicionalni šarm, vreli, prirodni termalni izvori, izvanredno skijanje na 2655 m nadmorske visine i staze koje će zadovoljiti i vrlo zahtevne skijaše, aktivan noćni život i kazino, luksuzni wellness centri, moderne prodavnice, restorani.', '5');
INSERT INTO iskustvo(iskustvo, rezervacija) VALUES('Ovaj moderan skijaški centar u poslednjih nekoliko godina doživljava punu ekspanziju. Najbrojniji su turisti iz regiona, ali iz godine u godinu ovde dolazi i sve veći broj turista sa zapada. Odlikuju ga izuzetno uređene staze, odlično održavani ski liftovi, kao i široka ponuda luksuznih hotela. Oni koji se odluče da svoje zimovanje provedu ovde mogu uživati u neverovatnim vidicima i prekrasnoj prirodi.', '6');
INSERT INTO iskustvo(iskustvo, rezervacija) VALUES('Jedna od najlepših i najlekovitijih planina u Evropi pružila je " utočište. Okružena je netaknutom prirodom i šumama javora, smrče, borova...', '7');


/*INSERT TABLE poseta*/
INSERT INTO posjeta(termin, komentar, rezervacija, znamenitost) VALUES('2019-12-28', 'Zanimljivo iskustvo, preporuka svima.', '1','4');
INSERT INTO posjeta(termin, komentar, rezervacija, znamenitost) VALUES('2019-03-03', 'Proleće je divno u ovom kraju!', '4','5');
INSERT INTO posjeta(termin, komentar, rezervacija, znamenitost) VALUES('2018-06-04', 'Odličan izbor za početak godišnjeg odmora!', '3','2');
INSERT INTO posjeta(termin, komentar, rezervacija, znamenitost) VALUES('2019-06-23', 'Jedva čekam sledeću godnu da ponovo dođem.', '6','1');
INSERT INTO posjeta(termin, komentar, rezervacija, znamenitost) VALUES('2019-04-11', 'Veoma prijatno u jeseni.', '2','7');
INSERT INTO posjeta(termin, komentar, rezervacija, znamenitost) VALUES('2019-09-01', 'Veoma hladno vreme, preporuka je dobro se obući!', '5','3');
INSERT INTO posjeta(termin, komentar, rezervacija, znamenitost) VALUES('2019-12-20', 'Pravi ambijent za proslavu nove Godine.', '7','6');





