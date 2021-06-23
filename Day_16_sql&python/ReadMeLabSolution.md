# SQL & Python Lab
## Answering: Which film categories provide better revenue for the business?

###### * Working with the Sakila database

## 1. Project Brief
##### Discover wich film categories are better for the business so we invest in buying those rather than others.

Developing the query in SQL:

```
SELECT avg(p.amount), c.name
FROM payment p
join rental r
using(rental_id)
join inventory i
using(inventory_id)
join film_category fc
using(film_id)
join category c
using(category_id)
group by c.name
order by avg(p.amount) desc
;
```

## 2. Tableau
##### We import it to Tableau and create a visual graphic

<img width="730" alt="Screenshot 2021-06-23 at 17 13 21" src="https://user-images.githubusercontent.com/30186859/123122523-614a7180-d446-11eb-86e3-381ffe9fbcb4.png">

###### * Find the Tableau public link in [here](https://public.tableau.com/app/profile/martamarti/viz/Categoriesbyrevenuesqltopython/Sheet4)

