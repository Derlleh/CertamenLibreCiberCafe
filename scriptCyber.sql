-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema finalcyber
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema finalcyber
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `finalcyber` DEFAULT CHARACTER SET latin1 ;
USE `finalcyber` ;

-- -----------------------------------------------------
-- Table `finalcyber`.`juego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalcyber`.`juego` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_guardado` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `finalcyber`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalcyber`.`cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `pago` INT(11) NULL DEFAULT NULL,
  `inicio` INT(11) NULL DEFAULT NULL,
  `termino` INT(11) NULL DEFAULT NULL,
  `consola` VARCHAR(255) NULL DEFAULT NULL,
  `television` INT(11) NULL DEFAULT NULL,
  `juego` INT(11) NULL DEFAULT NULL,
  `fecha_guardado` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `relacion_1_idx` (`juego` ASC) VISIBLE,
  CONSTRAINT `relacion_1`
    FOREIGN KEY (`juego`)
    REFERENCES `finalcyber`.`juego` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `finalcyber`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalcyber`.`pago` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nuevo_pago` INT(11) NULL DEFAULT NULL,
  `cliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `pago_1_idx` (`cliente` ASC) VISIBLE,
  CONSTRAINT `pago_1`
    FOREIGN KEY (`cliente`)
    REFERENCES `finalcyber`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `finalcyber`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalcyber`.`usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `usuario` VARCHAR(255) NULL DEFAULT NULL,
  `pass` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
