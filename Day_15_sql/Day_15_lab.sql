-- 7 find the movies that the most profitable customer has rented
SELECT 
    film_id, title, amount
FROM
    film
        JOIN
    inventory USING (film_id)
        JOIN
    rental USING (inventory_id)
        JOIN
    payment USING (rental_id)
WHERE
    rental.customer_id = (SELECT 
            customer_id
        FROM
            customer
                JOIN
            payment USING (customer_id)
        GROUP BY customer_id
        ORDER BY SUM(amount) DESC
        LIMIT 1)
ORDER BY rental_date DESC
;