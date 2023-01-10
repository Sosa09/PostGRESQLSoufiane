-- oefening 1
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE 'C%' 
AND last_name LIKE '%a%';

-- oefening 2
SELECT COUNT(last_name) 
FROM actor 
WHERE last_name LIKE 'C%' 
AND last_name LIKE '%a%';

-- oefening 3
SELECT film.title, first_name, last_name 
FROM actor
JOIN film_actor as fa
ON fa.actor_id = actor.actor_id
JOIN film
ON film.film_id = fa.film_id
GROUP BY first_name, last_name , film.title
HAVING last_name LIKE 'C%'
AND last_name LIKE '%a%';

-- oefening 4
SELECT COUNT(film.title) as nr_films, first_name, last_name 
FROM actor
JOIN film_actor as fa
ON fa.actor_id = actor.actor_id
JOIN film
ON film.film_id = fa.film_id
GROUP BY first_name, last_name
HAVING last_name LIKE 'C%'
AND last_name LIKE '%a%';

--oefening 5
SELECT  first_name, last_name, category.name as cat_name, COUNT(category.name) as nr_categories 
FROM actor
JOIN film_actor as fa
ON fa.actor_id = actor.actor_id
JOIN film
ON film.film_id = fa.film_id
JOIN film_category
ON film_category.film_id = film.film_id
JOIN category
ON category.category_id = film_category.category_id
GROUP BY category.name, last_name, first_name
HAVING COUNT(category.name) > 5 AND last_name LIKE 'C%' AND last_name LIKE '%a%'
ORDER BY nr_categories DESC;


-- oefening 6
-- SELECT COUNT(film.film_id) FROM film (RESULT COUNT = 1000)

--oefening 7
SELECT  film.title as fTitle , COUNT(inventory.film_id) as stock
from inventory
JOIN film
ON film.film_id = inventory.film_id
JOIN film_actor as fa
ON film.film_id = fa.film_id
JOIN actor
ON fa.actor_id = actor.actor_id
GROUP BY fTitle, actor.first_name, actor.last_name
HAVING actor.last_name LIKE 'C%' AND actor.first_name LIKE '%a%'
ORDER BY stock;

--oefening 8
--oefening 9
--oefening 10
