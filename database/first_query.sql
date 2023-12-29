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

SELECT * FROM payment WHERE INTERVAL YEAR payments_this_year = '2007'

DROP TABLE payments_this_year

CREATE TABLE payments_this_year AS(
    SELECT payment_id,
        customer_id,
            staff_id,
            rental_id,
            amount,
            payment_date

    FROM
        payment
    WHERE
        payment_date BETWEEN '2007-01-01 00:00:00' AND '2007-12-31 23:59:59'
)

SELECT * FROM payments_this_year

ALTER TABLE payments_this_year
    ALTER COLUMN payment_date TYPE TIMESTAMP(0);

SELECT * FROM category

INSERT INTO category
    (name, last_update)
VALUES 
    ('Thriller', NOW());

CREATE TABLE b_films (
    title VARCHAR(300) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    release_year INTEGER NOT NULL,
    rating CHAR(5) NOT NULL
)

INSERT INTO b_films(title, description, release_year, rating)(
    SELECT title,
        description,
        release_year,
        rating
    FROM 
        film
    WHERE
        title LIKE 'A%'

)
SELECT * FROM b_films

SELECT title, rental_rate, release_year
FROM film
WHERE title = 'AIRPLANE SIERRA';

UPDATE film
    SET rental_rate = 0.99,
        release_year = 2010
WHERE 
    title = 'AIRPLANE SIERRA';

ALTER TABLE payments_this_year
    DROP COLUMN payment_id 

SELECT staff_id, amount, customer_id 
FROM payments_this_year 
WHERE amount = 3.99 AND customer_id IN (87, 137);

SELECT amount FROM payments_this_year WHERE payment_date::DATE >= DATE '2007-03-22'


UPDATE payments_this_year
    SET staff_id = 1
    WHERE
        amount = 3.99 
        AND 
        customer_id IN (87, 137);

UPDATE payments_this_year
    SET amount = amount + 0.50
    WHERE
        payment_date::DATE >= DATE '2007-03-22'

ALTER TABLE payments_this_year
    RENAME amount TO total_payment_taken