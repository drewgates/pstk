-- MySQL Script generated by MySQL Workbench
-- 02/14/15 11:55:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema kalad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kalad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kalad` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `kalad` ;

-- -----------------------------------------------------
-- Table `kalad`.`klass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kalad`.`klass` (
  `id_klass` INT NOT NULL,
  `klass` VARCHAR(45) NULL,
  `ladin` VARCHAR(45) NULL,
  PRIMARY KEY (`id_klass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kalad`.`sugukond`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kalad`.`sugukond` (
  `id_sugukond` INT NOT NULL,
  `snimi` VARCHAR(45) NULL,
  `ladin` VARCHAR(45) NULL,
  `klass_id_klass` INT NOT NULL,
  PRIMARY KEY (`id_sugukond`),
  INDEX `fk_sugukond_klass1_idx` (`klass_id_klass` ASC),
  CONSTRAINT `fk_sugukond_klass1`
    FOREIGN KEY (`klass_id_klass`)
    REFERENCES `kalad`.`klass` (`id_klass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kalad`.`kala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kalad`.`kala` (
  `id_kala` INT NOT NULL,
  `nimetus` VARCHAR(45) NULL,
  `Ladinakeelne` VARCHAR(45) NULL,
  `sugukond_id_sugukond` INT NOT NULL,
  PRIMARY KEY (`id_kala`),
  INDEX `fk_kala_sugukond1_idx` (`sugukond_id_sugukond` ASC),
  CONSTRAINT `fk_kala_sugukond1`
    FOREIGN KEY (`sugukond_id_sugukond`)
    REFERENCES `kalad`.`sugukond` (`id_sugukond`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kalad`.`elukoht`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kalad`.`elukoht` (
  `id_elukoht` INT NOT NULL,
  `elukoht` VARCHAR(45) NULL,
  PRIMARY KEY (`id_elukoht`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kalad`.`kala_has_elukoht`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kalad`.`kala_has_elukoht` (
  `kala_id_kala` INT NOT NULL,
  `elukoht_id_elukoht` INT NOT NULL,
  PRIMARY KEY (`kala_id_kala`),
  INDEX `fk_kala_has_elukoht_kala1_idx` (`kala_id_kala` ASC),
  INDEX `fk_kala_has_elukoht_elukoht1_idx` (`elukoht_id_elukoht` ASC),
  CONSTRAINT `fk_kala_has_elukoht_kala1`
    FOREIGN KEY (`kala_id_kala`)
    REFERENCES `kalad`.`kala` (`id_kala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kala_has_elukoht_elukoht1`
    FOREIGN KEY (`elukoht_id_elukoht`)
    REFERENCES `kalad`.`elukoht` (`id_elukoht`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `kalad`.`klass`
-- -----------------------------------------------------
START TRANSACTION;
USE `kalad`;
INSERT INTO `kalad`.`klass` (`id_klass`, `klass`, `ladin`) VALUES (1, NULL, 'Thelodonti');
INSERT INTO `kalad`.`klass` (`id_klass`, `klass`, `ladin`) VALUES (2, NULL, 'Anaspida');
INSERT INTO `kalad`.`klass` (`id_klass`, `klass`, `ladin`) VALUES (3, NULL, 'Galeaspida');
INSERT INTO `kalad`.`klass` (`id_klass`, `klass`, `ladin`) VALUES (4, NULL, 'Pituriaspida');
INSERT INTO `kalad`.`klass` (`id_klass`, `klass`, `ladin`) VALUES (5, NULL, 'Osteostraci');

COMMIT;


-- -----------------------------------------------------
-- Data for table `kalad`.`sugukond`
-- -----------------------------------------------------
START TRANSACTION;
USE `kalad`;
INSERT INTO `kalad`.`sugukond` (`id_sugukond`, `snimi`, `ladin`, `klass_id_klass`) VALUES (1, 'Silmulised ', 'Petromyzontiformes', 1);
INSERT INTO `kalad`.`sugukond` (`id_sugukond`, `snimi`, `ladin`, `klass_id_klass`) VALUES (2, 'Tuuralised', 'Acipenseriformes', 2);
INSERT INTO `kalad`.`sugukond` (`id_sugukond`, `snimi`, `ladin`, `klass_id_klass`) VALUES (3, 'Heeringalised', 'Clupeiformes', 3);
INSERT INTO `kalad`.`sugukond` (`id_sugukond`, `snimi`, `ladin`, `klass_id_klass`) VALUES (4, ' Anšoovislased ', 'Engraulidae', 4);
INSERT INTO `kalad`.`sugukond` (`id_sugukond`, `snimi`, `ladin`, `klass_id_klass`) VALUES (5, 'Lõhelised ', 'Salmoniformes', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kalad`.`kala`
-- -----------------------------------------------------
START TRANSACTION;
USE `kalad`;
INSERT INTO `kalad`.`kala` (`id_kala`, `nimetus`, `Ladinakeelne`, `sugukond_id_sugukond`) VALUES (1, 'Siig', 'Coregonus lavaretus lavaretus L.', 1);
INSERT INTO `kalad`.`kala` (`id_kala`, `nimetus`, `Ladinakeelne`, `sugukond_id_sugukond`) VALUES (2, 'Ahven', 'Perca fluviatilis', 2);
INSERT INTO `kalad`.`kala` (`id_kala`, `nimetus`, `Ladinakeelne`, `sugukond_id_sugukond`) VALUES (3, 'Särg', 'Rutilus rutilus', 3);
INSERT INTO `kalad`.`kala` (`id_kala`, `nimetus`, `Ladinakeelne`, `sugukond_id_sugukond`) VALUES (4, 'Haug', 'Esox lucius', 4);
INSERT INTO `kalad`.`kala` (`id_kala`, `nimetus`, `Ladinakeelne`, `sugukond_id_sugukond`) VALUES (5, 'Räim', 'Clupea harengus membras', 5);
INSERT INTO `kalad`.`kala` (`id_kala`, `nimetus`, `Ladinakeelne`, `sugukond_id_sugukond`) VALUES (6, 'Lõhe', 'Salmo salar', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kalad`.`elukoht`
-- -----------------------------------------------------
START TRANSACTION;
USE `kalad`;
INSERT INTO `kalad`.`elukoht` (`id_elukoht`, `elukoht`) VALUES (1, 'Meri');
INSERT INTO `kalad`.`elukoht` (`id_elukoht`, `elukoht`) VALUES (2, 'Järv');
INSERT INTO `kalad`.`elukoht` (`id_elukoht`, `elukoht`) VALUES (3, 'Jõgi');

COMMIT;


-- -----------------------------------------------------
-- Data for table `kalad`.`kala_has_elukoht`
-- -----------------------------------------------------
START TRANSACTION;
USE `kalad`;
INSERT INTO `kalad`.`kala_has_elukoht` (`kala_id_kala`, `elukoht_id_elukoht`) VALUES (1, 1);
INSERT INTO `kalad`.`kala_has_elukoht` (`kala_id_kala`, `elukoht_id_elukoht`) VALUES (2, 3);
INSERT INTO `kalad`.`kala_has_elukoht` (`kala_id_kala`, `elukoht_id_elukoht`) VALUES (3, 3);
INSERT INTO `kalad`.`kala_has_elukoht` (`kala_id_kala`, `elukoht_id_elukoht`) VALUES (4, 2);

COMMIT;

