USE sakila;

-- 1.1
SELECT MAX(length) AS 'max_duration', MIN(length) AS 'mIN_duration'
FROM sakila.film;
-- 1.2
SELECT ROUND(AVG(length),2)
FROM sakila.film;
SELECT SEC_TO_TIME(ROUND(AVG(length)))
FROM sakila.film;
SELECT *, CONVERT((length,date), '%k-%i')
FROM sakila.film;
-- 2.1
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date))
FROM sakila.rental;
-- 2.2
SELECT *
FROM sakila.rental;
SELECT *, date_format(CONVERT(rental_date,date), '%M') AS 'month', date_format(CONVERT(rental_date,date), '%W') AS 'weekday'
FROM sakila.rental
LIMIT 20;
-- 2.3
SELECT *
FROM sakila.rental;
SELECT *,
CASE
WHEN date_format(CONVERT(rental_date,date), '%w') = 1 or 2 or 3 or 4 or 5 then 'workday'
WHEN date_format(CONVERT(rental_date,date), '%w') = 6 or 7 then 'weekend'
ELSE 'No status'
END AS 'DAY_TYPE'
FROM sakila.rental;

-- 3.
SELECT *
FROM sakila.film
WHERE rental_duration IS NULL;

-- 4.
SELECT concat(first_name,' ', last_name,' ', left(email,3))
FROM sakila.customer
ORDER BY last_name ASC;

-- CHALLANGE 2
-- 1.1
SELECT COUNT(DISTINCT title)
FROM sakila.film;
-- 1.2
SELECT rating, COUNT(film_id)
FROM sakila.film
GROUP BY rating
-- 1.3
SELECT rating, COUNT(film_id)
FROM sakila.film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

-- 2.
SELECT staff_id, COUNT(rental_id)
FROM sakila.rental
GROUP BY staff_id;

-- 3.1
SELECT rating, ROUND(AVG(length),2)
FROM sakila.film
GROUP BY rating
ORDER BY AVG(length) DESC;

-- 3.2
SELECT rating, ROUND(AVG(length),2) as average
FROM sakila.film
GROUP BY rating
HAVING average>120
ORDER BY average DESC;

-- 4.
SELECT DISTINCT(last_name)
FROM sakila.actor;

