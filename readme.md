**Motivation and personal thoughts**
<details><summary>Read it under your own liability</summary><p>

I have been doing a couple of online tutorials, and I have learned some stuff indeed, but after a couple of weeks if I don´t use that knowledge it simply disappears. In order to really 'last', I came back to the roots, to the very beggining, a humble man with just a desire of learning, no prior experience, no degrees, no names.

I started the repos with [ROS tutorials](https://github.com/fegonzalez7/rob_unal_clase2), it kinda worked, actually they are my legacy on robotics, but now I want something for myself. A couple of things:
 - **Why english?:** The real answer shoul be why not?...I need to improve it.
 - **Why DB and SQL?:** Because a do not know a da*m thing about it, so I am starting from scratch.
 - **Why a repo poorly coded and badly commented?:** Well, there should be probably hundreds of books about these topics, but there are not mine, plus this is my way.

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
- *ALTER:* It modifies parameters inside table or a schema, such as name, columns.
- *DROP:* It deletes a DB, it **must** be used carefully. 

### DDML (Data Manipulation Language)

It is a set of commands to manipulate de DB. Once the DDB has been created they are the innstructions to interact with the DB, mainly the tables.

- *select*
- *insert*
- *update*
- *delete*

#### Installation process

 - **Windows:** Probably the easiest, just go [here](https://dev.mysql.com/downloads/windows/installer/5.6.html) download and make your custom install. I had some troubles with it, the login in procedure fails a lot, so I swithc to linux.
 - **Linux:** I struggled a lot, but I found a good [tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04). Follow the steps as close as possible, I spent like 4 hours because I wannted to do it my way. **Pro tip:** MySQL Workbench for linux coulb be buggy in terms of GUI, so try to find hidden panels.
 - **Mac**

#### Database structure


 - **Squema:** It is basically the DB, you can ddefine rules, filters, among others. A schema contains tables, views, functions and proceddures.
 - **Table:** It is a matrix of information, it is comprisedd of colums that represent a certain type of data (INT, CHAR, TEXT, TIME) and rows, which are the actual data in the table. 
 - **Queries:** They are the core of SQL (Structured Query). They are a set of commads used to look up for certain info in the tables. 

#### Example

