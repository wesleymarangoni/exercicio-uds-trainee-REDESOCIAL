-- MySQL Script generated by MySQL Workbench
-- Mon Jul  9 20:08:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema REDE_SOCIAL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema REDE_SOCIAL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `REDE_SOCIAL` DEFAULT CHARACTER SET latin1 ;
USE `REDE_SOCIAL` ;

-- -----------------------------------------------------
-- Table `REDE_SOCIAL`.`PESSOA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `REDE_SOCIAL`.`PESSOA` (
  `ID_PESSOA` INT(11) NOT NULL,
  `NOME` VARCHAR(255) NULL DEFAULT NULL,
  `SOBRENOME` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_PESSOA`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `REDE_SOCIAL`.`POSTAGEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `REDE_SOCIAL`.`POSTAGEM` (
  `ID_POSTAGEM` INT(11) NOT NULL,
  `CONTEUDO` VARCHAR(255) NULL DEFAULT NULL,
  `ID_PESSOA` INT(11) NOT NULL,
  PRIMARY KEY (`ID_POSTAGEM`),
  INDEX `ID_PESSOA` (`ID_PESSOA` ASC),
  CONSTRAINT `POSTAGEM_ibfk_1`
    FOREIGN KEY (`ID_PESSOA`)
    REFERENCES `REDE_SOCIAL`.`PESSOA` (`ID_PESSOA`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `REDE_SOCIAL`.`COMENTARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `REDE_SOCIAL`.`COMENTARIO` (
  `ID_COMENTARIO` INT(11) NOT NULL AUTO_INCREMENT,
  `CONTEUDO_COMENTARIO` VARCHAR(255) NULL DEFAULT NULL,
  `ID_POSTAGEM` INT(11) NULL DEFAULT NULL,
  `ID_PESSOA` INT(11) NOT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  INDEX `ID_PESSOA` (`ID_PESSOA` ASC),
  INDEX `ID_POSTAGEM` (`ID_POSTAGEM` ASC),
  CONSTRAINT `COMENTARIO_ibfk_1`
    FOREIGN KEY (`ID_PESSOA`)
    REFERENCES `REDE_SOCIAL`.`PESSOA` (`ID_PESSOA`),
  CONSTRAINT `COMENTARIO_ibfk_2`
    FOREIGN KEY (`ID_POSTAGEM`)
    REFERENCES `REDE_SOCIAL`.`POSTAGEM` (`ID_POSTAGEM`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `REDE_SOCIAL`.`COMPARTILHAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `REDE_SOCIAL`.`COMPARTILHAMENTO` (
  `ID_COMPARTILHAMENTO` INT(11) NOT NULL,
  `CONTEUDO_COMPARTILHADO` VARCHAR(255) NULL DEFAULT NULL,
  `ID_POSTAGEM` INT(11) NULL DEFAULT NULL,
  `ID_PESSOA` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_COMPARTILHAMENTO`),
  INDEX `ID_POSTAGEM` (`ID_POSTAGEM` ASC),
  INDEX `ID_PESSOA` (`ID_PESSOA` ASC),
  CONSTRAINT `COMPARTILHAMENTO_ibfk_1`
    FOREIGN KEY (`ID_POSTAGEM`)
    REFERENCES `REDE_SOCIAL`.`POSTAGEM` (`ID_POSTAGEM`),
  CONSTRAINT `COMPARTILHAMENTO_ibfk_2`
    FOREIGN KEY (`ID_PESSOA`)
    REFERENCES `REDE_SOCIAL`.`PESSOA` (`ID_PESSOA`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `REDE_SOCIAL`.`LIKE_POSTAGEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `REDE_SOCIAL`.`LIKE_POSTAGEM` (
  `ID_LIKE_POST` INT(11) NOT NULL,
  `ID_POSTAGEM` INT(11) NULL DEFAULT NULL,
  `ID_PESSOA` INT(11) NOT NULL,
  PRIMARY KEY (`ID_LIKE_POST`),
  INDEX `ID_PESSOA` (`ID_PESSOA` ASC),
  INDEX `ID_POSTAGEM` (`ID_POSTAGEM` ASC),
  CONSTRAINT `LIKE_POSTAGEM_ibfk_1`
    FOREIGN KEY (`ID_PESSOA`)
    REFERENCES `REDE_SOCIAL`.`PESSOA` (`ID_PESSOA`),
  CONSTRAINT `LIKE_POSTAGEM_ibfk_2`
    FOREIGN KEY (`ID_POSTAGEM`)
    REFERENCES `REDE_SOCIAL`.`POSTAGEM` (`ID_POSTAGEM`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
