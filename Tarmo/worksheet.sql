-- MySQL Script generated by MySQL Workbench
-- 01/31/15 11:18:03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema worksheet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema worksheet
-- -----------------------------------------------------
CREATE database IF NOT EXISTS `worksheet` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `worksheet` ;


CREATE SCHEMA IF NOT EXISTS `worksheet` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `worksheet` ;

-- -----------------------------------------------------
-- Table `worksheet`.`Personaldata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `worksheet`.`Personaldata` (
  `P_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Manager` TINYINT(1) NOT NULL,
  `Firstname` VARCHAR(45) NOT NULL,
  `Lastname` VARCHAR(45) NOT NULL,
  `Social_Security` BIGINT(11) UNSIGNED NOT NULL,
  `Phone` BIGINT(10) NOT NULL,
  `Mail` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`P_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`P_ID` ASC),
  UNIQUE INDEX `Isikukood_UNIQUE` (`Social_Security` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `worksheet`.`Jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `worksheet`.`Jobs` (
  `J_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`J_ID`),
  UNIQUE INDEX `J_ID_UNIQUE` (`J_ID` ASC),
  UNIQUE INDEX `Description_UNIQUE` (`Description` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `worksheet`.`Done Jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `worksheet`.`Done Jobs` (
  `DJ_ID` INT UNSIGNED NOT NULL,
  `Jobs_J_ID` INT UNSIGNED NOT NULL,
  `Personaldata_P_ID` INT UNSIGNED NOT NULL,
  `Workdate` DATE NOT NULL,
  `Starttime` TIME NOT NULL,
  `Endtime` TIME NOT NULL,
  PRIMARY KEY (`DJ_ID`),
  INDEX `fk_Logindata_has_Jobs_Jobs1_idx` (`Jobs_J_ID` ASC),
  INDEX `fk_Done Jobs_Personaldata1_idx` (`Personaldata_P_ID` ASC),
  UNIQUE INDEX `Logindata_L_ID_UNIQUE` (`DJ_ID` ASC),
  CONSTRAINT `fk_Logindata_has_Jobs_Jobs1`
    FOREIGN KEY (`Jobs_J_ID`)
    REFERENCES `worksheet`.`Jobs` (`J_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Done Jobs_Personaldata1`
    FOREIGN KEY (`Personaldata_P_ID`)
    REFERENCES `worksheet`.`Personaldata` (`P_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
