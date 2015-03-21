-- MySQL Script generated by MySQL Workbench
-- 03/21/15 02:34:47
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Media_Player
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Media_Player
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Media_Player` ;
USE `Media_Player` ;

-- -----------------------------------------------------
-- Table `Media_Player`.`Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Media_Player`.`Artist` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Media_Player`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Media_Player`.`Album` (
  `Title` VARCHAR(45) NOT NULL,
  `AlbumCover` LONGBLOB NULL,
  `Artist_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Title`, `Artist_name`),
  INDEX `fk_Album_Artist_idx` (`Artist_name` ASC),
  CONSTRAINT `fk_Album_Artist`
    FOREIGN KEY (`Artist_name`)
    REFERENCES `Media_Player`.`Artist` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Media_Player`.`Song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Media_Player`.`Song` (
  `Title` VARCHAR(45) NOT NULL,
  `numberOfListens` INT NOT NULL DEFAULT 0,
  `Lyrics` VARCHAR(45) NULL,
  `Album_Title` VARCHAR(45) NOT NULL,
  `Album_Artist_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Title`, `Album_Title`, `Album_Artist_name`),
  INDEX `fk_Song_Album1_idx` (`Album_Title` ASC, `Album_Artist_name` ASC),
  UNIQUE INDEX `Lyrics_UNIQUE` (`Lyrics` ASC),
  CONSTRAINT `fk_Song_Album1`
    FOREIGN KEY (`Album_Title` , `Album_Artist_name`)
    REFERENCES `Media_Player`.`Album` (`Title` , `Artist_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Media_Player`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Media_Player`.`Playlist` (
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Media_Player`.`Playlist_has_Song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Media_Player`.`Playlist_has_Song` (
  `Playlist_Name` VARCHAR(45) NOT NULL,
  `Song_Title` VARCHAR(45) NOT NULL,
  `Song_Album_Title` VARCHAR(45) NOT NULL,
  `Song_Album_Artist_name` VARCHAR(45) NOT NULL,
  `FileLocation` TEXT NOT NULL,
  PRIMARY KEY (`Playlist_Name`, `Song_Title`, `Song_Album_Title`, `Song_Album_Artist_name`),
  INDEX `fk_Playlist_has_Song_Song1_idx` (`Song_Title` ASC, `Song_Album_Title` ASC, `Song_Album_Artist_name` ASC),
  INDEX `fk_Playlist_has_Song_Playlist1_idx` (`Playlist_Name` ASC),
  CONSTRAINT `fk_Playlist_has_Song_Playlist1`
    FOREIGN KEY (`Playlist_Name`)
    REFERENCES `Media_Player`.`Playlist` (`Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Playlist_has_Song_Song1`
    FOREIGN KEY (`Song_Title` , `Song_Album_Title` , `Song_Album_Artist_name`)
    REFERENCES `Media_Player`.`Song` (`Title` , `Album_Title` , `Album_Artist_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
