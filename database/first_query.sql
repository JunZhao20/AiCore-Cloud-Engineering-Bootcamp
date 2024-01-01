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


SELECT country_id, 
    city, 
    city_id
FROM city
WHERE country_id = 6

SELECT * FROM city

SELECT address_id,
       address,
       address2,
       district,
       city_id,
       postal_code
FROM 
    address
WHERE city_id IN (20, 43, 45, 128, 161, 165, 289, 334, 424, 454, 457, 524, 567);

SELECT country.country_id ,
       country,
       city.city_id,
       address,
       address2,
       postal_code,
       district
FROM
    country
INNER JOIN
    city ON country.country_id = city.country_id
INNER JOIN
    address ON address.city_id = city.city_id
WHERE
    country = 'Argentina';

SELECT * FROM address

SELECT * FROM store

-- Find the addresses of all the stores in the Pagila database
SELECT store_id,
    address.address_id,
    address.address
    
FROM 
    store
INNER JOIN
    address ON address.address_id = store.address_id

-- Return the first names, last names, addresses, districts and postal code for all the staff in the database
SELECT first_name,
    last_name,
    address.address,
    address.district,
    address.postal_code
FROM 
    staff
INNER JOIN
    address ON address.address_id = staff.address_id

SELECT * FROM customer
SELECT * FROM rental

-- Return the first names, last names, addresses, districts and cities of customers who have rented a film
SELECT first_name,
    last_name,
    address.address,
    address.district,
    city.city
FROM
    customer
INNER JOIN
    address ON address.address_id = customer.address_id 
INNER JOIN
    city ON city.city_id = address.city_id
INNER JOIN
    rental ON rental.customer_id = customer.customer_id

-- Return the first names, last names, addresses, districts and cities of customers who have rented a film between 26/05/2005 and 29/05/2005. Limit the results to 25 customers and sort the results by the last names in ascending order
SELECT first_name,
    last_name,
    address.address,
    address.district,
    city.city
FROM
    customer
INNER JOIN
    address ON address.address_id = customer.address_id 
INNER JOIN
    city ON city.city_id = address.city_id
INNER JOIN
    rental ON rental.customer_id = customer.customer_id
WHERE
    return_date::DATE BETWEEN '2005-05-26' AND '2005-05-29'
ORDER BY
    customer.last_name ASC
LIMIT
    25



SELECT DATE_TRUNC('month',payment_date ) FROM payments_this_year

SELECT EXTRACT('year' from payment_date) as day_take_payment
FROM payment

-- counts films with no return dates
SELECT COUNT(*)
FROM 
    rental
WHERE
    return_date is NULL

-- Sum of payments the business received
SELECT SUM(amount)
FROM
    payment

-- sum of payments that the business has received between the dates 25/01/2007 and 29/01/2007
SELECT SUM(amount)
FROM payment
WHERE
    DATE_TRUNC('day', payment_date) BETWEEN '2007-01-25' AND '2007-01-29'

--  last transaction over $10 made
SELECT payment_date::DATE,
    amount
FROM
    payment
WHERE
    amount > 10
ORDER BY
    payment_date DESC
LIMIT
    1

-- the price of the highest value film the business has
SELECT amount
FROM
    payment
ORDER BY
    amount DESC
Limit
    1

-- the average length of films who's rental cost is under $2.99
SELECT ROUND(AVG(length), 2) AS avg_film_length
FROM 
    film

WHERE
    rental_rate < 2.99


SELECT title, 
       release_year, 
       rental_rate,
CASE
    WHEN rental_rate > 0 AND rental_rate < 2.99 THEN 'discount'
    WHEN rental_rate >= 2.99 AND rental_rate < 4.99 THEN 'regular'
    ELSE 'premium'
END AS quality
FROM 
    film;

SELECT customer_id,
    COUNT(rental_date) AS total_number_of_rentals
FROM
    rental
GROUP BY
    customer_id
ORDER BY
    total_number_of_rentals DESC
LIMIT
    5

SELECT customer_id,
    COUNT(rental_date) AS total_number_of_rentals,
    staff_id,
    COUNT(inventory_id) AS number_of_unique_rentals
FROM
    rental
GROUP BY
    customer_id, staff_id, inventory_id
ORDER BY
    customer_id DESC, staff_id DESC