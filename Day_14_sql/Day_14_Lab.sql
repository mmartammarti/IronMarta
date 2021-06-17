#Instructions
# 0. Inspect the database structure and find the best-fitting table to analyse for the next task.

# 1. Use the RANK() and the table of your choice. Rank films by: length (filter out the rows that have 
# nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title, length, 
rank() over (order by length desc) as length_ranking
from film where length is not null and length <> 0;


# 2. Build on top of the previous query and rank films by length within the rating category (filter out 
# the rows that have nulls or 0s in length column). In your output, only select the columns title, length, 
# rating and the rank.
select title, length, 
rank() over (partition by rating order by length desc) as length_ranking
from film where length is not null and length <> 0;


# 3. How many films are there for each of the categories? Inspect the database structure and use appropriate 
# join to write this query.
select a.title, b.category_id, count(distinct category_id)
from film a
right join film_category b
on a.film_id = b.film_id
ORDER BY category_id;


# 4. Which actor has appeared in the most films?
select a.actor_id, a.first_name, a.last_name, b.film_id, count(film_id) as times_appears
from actor a
join film_actor b
on a.actor_id = b.actor_id
group by actor_id
order by count(film_id) desc;

# 5. Most active customer (the customer that has rented the most number of films)
select c.customer_id, c.first_name, c.last_name, count(r.customer_id) as no_transactions
from customer c
join rental r
on c.customer_id = r.customer_id
group by c.customer_id
order by count(c.customer_id) desc;


# 6. Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.