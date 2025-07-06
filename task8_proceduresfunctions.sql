-- task 8 --
use library;
drop table books;
drop table Borrowers;
CREATE TABLE books (book_id INT PRIMARY KEY,title VARCHAR(200),author VARCHAR(50),genre VARCHAR(30),
    price DECIMAL(6,2),published_year INT);
INSERT INTO books VALUES
(1, '1984', 'George Orwell', 'Dystopian', 299.00, 1949),
(2, 'The Alchemist', 'Paulo Coelho', 'Fiction', 350.00, 1988),
(3, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Autobiography', 400.00, 1999);
DELIMITER $$
CREATE PROCEDURE GetBooksBygenre(IN genrename VARCHAR(50))
BEGIN
    SELECT * FROM books
    WHERE genre = genreName;
END $$

DELIMITER ;
CALL GetBooksBygenre('Paulo Coelho');

-- function --
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
SELECT title, GetbooksAge(published_year) AS booksAge FROM books;


