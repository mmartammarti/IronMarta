-- # Instructions
-- 1. In the actor table, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, 
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this last 
-- name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
-- hence we would want this in our output list.
select * from actor;
select DISTINCT last_name from actor;
#aqui nomes gafaria un exemple de cada un dels repetits

select last_name from actor
group by last_name 
having count(*)=1
order by last_name asc;


-- 2.Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
select last_name from actor
group by last_name 
having count(*)>1
order by last_name asc;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
select staff_id from staff;

select rental_id, staff_id from rental
group by rental_id, staff_id 
order by staff_id asc;
#porque a mi el resultado no me sale como a mis compañeros aqui?

select staff_id, count(staff_id) from rental
group by staff_id 

-- 4. Using the film table, find out how many films were released each year
select film_id, title, release_year from film
group by film_id, title, release_year
order by film_id asc;

-- 5. Using the film table, find out for each rating how many films were there.
select rating, count(rating) from film
group by rating

-- 6. What is the average length of films for each rating? Round off the average lengths to two decimal places.
select rating, round(avg(length),2) as avglength from film
group by rating
order by avglength desc;

-- 7. Which kind of movies (based on rating) have an average duration of two hours or more?
select rating as moviesMoreThan2hours from film
group by rating
having (avg(length)) >= 120