-- 01 Tab. unverbunden

CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`kittens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kitten_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;