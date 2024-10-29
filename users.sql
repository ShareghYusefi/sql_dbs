-- What are Data and Databases? 
-- Data is facts about an object or event.
-- A databse is a collection of related data.

-- What are Database Management Systems (DBMS)?
-- A DBMS is a software that allows users to create, store, access, delete, update data in a database.
-- There are differnt types of DBMSs, such as Hierarchical, Network, Relational, Object-Oriented, and NoSQL.

-- What is a relational database management system (RDBMS)?
-- This is essentially when we store data in tables. Each table has rows and columns.

-- What is Heirarchical DBMS?
-- This is when data is stored in a tree-like structure. 

-- What is Network DBMS?
-- This is when data is stored in a graph-like structure.

-- What is Object-Oriented DBMS?
-- This is when data is stored in objects.

-- What is NoSQL DBMS?
-- This is when data is stored in a non-relational database such as dcocuments, key-value pairs, graphs, etc.

-- What is SQL?
-- SQL stands for Structured Query Language. 
-- It is a language used to communicate with a database for relational databases.

-- What makes up a SQL statement? 
-- A SQL statement is made up of clauses, expressions, predicates, queries, and statements.
-- Queries are used to retrieve data from a database. They are made up clauses such as SELECT, FROM, WHERE, etc.
-- Statements are used to perform actions on a database. They are made up of clauses such as CREATE, INSERT, UPDATE, DELETE, etc.
-- Predicates are used to filter data. They are made up of clauses such as WHERE, HAVING, etc.

-- Use a specific database for following queries

-- Data Definition Language (DDL)
USE my_app_db;

-- Create a users table 
CREATE TABLE users (
    id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    age INT
);

--  Altering users table
ALTER TABLE users 
ADD password VARCHAR(100); 

-- Modifying users table
ALTER TABLE users
MODIFY COLUMN name VARCHAR(200);

-- Modifying column name in users table
ALTER TABLE users
CHANGE COLUMN name fullName VARCHAR(200);

-- Dropping users table
-- DROP TABLE users;

-- Removing all data records from users table
-- TRUNCATE TABLE users;

-- What are the different data types in SQL?
-- INT: Integer
-- Tinyint: Small integer like 0 or 1 which can represent false or true for boolean values
-- VARCHAR: Variable-length character string
-- CHAR: Fixed-length character string
-- Float and Double: Floating-point numbers, example 3.14
-- Date: Format 1999-01-08 would be YYYY-MM-DD
-- Time: Format 15:45:00 would be HH:MM:SS
-- Datetime: Format 1999-01-08 15:45:00 would be YYYY-MM-DD HH:MM:SS
-- Year: Format 1999 would be YYYY

-- Data Manipulation Language (DML)



