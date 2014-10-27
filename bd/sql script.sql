SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `sitap` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sitap` ;

-- -----------------------------------------------------
-- Table `sitap`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `senha` VARCHAR(45) NOT NULL ,
  `Email` VARCHAR(45) NOT NULL ,
  `Endereco` VARCHAR(45) NULL ,
  `Telefone` INT NULL ,
  `Idade` INT NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`artigos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`artigos` (
  `idartigos` INT NOT NULL ,
  `titulo` VARCHAR(45) NULL ,
  `corpo` TEXT NULL ,
  `usuario_idusuario` INT NOT NULL ,
  `like` INT NULL AUTO_INCREMENT COMMENT 'quantidade de curtida q o artigo recebe' ,
  PRIMARY KEY (`idartigos`) ,
  INDEX `fk_artigos_usuario1` (`usuario_idusuario` ASC) ,
  CONSTRAINT `fk_artigos_usuario1`
    FOREIGN KEY (`usuario_idusuario` )
    REFERENCES `sitap`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`fotos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`fotos` (
  `idfotos` INT NOT NULL AUTO_INCREMENT ,
  `idartigos` INT NOT NULL ,
  `arquivo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idfotos`) ,
  INDEX `fk_fotos_artigos1` (`idartigos` ASC) ,
  CONSTRAINT `fk_fotos_artigos1`
    FOREIGN KEY (`idartigos` )
    REFERENCES `sitap`.`artigos` (`idartigos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`categorias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`categorias` (
  `idcategorias` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `decricao` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcategorias`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`comentario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`comentario` (
  `idusuario` INT NOT NULL ,
  `idartigos` INT NOT NULL ,
  `corpo` TEXT NULL ,
  `idcomentario` INT NOT NULL AUTO_INCREMENT ,
  `data` DATETIME NULL ,
  PRIMARY KEY (`idcomentario`) ,
  INDEX `fk_usuario_has_artigos_artigos1` (`idartigos` ASC) ,
  INDEX `fk_usuario_has_artigos_usuario1` (`idusuario` ASC) ,
  CONSTRAINT `fk_usuario_has_artigos_usuario1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `sitap`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artigos_artigos1`
    FOREIGN KEY (`idartigos` )
    REFERENCES `sitap`.`artigos` (`idartigos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`artigos_has_categorias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`artigos_has_categorias` (
  `idartigos` INT NOT NULL ,
  `idcategorias` INT NOT NULL ,
  PRIMARY KEY (`idartigos`, `idcategorias`) ,
  INDEX `fk_artigos_has_categorias_categorias1` (`idcategorias` ASC) ,
  INDEX `fk_artigos_has_categorias_artigos1` (`idartigos` ASC) ,
  CONSTRAINT `fk_artigos_has_categorias_artigos1`
    FOREIGN KEY (`idartigos` )
    REFERENCES `sitap`.`artigos` (`idartigos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artigos_has_categorias_categorias1`
    FOREIGN KEY (`idcategorias` )
    REFERENCES `sitap`.`categorias` (`idcategorias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
