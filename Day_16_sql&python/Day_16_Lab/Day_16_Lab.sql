select
c.category_id, AVG (f.rental_rate)
FROM
    film f
        JOIN
    film_category c USING (film_id)
group by category_id
order by AVG (f.rental_rate) desc;