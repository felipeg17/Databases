CREATE SCHEMA `platziblog` DEFAULT CHARACTER SET utf8;

CREATE TABLE `platziblog`.`categorias`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `platziblog`.`etiquetas`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `platziblog`.`usuarios`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));

CREATE TABLE `platziblog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(130) NOT NULL,
  `fecha_publicacion` TIMESTAMP NULL,
  `contenido` TEXT NOT NULL,
  `status` CHAR(8) NULL DEFAULT 'activo',
  `usuario_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`));

-- Agregar llave foranea para conectar posts con usuarios --
ALTER TABLE `platziblog`.`posts` 
ADD INDEX `posts_usuarios_idx` (`usuario_id` ASC);

ALTER TABLE `platziblog`.`posts`
ADD CONSTRAINT `posts_usuarios`
	FOREIGN KEY (`usuario_id`)
    REFERENCES `platziblog`.`usuarios`(`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;

-- Agregar llave foranea para conectar posts con categorias --
ALTER TABLE `platziblog`.`posts` 
ADD INDEX `posts_categorias_idx` (`categoria_id` ASC);

ALTER TABLE `platziblog`.`posts`
ADD CONSTRAINT `posts_categorias`
	FOREIGN KEY (`categoria_id`)
    REFERENCES `platziblog`.`categorias`(`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;

-- Creacion de tabla comentarios --
CREATE TABLE `platziblog`.`comentarios`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuerpo_comentario` TEXT NOT NULL,
  `usuario_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`));

-- Agregar llave foranea para conectar comentarios con posts --
ALTER TABLE `platziblog`.`comentarios` 
ADD INDEX `posts_post_idx` (`post_id` ASC);

ALTER TABLE `platziblog`.`comentarios`
ADD CONSTRAINT `comentarios_post`
	FOREIGN KEY (`post_id`)
    REFERENCES `platziblog`.`posts`(`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;

-- Crear tabla pivote para enlazar posts y etiquetas --    
CREATE TABLE `platziblog.posts_etiquetas`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `post_id` INT NOT NULL,
    `etiqueta_id` INT NOT NULL,
	PRIMARY KEY(`id`));
    
-- Agregar llaves foreneas --
ALTER TABLE `platziblog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_post_idx` (`post_id` ASC);

ALTER TABLE `platziblog`.`posts_etiquetas`
ADD CONSTRAINT `postsetiquetas_posts`
	FOREIGN KEY (`post_id`)
    REFERENCES `platziblog`.`posts`(`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
    
ALTER TABLE `platziblog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_etiqueta_idx` (`etiqueta_id` ASC);

ALTER TABLE `platziblog`.`posts_etiquetas`
ADD CONSTRAINT `postsetiquetas_etiquetas`
	FOREIGN KEY (`etiqueta_id`)
    REFERENCES `platziblog`.`etiquetas`(`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;