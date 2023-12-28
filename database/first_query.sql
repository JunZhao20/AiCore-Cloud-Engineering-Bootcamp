-- SELECT payment_id,
--     customer_id,
--     staff_id,
--     rental_id,
--     amount,
--     payment_date

-- FROM payment;

-- SELECT * FROM payment

-- SELECT customer_id, amount FROM payment

-- SELECT title,
--            (rental_rate / rental_duration) AS rental_rate_per_day
-- FROM
--     film

-- SELECT customer_id,
--     rental_date
-- FROM 
--     rental
-- ORDER BY
--     customer_id, rental_date DESC

-- SELECT customer_id,
--     rental_date
-- FROM
--     rental
-- ORDER BY
--     customer_id, rental_date DESC
-- LIMIT
--     5 OFFSET 40;

-- SELECT title, 
--        rental_rate,
--        ROUND((rental_rate / rental_duration), 2) AS rental_rate_per_day, 
--        (rental_rate * rental_duration) AS total_rental_cost, 
--        (rental_rate * rental_duration) + replacement_cost AS total_replacement_cost
-- FROM 
--     film
-- WHERE
--      rental_rate > 2.49

-- SELECT first_name
-- FROM
--     actor
-- WHERE
--     first_name LIKE 'A%';

-- SELECT address,
--        district,
--        phone
-- FROM
--     address
-- WHERE 
--     district LIKE 'A%'
--     OR district LIKE 'California%'
--     OR district LIKE 'C%';

-- SELECT address,
--        district,
--        phone
-- FROM
--     address
-- WHERE 
--     district IN ('Alberta', 'California', 'Hamilton');


-- 10 films who's lengths are under 120 mins
SELECT title,
    length
FROM
    film
WHERE
    length < 120


-- 10 longest films who's rating are G
SELECT title,
    length,
    rating
FROM 
    film
WHERE
    rating = 'G'
ORDER BY
    length DESC

LIMIT
    10;

-- all transactions where payment has been above $10
SELECT amount
FROM
    payment
WHERE
    amount > 10

-- the (replacement) cost per minute of every movie
SELECT title,
    ROUND((replacement_cost/length), 2) AS cost_per_minute_of_every_movie
FROM
    film

-- top 10 most expensive films to rent, based on the rental rate per hour of the movie
SELECT title,
   rental_rate,
    (length / 60)*rental_rate AS hour_rate
FROM
    film
ORDER BY
    hour_rate DESC
LIMIT
    10
