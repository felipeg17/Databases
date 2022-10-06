**Motivation and personal thoughts**
<details><summary>Read it under your own liability</summary><p>

I have been doing a couple of online tutorials, and I have learned some stuff indeed, but after a couple of weeks if I don't use that knowledge it simply disappears. In order to really 'last', I came back to the roots, to the very beggining, a humble man with just a desire of learning, no prior experience, no degrees, no names.

I started the repos with [ROS tutorials](https://github.com/fegonzalez7/rob_unal_clase2), it kinda worked, actually they are my legacy on robotics, but now I want something for myself. A couple of things:
 - **Why english?:** The real answer should be why not?...I need to improve it.
 - **Why DB and SQL?:** Because a do not know a dam* thing about it, so I am starting from scratch.
 - **Why a repo poorly coded and badly commented?:** Well, there should be probably hundreds of books about these topics, but they are not mine, plus this is my way.

 *Disclaimer:* I will never say that a random [*chick*](https://github.com/ariasAleia?tab=repositories) was right about this. It seems that I am recovering the licence to <*insert some sh#t*>.
</p></details></br>

# Databases


## Intro Databases

## Relational Databases

### SQL

### RDBMS
  * MySQL
  * PostgreSQL

### DDL (Data Definition Language)

It is a set of commands to create and modify the objects of a DB. They are quite useful on the DB definition, but then they lose participation. 

- *CREATE:* It creates a table or a schema

```sql
-- A schema named platziblog is created, utf8 is efine as default character set to store the information 
CREATE SCHEMA `platziblog` DEFAULT CHARACTER SET utf8;
```

```sql
-- A table named people is created in the platziblog schema. Five colums are created 
-- person_id: integer, primary id, not null and auto increment 
-- last_name: char of max 255 not null 
-- first_name: char of max 255 not null 
-- address: char of max 255 not null 
-- city: char of max 255 not null 
CREATE TABLE `platziblog`.`people` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`person_id`));
```

- *ALTER:* It modifies parameters inside table or a schema, such as name, columns.

```sql
-- Change the name of a table
ALTER TABLE `platziblog`.`people` 
RENAME TO  `platziblog`.`people_aux` ;
```

```sql
-- Add a new column to a table
ALTER TABLE `platziblog`.`people` 
ADD COLUMN `phone` INT NOT NULL AFTER `city`;
```

- *DROP:* It deletes a DB, it **must** be used carefully. 

### DDML (Data Manipulation Language)

It is a set of commands to manipulate de DB. Once the DDB has been created they are the innstructions to interact with the DB, mainly the tables.

- *SELECT:* Probably the most used command it returns data rom a source (normally a table) according to a defined criteria.

```sql
-- Projects all data contained in table people
SELECT * FROM `platziblog.pleople`
```

```sql
-- Projects the column first_name as nombre 
SELECT `first_name` AS `nombre` FROM `platziblog.pleople`
```

```sql
-- Projects data from the column first_name that meet the criteria person_id = 1
SELECT first_name AS nombre FROM `platziblog.pleople` WHERE person_id = 1;
```

- *INSERT:* It populates a table. Columns must be selected and data types must agree.

```sql
-- Populates 4 columns with values
INSERT INTO `platziblog.people` (last_name, first_name, address, city)
VALUES ('Hernandez','Monica','Pensilvania 1600', 'Aguascalientes'),
('Hernandez','Laura','Calle 21','Monterrey');
```

- *UPDATE*
- *DELETE*

#### Installation process

 - **Windows:** Probably the easiest, just go [here](https://dev.mysql.com/downloads/windows/installer/5.6.html) download and make your custom install. I had some troubles with it, the login in procedure fails a lot, so I switch to linux.
 - **Linux:** I struggled a lot, but I found a good [tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04). Follow the steps as close as possible, I spent like 4 hours because I wannted to do it my way. **Pro tip:** MySQL Workbench for linux coulb be buggy in terms of GUI, so try to find hidden panels.
 - **Mac**

#### Database structure


 - **Squema:** It is basically the DB, you can ddefine rules, filters, among others. A schema contains tables, views, functions and proceddures.
 - **Table:** It is a matrix of information, it is comprisedd of colums that represent a certain type of data (INT, CHAR, TEXT, TIME) and rows, which are the actual data in the table. 
 - **Queries:** They are the core of SQL (Structured Query). They are a set of commads used to look up for certain info in the tables. 

#### Example
The idea is to create a DB for a blog. The variable types and their realationships are defined as follows:

<img src="https://i.postimg.cc/ydZ96f1p/Screenshot-from-2022-10-02-16-34-12.png" alt="DB Diagram for a blog" width="560" height="380">

So get into the code:

```sql 
-- Create the schema
CREATE SCHEMA `platziblog` DEFAULT CHARACTER SET utf8;

-- Create the tables
-- email column has to be unique (no repeated entries)
CREATE TABLE `platziblog`.`usuarios`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));

-- status can be null by default 'activo'
CREATE TABLE `platziblog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(130) NOT NULL,
  `fecha_publicacion` TIMESTAMP NULL,
  `contenido` TEXT NOT NULL,
  `estatus` CHAR(8) NULL DEFAULT 'activo',
  `usuario_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `platziblog`.`categorias`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `platziblog`.`etiquetas`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `platziblog`.`comentarios`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuerpo_comentario` TEXT NOT NULL,
  `usuario_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`));
```

Now the tricky part, because there are multiple dependencies or 'relations' between **comentarios** and **posts** it is neccesary to insert a foreing key into table **comentarios**.

```sql
--- A new index is added
ALTER TABLE `platziblog`.`comentarios` 
ADD INDEX `posts_post_idx` (`post_id` ASC);

--- column post_id is brought as a foreign key 
ALTER TABLE `platziblog`.`comentarios`
ADD CONSTRAINT `comentarios_post`
	FOREIGN KEY (`post_id`)
    REFERENCES `platziblog`.`posts`(`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
```
**Note:** my_sql workbench on Linux is kinda buggy, so I could not make the process using the GUI, it was by code.

<details><summary>Proof</summary><p>
<img src="https://i.postimg.cc/y8K0LKGy/Screenshot-from-2022-10-05-20-44-53.png" width="640" height="256">
</p></details></br>

Time to populate the table, refer to [populate_tables.sql](populate_tables.sql)

Let's try some queries:

```sql
--- projects 3 columns changing the name
SELECT titulo AS encabezado, fecha_publicacion AS publicado_en, estatus AS estado 
FROM posts;
```
<details><summary>result</summary><p>
<img src="https://i.postimg.cc/cHDhvBQj/Screenshot-from-2022-10-05-22-41-33.png" width="640" height="400">
</p></details></br>

```sql
--- counts the number of entries of table posts
SELECT COUNT(*) AS numero_posts 
FROM platziblog.posts;
```
<details><summary>result</summary><p>
<img src="https://i.postimg.cc/DyNNjn4D/Screenshot-from-2022-10-05-22-41-44.png" width="640" height="255">
</p></details></br>


