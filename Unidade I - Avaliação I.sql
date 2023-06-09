-- MySQL Script generated by MySQL Workbench
-- Sat Apr  2 14:31:51 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema empresa_unp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema empresa_unp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empresa_unp` DEFAULT CHARACTER SET utf8 ;
USE `empresa_unp` ;

-- -----------------------------------------------------
-- Table `empresa_unp`.`projetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_unp`.`projetos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `abreviatura` VARCHAR(15) NOT NULL,
  `descricao` VARCHAR(50) NULL,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa_unp`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_unp`.`cargos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(30) NOT NULL,
  `salario` FLOAT NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa_unp`.`setores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_unp`.`setores` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa_unp`.`empregados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_unp`.`empregados` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `cargos_codigo` INT NOT NULL,
  `setores_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `cargos_codigo`, `setores_codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_empregados_cargos_idx` (`cargos_codigo` ASC) VISIBLE,
  INDEX `fk_empregados_setores1_idx` (`setores_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_empregados_cargos`
    FOREIGN KEY (`cargos_codigo`)
    REFERENCES `empresa_unp`.`cargos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empregados_setores1`
    FOREIGN KEY (`setores_codigo`)
    REFERENCES `empresa_unp`.`setores` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empresa_unp`.`empregados_do_projetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_unp`.`empregados_do_projetos` (
  `projetos_codigo` INT NOT NULL,
  `empregados_codigo` INT NOT NULL,
  PRIMARY KEY (`projetos_codigo`, `empregados_codigo`),
  CONSTRAINT `fk_empregados_has_projetos_empregados1`
    FOREIGN KEY (`empregados_codigo` , `projetos_codigo`)
    REFERENCES `empresa_unp`.`empregados` (`codigo` , `codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empregados_has_projetos_projetos1`
    FOREIGN KEY (`empregados_codigo` , `projetos_codigo`)
    REFERENCES `empresa_unp`.`projetos` (`codigo` , `codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
