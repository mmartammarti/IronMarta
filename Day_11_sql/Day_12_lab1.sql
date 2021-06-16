#Instructions
use sakila

#Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
where first_name regexp 'Scarlett'

#How many films (movies) are available for rent? 
select count(inventory_id) from sakila.inventory;
#and how many films have been rented?
select count(rental_id) from sakila.rental;

#What are the shortest and longest movie duration? 
#Name the values max_duration and min_duration.
select max(length) as 'max_duration', min(length) as 'min_duration' from film

#What's the average movie duration expressed in format (hours, minutes)?
select sec_to_time(avg(length)*60) as avg_in_hours from film;

#How many distinct (different) actors' last names are there?
select count(distinct last_name) as dif_actor_last_name from sakila.actor; 

#Since how many days has the company been operating (check DATEDIFF() function)?
select min(rental_date) as ‘company_start’, max(rental_date) as ‘company_closes’, DATEDIFF("2006-06-14","2005-05-24") as number_of_days
from rental;

#Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, 
date_format(rental_date( ' ', 1)) FROM rental;

SELECT *, date_format(convert(substring_index(rental_date, ' ', 1), date), '%M') as rental_month, date_format(convert(substring_index(rental_date, ' ', 1), date), '%W') as rental_weekday
FROM rental
limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, weekday(rental_date) as weekday,
case
when (weekday(rental_date) in (5,6)) then 'weekend'
else 'workday'
end
as day_type
from rental

select *, if (WEEKDAY(rental.rental_date) > 5,"weekend", "workday") 
as day_type from rental;

#How many rentals were in the last month of activity?
select count(*) as rentals_last_month from rental 
	where month(rental.rental_date) = (select month(max(rental.rental_date)) from rental)
	and	year(rental.rental_date) = (select year(max(rental.rental_date)) from rental)
	order by rental_date asc;

