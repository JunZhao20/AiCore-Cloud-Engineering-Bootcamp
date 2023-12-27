-- SELECT address_id,
--        address,
--        address2,
--        district,
--        city_id,
--        phone
-- FROM
--     address
-- WHERE
--     district = 'California'
-- ORDER BY 
--     city_id;

-- SELECT customer_id,
--         SUM(amount) AS total_customer_payments
-- FROM
--     payment
-- GROUP BY customer_id

SELECT actor.first_name,
        actor.last_name,
        film.title AS film_title,
       film.release_year AS film_release_year, 
       language.name AS film_language, 
       film.description AS film_description
FROM
    actor,
    film

JOIN
 film_actor ON actor.actor_id = film_actor.actor_id

SELECT actor.first_name,
       actor.last_name,
       film.title AS film_title,
       film.release_year AS film_release_year, 
       language.name as film_language, 
       film.description AS film_description
FROM 
    actor
JOIN 
    film_actor ON actor.actor_id = film_actor.actor_id
JOIN 
    film ON film_actor.film_id = film.film_id
JOIN
    language ON language.language_id = film.language_id
WHERE 
    first_name = 'Nick';

SELECT rental_date,
       inventory_id, 
       customer_id,
       staff_id
FROM
    rental
WHERE 
    staff_id < 2
    AND inventory_id > 1
ORDER BY
    inventory_id, rental_date, customer_id