# Task-8-Stored-Procedures-and-Functions

# Objective
-Practice creating and using Stored Procedures and Functions in SQL.
-Learn how to modularize SQL logic using parameters and conditional logic.

# Tools used: 
-MySQL Workbench

# Table used
-CREATE TABLE books (book_id INT PRIMARY KEY,title VARCHAR(200),author VARCHAR(50),genre VARCHAR(30),price DECIMAL(6,2),published_year INT);

# Create a Stored Procedure: Get all books by a specific author
DELIMITER $$
CREATE PROCEDURE GetBooksBygenrer(IN genreName VARCHAR(50))
BEGIN
SELECT * FROM books
WHERE genre = genreName;
END $$
DELIMITER ;

# How to call it:
CALL GetBooksBygenre('Paulo Coelho');

# Create a Function: Calculate book age from current year
DELIMITER $$
CREATE FUNCTION GetbooksAge(pubYear INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE age INT;
SET age = YEAR(CURDATE()) - pubYear;
RETURN age;
END $$
DELIMITER ;

# How to use it:
SELECT title, GetbooksAge(published_year) AS booksAge FROM books;

# Outcome
-Successfully modularized SQL logic using procedures and functions.
-Gained experience with SQL parameter handling, function returns, and conditional processing.

