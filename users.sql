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

-- Inserting data into users table
INSERT INTO users (id, fullName, email, age, password)
VALUES (1, 'John Doe', 'john@gmail.com', 25, 'password123');

-- Inserting multiple records into users table
INSERT INTO users (id, fullName, email, age, password)
VALUES (2, 'Jane Doe', 'jane@gmail.com', 23, 'password123'),
       (3, 'Juilian Cesar', 'julian@gmail.com', 32, 'password123'),
       (4, 'Josh Mac', 'Josh@gmail.com', 27, 'password123');

-- Selecting all data & columns from users table
SELECT * FROM users;

-- Selecting specific columns from users table
SELECT id, fullName FROM users;

-- filtering data using WHERE clause
SELECT * FROM users WHERE age > 25;

-- Updating data in users table
UPDATE users SET password = 'newpassword123' WHERE id = 1;
UPDATE users SET password = 'newpassword123' WHERE id IN (2,5);

-- Deleting data from users table
DELETE FROM users WHERE id = 5;

-- What is a primary key?
-- A unique identifier for each record in a table. Usually the id column.

ALTER TABLE users 
CHANGE COLUMN id id INT AUTO_INCREMENT PRIMARY KEY;

-- Insert a record without specifying the id
INSERT INTO users (fullName, email, age, password) VALUES ('Tom Jerry', 'tom@gmail.com', 30, 'password123');

-- What is a foreign key?
-- A column in a table that is a primary key in another table. It is used to establish a relationship between two tables.

-- What are cascading actions?
-- When a record in a parent table is deleted or updated, the same action is performed on the child table.
-- There are different types of cascading actions such as CASCADE, SET NULL,  NO ACTION, RESTRICT.

-- RESTRICT: Prevents the deletion of a record in the parent table if there are related records in the child table.
-- NO ACTION: Same as RESTRICT.
-- CASCADE: Deletes or updates the related records in the child table when a record in the parent table is deleted or updated.
-- SET NULL: Sets the foreign key column in the child table to NULL when a record in the parent table is deleted or updated.

-- Users have courses 
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
    -- user_id INT,
    -- FOREIGN KEY (user_id) REFERENCES users(id) 
    -- ON DELETE CASCADE ON UPDATE CASCADE
);


-- A user can be enrolled in multiple courses
-- A course can have multiple users
-- This is a many-to-many relationship

-- Create a pivot table to store user_id and course_id
CREATE TABLE UserCourse (
    user_id INT, 
    course_id INT, 
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Selecting data from multiple tables
INSERT INTO courses (name)
VALUES ('Science 101'),
       ('History 101'),
       ('English 101');

-- Inserting data into UserCourse table (pivot table)
INSERT INTO UserCourse (user_id, course_id)    
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (3, 3),
       (4, 2);

-- Finding all course belonging to a user
-- aliasing a table involves giving a table a temporary name
SELECT u.id, u.fullName, c.name 'course' FROM users u
JOIN UserCourse uc ON u.id = uc.user_id
JOIN courses c ON c.id = uc.course_id
WHERE u.id = 1
ORDER BY c.name DESC;






       

