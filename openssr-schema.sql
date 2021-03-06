-- MySQL Script generated by MySQL Workbench
-- Wed Jun  1 01:43:37 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema openssr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema openssr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `openssr` DEFAULT CHARACTER SET utf8 ;
USE `openssr` ;

-- -----------------------------------------------------
-- Table `openssr`.`final_paper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openssr`.`final_paper` (
  `final_paper_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`final_paper_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openssr`.`working_paper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openssr`.`working_paper` (
  `working_paper_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(1000) NOT NULL,
  `final_paper_final_paper_id` INT NOT NULL,
  PRIMARY KEY (`working_paper_id`),
  INDEX `fk_working_paper_final_paper1_idx` (`final_paper_final_paper_id` ASC),
  CONSTRAINT `fk_working_paper_final_paper1`
    FOREIGN KEY (`final_paper_final_paper_id`)
    REFERENCES `openssr`.`final_paper` (`final_paper_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openssr`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openssr`.`account` (
  `account_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`account_id`, `email`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openssr`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openssr`.`person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(200) NOT NULL,
  `last_name` VARCHAR(200) NOT NULL,
  `account_account_id` INT NOT NULL,
  PRIMARY KEY (`person_id`),
  INDEX `fk_person_account1_idx` (`account_account_id` ASC),
  CONSTRAINT `fk_person_account1`
    FOREIGN KEY (`account_account_id`)
    REFERENCES `openssr`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openssr`.`working_paper_authorship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openssr`.`working_paper_authorship` (
  `working_paper_working_paper_id` INT NOT NULL,
  `person_person_id` INT NOT NULL,
  PRIMARY KEY (`working_paper_working_paper_id`, `person_person_id`),
  INDEX `fk_working_paper_has_person_person1_idx` (`person_person_id` ASC),
  INDEX `fk_working_paper_has_person_working_paper1_idx` (`working_paper_working_paper_id` ASC),
  CONSTRAINT `fk_working_paper_has_person_working_paper1`
    FOREIGN KEY (`working_paper_working_paper_id`)
    REFERENCES `openssr`.`working_paper` (`working_paper_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_working_paper_has_person_person1`
    FOREIGN KEY (`person_person_id`)
    REFERENCES `openssr`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openssr`.`final_paper_authorship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openssr`.`final_paper_authorship` (
  `final_paper_final_paper_id` INT NOT NULL,
  `person_person_id` INT NOT NULL,
  PRIMARY KEY (`final_paper_final_paper_id`, `person_person_id`),
  INDEX `fk_final_paper_has_person_person1_idx` (`person_person_id` ASC),
  INDEX `fk_final_paper_has_person_final_paper1_idx` (`final_paper_final_paper_id` ASC),
  CONSTRAINT `fk_final_paper_has_person_final_paper1`
    FOREIGN KEY (`final_paper_final_paper_id`)
    REFERENCES `openssr`.`final_paper` (`final_paper_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_final_paper_has_person_person1`
    FOREIGN KEY (`person_person_id`)
    REFERENCES `openssr`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
