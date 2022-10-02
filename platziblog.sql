CREATE SCHEMA `platziblog` DEFAULT CHARACTER SET utf8;

CREATE TABLE `platziblog`.`people` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(255) NULL,
  `first_name` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  PRIMARY KEY (`person_id`));

INSERT INTO platziblog.people (last_name, first_name, address, city)
VALUES('Vasquez','Israel','Reforma 222','Mexico'),
('Alanis','Edgar','Avenida siempreviva','Morelia'),
('Hernandez','Monica','Pensilvania 1600','Aguascalientes'),
('Hernandez','Laura','Calle 21','Monterrey');

update people set last_name = 'Chavez', city = 'Merida' where person_id = 1;