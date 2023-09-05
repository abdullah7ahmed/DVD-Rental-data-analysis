-- How many Payment Transactions were greater than $5?

SELECT COUNT(Amount) FROM payment
WHERE amount > 5;

-- How many actors have a first name that start with letter 'P'?

SELECT COUNT(first_name) FROM actor
WHERE first_name LIKE 'P%';

-- List of unique districts of our customers?

SELECT COUNT(DISTINCT(district)) FROM address;

-- How many films have a rating R and a replacement cost of between $5 and $15?

SELECT COUNT(*) FROM film
WHERE rating = 'R' AND
replacement_cost BETWEEN 5 AND 15;

-- How many films have truman somewhere in the title?

SELECT COUNT(title) FROM film
WHERE title LIKE '%Truman%';


-- How many payments did staff_id 1 and staff_id 2 handle and
-- based on highest payments handled will be the recepeint of Bonus?

SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id;

-- WHat is the average replacement_cost to replace Per MPAA rating?
-- (Determine the relationship between relacement_cost and MPAA rating movies)

SELECT ROUND(AVG(replacement_cost),2) AS avg_replacement_cost, rating FROM film
GROUP BY rating;

-- WE are running a promotion for top five customers,
-- What are the top five customers_ids of our top 5 highest spending customers?

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)
DESC LIMIT 5;


-- What are the customer_ids of our customer who have spent more than-
-- $100 with staff_id 2?

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 100;

-- In order to alert the customers regarding change in Calfornia sales tax law, 
-- What are the emails of our customers who live in california?

-- Using INNER JOIN

SELECT district, email FROM address
INNER JOIN customer ON
address.address_id = customer.customer_id
WHERE district = 'California';



-- A client wants to get the list of all the movies of Nick Walhberg?

-- Two Inner JOIN


SELECT title, first_name, last_name FROM actor
INNER JOIN film_actor ON
actor.actor_id = film_actor.actor_id
INNER JOIN film 
on film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND
last_name = 'Wahlberg';

-- We want to know and compare various amount of films we have per movie rate.

-- Using CASE statment

SELECT 
SUM(
CASE rating
	WHEN 'R' THEN 1 ELSE 0
	END
) AS r,
SUM(
CASE rating
	WHEN 'PG' THEN 1 ELSE 0
	END
) AS PG,
SUM(
CASE rating
	WHEN 'PG-13' THEN 1 ELSE 0
	END
) AS pg13

FROM film;










