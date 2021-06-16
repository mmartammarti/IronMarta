-- Instructions
-- 1 Get release years.
SELECT * from film;
SELECT DISTINCT release_year from film;

-- 2 Get all films with ARMAGEDDON in the title.
SELECT TITLE from film
WHERE title like '%ARMAGEDDON';

-- 3 Get all films which title ends with APOLLO.alter
SELECT TITLE from film
WHERE title REGEXP 'APOLLO$';

-- 4 Get THE 10 the longest films.
SELECT TITLE from film
ORDER BY length DESC
LIMIT 10;

-- 5 How many films include Behind the Scenes content?
SELECT COUNT(*) FROM film
WHERE special_features like '%Behind the Scenes%';

-- 6 Drop column picture from staff.
SELECT * FROM staff;
ALTER TABLE staff DROP COLUMN picture;

-- 7 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM customer
WHERE first_name = 'TAMMY' and last_name = 'SANDERS';

INSERT INTO staff( first_name, last_name, email, address_id, store_id, username)
values('TAMMY','SANDERS','TAMMY.SANDERS@sakilacustomer.org','79','2','tammy')


-- 8.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 
-- 1. You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. 
-- To get that you can use the following query: where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select customer_id from customer 
where first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

-- Use similar method to get inventory_id, film_id, 
select film_id from film where title = 'ACADEMY DINOSAUR';

-- and staff_id
select * from staff;

select * from rental;

insert into rental(rental_date,inventory_id,customer_id,staff_id)
values (curdate(), 1, 130, 1);

-- 9Delete non-active users, but first, create a backup table deleted_users to store customer_id, 
-- email, and the date for the users that would be deleted. Follow these steps:

-- Check if there are any non-active users
select * from customer;

select * from customer where active = 0;

drop table if exists deleted_users;

create table deleted_user (
customer_id int UNIQUE NOT NULL,
email varchar(255)UNIQUE NOT NULL,
delete_date date);

insert into deleted_user 
select customer_id, email, curate() 
from customer
where active = 0;

select * from deleted_user;

delete from customer where active = 0;

#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer