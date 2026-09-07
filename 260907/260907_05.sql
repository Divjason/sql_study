USE sakila;
SHOW TABLES;

SELECT * FROM payment LIMIT 10;

SELECT
	DATE_FORMAT(payment_date, "%Y-%m") AS payment_month,
    SUM(amount)
FROM payment
GROUP BY payment_month
ORDER BY payment_month;

SELECT
	customer_id,
    COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;


