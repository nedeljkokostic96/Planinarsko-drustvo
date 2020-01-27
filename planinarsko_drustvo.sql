-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema planinarsko_drustvo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema planinarsko_drustvo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `planinarsko_drustvo` DEFAULT CHARACTER SET utf8 ;
USE `planinarsko_drustvo` ;

-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`planina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`planina` (
  `planina_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `drzava` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`planina_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`staza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`staza` (
  `staza_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `tezina` INT NOT NULL,
  `mapa` MEDIUMBLOB NULL,
  `planina` INT NOT NULL,
  PRIMARY KEY (`staza_id`),
  INDEX `fk_staza_planina_idx` (`planina` ASC) VISIBLE,
  CONSTRAINT `fk_staza_planina`
    FOREIGN KEY (`planina`)
    REFERENCES `planinarsko_drustvo`.`planina` (`planina_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`planinarsko_drustvo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`planinarsko_drustvo` (
  `planinarsko_drustvo_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`planinarsko_drustvo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`planinarski_dom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`planinarski_dom` (
  `planinarski_dom_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `planina` INT NOT NULL,
  `planinarsko_drustvo` INT NOT NULL,
  PRIMARY KEY (`planinarski_dom_id`),
  INDEX `fk_planinarski_dom_planina1_idx` (`planina` ASC) VISIBLE,
  INDEX `fk_planinarski_dom_planinarsko_drustvo1_idx` (`planinarsko_drustvo` ASC) VISIBLE,
  CONSTRAINT `fk_planinarski_dom_planina1`
    FOREIGN KEY (`planina`)
    REFERENCES `planinarsko_drustvo`.`planina` (`planina_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planinarski_dom_planinarsko_drustvo1`
    FOREIGN KEY (`planinarsko_drustvo`)
    REFERENCES `planinarsko_drustvo`.`planinarsko_drustvo` (`planinarsko_drustvo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`uloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`uloga` (
  `uloga_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uloga_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`osoba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`osoba` (
  `osoba_id` INT NOT NULL AUTO_INCREMENT,
  `jmbg` VARCHAR(13) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `datum_rodjenja` DATETIME NOT NULL,
  `broj_telefona` VARCHAR(45) NOT NULL,
  `uloga` INT NOT NULL,
  PRIMARY KEY (`osoba_id`),
  INDEX `fk_osoba_uloga1_idx` (`uloga` ASC) VISIBLE,
  CONSTRAINT `fk_osoba_uloga1`
    FOREIGN KEY (`uloga`)
    REFERENCES `planinarsko_drustvo`.`uloga` (`uloga_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`clanarina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`clanarina` (
  `clanarina_id` INT NOT NULL AUTO_INCREMENT,
  `iznos` FLOAT NULL,
  `od_datum` DATETIME NULL,
  `do_datum` DATETIME NULL,
  `planinar` INT NOT NULL,
  `sekretar` INT NOT NULL,
  `planinarsko_drustvo` INT NOT NULL,
  PRIMARY KEY (`clanarina_id`),
  INDEX `fk_clanarina_osoba1_idx` (`planinar` ASC) VISIBLE,
  INDEX `fk_clanarina_osoba2_idx` (`sekretar` ASC) VISIBLE,
  INDEX `fk_clanarina_planinarsko_drustvo1_idx` (`planinarsko_drustvo` ASC) VISIBLE,
  CONSTRAINT `fk_clanarina_osoba1`
    FOREIGN KEY (`planinar`)
    REFERENCES `planinarsko_drustvo`.`osoba` (`osoba_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clanarina_osoba2`
    FOREIGN KEY (`sekretar`)
    REFERENCES `planinarsko_drustvo`.`osoba` (`osoba_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clanarina_planinarsko_drustvo1`
    FOREIGN KEY (`planinarsko_drustvo`)
    REFERENCES `planinarsko_drustvo`.`planinarsko_drustvo` (`planinarsko_drustvo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`rezervacija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`rezervacija` (
  `rezervacija_id` INT NOT NULL AUTO_INCREMENT,
  `od_datum` DATETIME NOT NULL,
  `do_datum` DATETIME NOT NULL,
  `planinarski_dom` INT NOT NULL,
  `osoba` INT NOT NULL,
  PRIMARY KEY (`rezervacija_id`),
  INDEX `fk_rezervacija_planinarski_dom1_idx` (`planinarski_dom` ASC) VISIBLE,
  INDEX `fk_rezervacija_osoba1_idx` (`osoba` ASC) VISIBLE,
  CONSTRAINT `fk_rezervacija_planinarski_dom1`
    FOREIGN KEY (`planinarski_dom`)
    REFERENCES `planinarsko_drustvo`.`planinarski_dom` (`planinarski_dom_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rezervacija_osoba1`
    FOREIGN KEY (`osoba`)
    REFERENCES `planinarsko_drustvo`.`osoba` (`osoba_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`iskustvo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`iskustvo` (
  `iskustvo_id` INT NOT NULL AUTO_INCREMENT,
  `iskustvo` TEXT NOT NULL,
  `rezervacija` INT NOT NULL,
  PRIMARY KEY (`iskustvo_id`),
  INDEX `fk_iskustvo_rezervacija1_idx` (`rezervacija` ASC) VISIBLE,
  CONSTRAINT `fk_iskustvo_rezervacija1`
    FOREIGN KEY (`rezervacija`)
    REFERENCES `planinarsko_drustvo`.`rezervacija` (`rezervacija_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`znamenitost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`znamenitost` (
  `znamenitost_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` TEXT NOT NULL,
  `staza` INT NOT NULL,
  PRIMARY KEY (`znamenitost_id`),
  INDEX `fk_znamenitost_staza1_idx` (`staza` ASC) VISIBLE,
  CONSTRAINT `fk_znamenitost_staza1`
    FOREIGN KEY (`staza`)
    REFERENCES `planinarsko_drustvo`.`staza` (`staza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`posjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`posjeta` (
  `posjeta_id` INT NOT NULL AUTO_INCREMENT,
  `termin` DATETIME NULL,
  `komentar` TEXT NULL,
  `rezervacija` INT NOT NULL,
  `znamenitost` INT NOT NULL,
  PRIMARY KEY (`posjeta_id`),
  INDEX `fk_posjeta_rezervacija1_idx` (`rezervacija` ASC) VISIBLE,
  INDEX `fk_posjeta_znamenitost1_idx` (`znamenitost` ASC) VISIBLE,
  CONSTRAINT `fk_posjeta_rezervacija1`
    FOREIGN KEY (`rezervacija`)
    REFERENCES `planinarsko_drustvo`.`rezervacija` (`rezervacija_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posjeta_znamenitost1`
    FOREIGN KEY (`znamenitost`)
    REFERENCES `planinarsko_drustvo`.`znamenitost` (`znamenitost_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planinarsko_drustvo`.`slika`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `planinarsko_drustvo`.`slika` (
  `slika_id` INT NOT NULL AUTO_INCREMENT,
  `slika` MEDIUMBLOB NOT NULL,
  `iskustvo` INT NULL,
  `znamenitost` INT NULL,
  PRIMARY KEY (`slika_id`),
  INDEX `fk_slika_iskustvo1_idx` (`iskustvo` ASC) VISIBLE,
  INDEX `fk_slika_znamenitost1_idx` (`znamenitost` ASC) VISIBLE,
  CONSTRAINT `fk_slika_iskustvo1`
    FOREIGN KEY (`iskustvo`)
    REFERENCES `planinarsko_drustvo`.`iskustvo` (`iskustvo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_slika_znamenitost1`
    FOREIGN KEY (`znamenitost`)
    REFERENCES `planinarsko_drustvo`.`znamenitost` (`znamenitost_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
