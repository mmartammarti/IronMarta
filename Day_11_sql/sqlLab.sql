#Instructions
#1. Review the tables in the database.

#2. Explore tables by selecting all columns from each table or using the in built review features for your client.

#3. Select one column from a table. Get film titles.
SELECT title
FROM film_text;

#4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select actor_id as ActorName from actor;

#5.1 Find out how many stores does the company have?
SELECT COUNT(store_id)
FROM store;

#5.2 Find out how many employees staff does the company have?
SELECT COUNT(manager_staff_id)
FROM store;

#5.3 Return a list of employee first names only?#
select first_name from staff;


