
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;

CREATE TABLE IF NOT EXISTS `mydb`.`testuser` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;

DESCRIBE `mydb`.`testuser`;

INSERT INTO `mydb`.`testuser` (`username`) VALUES ("Stefanie");
INSERT INTO `mydb`.`testuser` (`username`) VALUES ("Holger");
INSERT INTO `mydb`.`testuser` (`username`) VALUES ("Fatih");
#INSERT INTO `mydb`.`testuser` (`username`) VALUES ("Fatih");

SELECT * FROM `mydb`.`testuser`;