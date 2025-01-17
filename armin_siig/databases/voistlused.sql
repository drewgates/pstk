-- MySQL Script generated by MySQL Workbench
-- 02/14/15 16:27:37
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `competition` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `competition` ;

-- -----------------------------------------------------
-- Table `mydb`.`schools`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competition`.`schools` (
  `id_school` INT NOT NULL,
  `school_name` CHAR(50) NULL,
  PRIMARY KEY (`id_school`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`participatants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competition`.`participatants` (
  `id_participaters` INT NOT NULL,
  `name` CHAR(50) NULL,
  `second_name` CHAR(50) NULL,
  `year` YEAR NULL,
  `schools_id_school` INT NOT NULL,
  PRIMARY KEY (`id_participaters`),
  INDEX `fk_participaters_schools1_idx` (`schools_id_school` ASC),
  CONSTRAINT `fk_participaters_schools1`
    FOREIGN KEY (`schools_id_school`)
    REFERENCES `competition`.`schools` (`id_school`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competition`.`contests` (
  `idcontest` INT NOT NULL,
  `contest_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idcontest`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`participatants_has_contests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competition`.`participatants_has_contests` (
  `participatants_id_participaters` INT NOT NULL,
  `participatants_scores_id_scores` INT NOT NULL,
  `participatants_schools_id_school` INT NOT NULL,
  `contests_idcontest` INT NOT NULL,
  `first_attempt` FLOAT(3,2) NULL,
  `second_attempt` FLOAT(3,2) NULL,
  `third_attempt` FLOAT(3,2) NULL,
  PRIMARY KEY (`participatants_id_participaters`, `participatants_scores_id_scores`, `participatants_schools_id_school`, `contests_idcontest`),
  INDEX `fk_participatants_has_contests_contests1_idx` (`contests_idcontest` ASC),
  INDEX `fk_participatants_has_contests_participatants1_idx` (`participatants_id_participaters` ASC, `participatants_scores_id_scores` ASC, `participatants_schools_id_school` ASC),
  CONSTRAINT `fk_participatants_has_contests_participatants1`
    FOREIGN KEY (`participatants_id_participaters` , `participatants_scores_id_scores` , `participatants_schools_id_school`)
    REFERENCES `competition`.`participatants` (`id_participaters` , `scores_id_scores` , `schools_id_school`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participatants_has_contests_contests1`
    FOREIGN KEY (`contests_idcontest`)
    REFERENCES `competiton`.`contests` (`idcontest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


Start transaction;
use voistlus;
insert into `schools` (`id_school`, `school_name`) values (1, 'Tallina Järveotsa Gümnaasium');
insert into `schools` (`id_school`, `school_name`) values (2, 'Rocca al Mare Kool');
insert into `schools` (`id_school`, `school_name`) values (3, 'Vanalinna Hariduskolleegium');
insert into `schools` (`id_school`, `school_name`) values (4, 'Erakool Läte õpetaja');

insert into `contests` (`idcontest`,`contest_name`) values (1, 'Lamades surumises');
insert into `contests` (`idcontest`,`contest_name`) values (2, 'Selili surumises');

insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (1, 'Markus', 'Sanglepp', 1996, 4, 4);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (2, 'Jekaterina', 'Gritsinina', 1995, 117,50, 3);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (3, 'Raimond', 'Pääru', 1995);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (4, 'Karl', 'Madisson', 1994, 55, 2);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (5, 'Marten', 'Toll', 1998, 45,50, 4);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (6, 'Andreas', 'Lanno', 1994, 80, 4);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (7, 'Emil Roland', 'Peetsalu', 1998, 105, 1);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (8, 'Daniel Erik', 'Raidjõie', 1999, 56, 3);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (9, 'Tristan', 'Reesar', 1995, 117,50, 2);
insert into `participaters` (`id_participaters`, `name`, `second_name`, `year`, `scores_id_scores`, `schools_id_school`) values (10, 'gabriel', 'lansberg', 1994, 62,50, 3);

insert into