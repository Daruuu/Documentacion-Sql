SELECT * FROM AnimalHospital.Pets;

SELECT * FROM Pets;

SELECT pet_name nombre, type_of_animal animal, breed raza, colors color
FROM Pets
WHERE breed IS NULL AND colors IN ("Brown");

SELECT pet_name nombre, type_of_animal animal, breed raza, colors color
FROM Pets
WHERE breed IS NULL AND colors LIKE "Brown";

-- 5A
SELECT * FROM Pets;

SELECT Pet_Name nombre, Type_of_Animal, Colors color, Date_of_Birth, Gender, Length, Weight
FROM Pets
WHERE Gender LIKE('M') AND Weigth BETWEEN 20 AND 50
OR Gender LIKE ('F') AND Length > 45
ORDER BY Pet_Name DESC;

-- 8 
SELECT * FROM Visits;

SELECT DISTINCT (pet_id)
FROM Visits
WHERE Visit_Date > ‘1999-05-21’
ORDER BY Visit_Date;
-- 9
SELECT * FROM Pets;

SELECT * FROM Pets
WHERE comments LIKE '%';

-- 10

SELECT COUNT(*)
FROM Pets
WHERE type_of_animal = 'DOG';

SELECT *
FROM Pets
WHERE type_of_animal = 'DOG';

-- 10 B
SELECT DISTINCT(breed)
FROM Pets
WHERE type_of_animal = 'DOG';


-- 10 C
SELECT COUNT(DISTINCT(breed))
FROM Pets
WHERE type_of_animal = 'DOG';

-- 11
SELECT * FROM film
WHERE special_features LIKE 'Trailers';

-- 12
SELECT * FROM film;

SELECT * FROM film
WHERE length < 60;

-- 13
SELECT * FROM actor
WHERE first_name LIKE '___';


-- 14
SELECT * FROM payment;

SELECT * FROM payment
WHERE first_name LIKE '___';

select * from actor
WHERE payment_date LIKE "%-14%" OR payment_date LIKE "%-28%"
order by payment_date desc;

-- funcion usando month()
select *, month(payment_date) FROM payment P;

-- 15 
SELECT * FROM world.City;

select * 
FROM Country
WHERE name LIKE ("% %");

-- 16

-- 16 A
SELECT * 
FROM City;

SELECT * 
FROM City
where (CountryCode  = "ESP" OR CountryCode = "JPN") AND
population < 100000
ORDER BY population DESC;

SELECT * 
FROM City
where (CountryCode IN ("ESP", "JPN")) AND
population < 100000
ORDER BY population DESC;

-- 16 B

SELECT C.*, population * 1.2
FROM City C
where CountryCode IN ("ESP", "JPN") AND
population < 100000
ORDER BY population DESC;

-- 17 
SELECT  *
FROM CountryLanguage
WHERE (language = 'English' AND isofficial = 'F') AND percentage > 50;

-- 18
SELECT * FROM Country;
SELECT * 
FROM Country
WHERE GovernmentForm = "Republic" AND population > 50000000;

SELECT * 
FROM Country
WHERE (GovernmentForm = "Republic" AND population > 50000000) OR
(GovernmentForm = "Monarchy" AND LifeExpectancy < 70)
ORDER BY Continent asc;


