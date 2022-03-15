-- Very Easy: Create a table with your top three cars and include make, model, year. Create a query to add in two more cars
-- CREATE DATABASE challenges;

USE challenges;

CREATE TABLE cars(
 id INT NOT NULL AUTO_INCREMENT,
 make VARCHAR(100),
 model VARCHAR(100),
 year DATE,
 PRIMARY KEY (id)
 );
 
 INSERT INTO cars (id, make, model, year)
 VALUES
 (1, 'Tesla', 'Model X', '2022'),
 (2,'Tesla', 'Model S Plaid', '2022'),
 (3,'Mercedes','AMG','2022');
 
INSERT INTO cars (id, make, model, year)
VALUES
(4, 'Lamborghini', ' Urus', '2022'),
(5, 'Jeep ', 'Trackhawk', '2022');
 

-- Easy: Create a table with your top five favorite books with Title, Publish Date, and Author First/Last Name Create a query to add in two new books Remove the oldest book Provide an additional query giving the sum of all books

CREATE TABLE books (
title VARCHAR (225),
publish_date DATE,
author_firstName VARCHAR (100),
author_lastName VARCHAR (100)
);

INSERT INTO books (title ,publish_date, author_firstName, author_lastName)
VALUES
('The 48 Laws of Power', '1998-02-05', 'Robert', 'Greene'),
('The Alchemist', '1988-09-10', 'Paulo', 'Coelho'),
('Rich Dad Poor Dad', '1997-11-01', ' Robert', 'Kiyosaki '),
('The Undefeated Mind', '2012-06-22' , 'Alex', 'Lickerman'),
('Think and Grow Rich', '1937-10-30', ' Napoleon', 'Hill');

INSERT INTO books (title ,publish_date, author_firstName, author_lastName)
VALUES

('The Mamba Mentality: How I Play', '2018-10-13', 'Kobe', 'Bryant');

DELETE FROM `books` 
WHERE publish_date IS NOT NULL 
ORDER BY Cast(publish_date as date) DESC 
LIMIT 1;

SELECT * FROM books;

-- MEDUIM Create a table with your top 10 movies. Include title, release date, and rating Create a query that pulls all movies, in order of release date, where the title includes the letter “s”.

CREATE TABLE fav_movies (
movieid INT AUTO_INCREMENT,
title VARCHAR(100),
release_date INT,
rating ENUM('G', 'PG', 'PG-13', 'R'),
PRIMARY KEY(movieid)
);

INSERT INTO fav_movies (title, release_date, rating) VALUES
('The Dark Knight', 2008, 'PG-13'),
('Iron Man 2', 2010, 'PG'),
('Avengers: Infinity War', 2018, 'PG-13'),
('God Father 3', 1972 , 'R'),
('GoodFellas', 1990, 'R'),
('SPIDER-MAN: NO WAY HOME', 2021, 'PG-13'),
('Inside Man', 2006, 'R'),
('Thor: Ragnarok', 2017, 'PG-13'),
('Rush Hour 2', 2001, 'PG-13'),
('Bad Boys 2', 2003, 'PG-13');

SELECT * FROM fav_movies
WHERE title LIKE '%s%';

-- HARD
-- Made copy of medium
CREATE TABLE fav_movies (
movieid INT AUTO_INCREMENT,
title VARCHAR(100),
release_date INT,
rating ENUM('G', 'PG', 'PG-13', 'R'),
PRIMARY KEY(movieid)
);
-- Added two separate columns for director first & last names
ALTER TABLE fav_movies
ADD COLUMN director_first VARCHAR(100),
ADD COLUMN director_last VARCHAR(100);
-- Filled in the table with values for the directors names
UPDATE fav_movies
SET director_first = 'Michael', director_last = 'Bay'
WHERE movieid= 10;
UPDATE fav_movies
SET director_first = 'Mary', director_last = 'Boe'
WHERE movieid= 9;
UPDATE fav_movies
SET director_first = 'John', director_last = 'Doe'
WHERE movieid= 8;

-- Combined the 2 columns together
SELECT director_first, director_last, 
CONCAT (director_first,' ', director_last) AS full_name
FROM fav_movies;
-- Put the list of last names in alphabetical order
SELECT * FROM fav_movies ORDER BY director_lastname ASC;
-- Removed the the last names that had R-Z 
DELETE FROM fav_movies WHERE movieid = 10;
DELETE FROM fav_movies WHERE movieid = 9;
-- Only selected the first 3 ids from the table
SELECT * FROM fav_movies LIMIT 3;


-- VERY HARD Make Copy

CREATE TABLE cars2(
id INT NOT NULL AUTO_INCREMENT,
make VARCHAR(100),
model VARCHAR(100),
year INT,
PRIMARY KEY (id)
 );
 
INSERT INTO cars2 (make, model, year) VALUES ('Porsche','cayenne', 2021), ('Maybach', 'GLS', 2022);

INSERT INTO cars2 (make, model, year) VALUES
('Nissan','Sentra', 2021), 
('Dodge','Hellcat', 2022), 
('Dodge', 'Demon', 2022);
-- Added color and price column
ALTER TABLE cars2
ADD COLUMN color VARCHAR(100),
ADD COLUMN price INT NOT NULL;

INSERT INTO cars2 (make, model, year, color, price) VALUES
('Nissan','Sentra', 2021, 'red', 58000), 
('Dodge','Hellcat', 2022, 'midnight blue', 69000), 
('Dodge', 'Demon', 2022,'cherry red', 80000);
-- Inserted my values for color and price
INSERT INTO cars2 (color,price)
VALUES
('red','94000'),
('purple','63000');

SELECT make, model, 
CONCAT (make, ' ', model) 
AS car FROM cars2;

SELECT make, COUNT(*) FROM cars2 GROUP BY make;