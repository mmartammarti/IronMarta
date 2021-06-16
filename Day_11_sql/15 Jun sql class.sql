# how to get the bottom 10 rows (smallest loans)
#on loans with status B -  where status = B

# no top or bottom 
# order by DESC , ASC - 

select ceiling(avg(amount)) from loan;

# % modulus  - to find even numbers / check the remainder of a division
 
#STR functions 
# ltrim rtrim  left right length upper lower  split
# go to the district table, return the district name, region name
#region name upper and district name lower 

select lower(A2) as district, upper(A3) as region from district;

# dates 
#dates stored as numbers - use convert(,date) first 
SELECT *, convert(date,datetime) FROM bank.account;
#unless - use substring_index if the date needs to be split out into the pieces
#date_format with format types from here https://www.w3schools.com/sql/func_mysql_date_format.asp
SELECT *, 
date_format(convert(substring_index(issued, ' ', 1), date),'%Y-%b-%d')
 as date FROM bank.card;
 
 #is null - as a way checking for nulls 
SELECT * FROM bank.order
where k_symbol is null;
# sum(isnull) check the number of nulls (not the count) 


#Null or empty values are usually a problem. Think about why those null values can appear and think of ways of dealing with them.
#Check for transactions with null or empty values for the column amount.
select count(*) from trans where amount is null 
#Count how many transactions have empty and non-empty k_symbol (in one query).
select sum(k_symbol='') as k_empty, sum(not k_symbol='') as k_notempty from trans 
#where amount is not null 


# create a View - denormalise - take fields from multiple tables
#                -aggregate 
#                -add some logic 

#case statement - case when then else end - on the loan table, to capture status&sorted 
create or replace view loan_status as 
(select loan_id, amount-payments as bal, duration as term, 
case 
when status='A' then 'good-loan repaid'
when status='B' then 'defaulter-contract finished'
when status ='C' then 'good - on track'
else 'in debt- contract running'
end 
as 'status_descr'
from loan
order by status_descr, bal DESC);

#optional #create view if not exists ##

#searching with wildcards 
select * from district 
where A3 LIKE 'pra%'

select * from district 
where A3 regexp 'pra|south'


# Get transactions in the first 15 days of 1993.
select * from trans
where convert(date,date) between '1993-01-01' and '1993-01-15'

#Find the different values from the field A2 that start with the letter 'K'.

^k
where A2 regexp 'ˆk'
where A2 LIKE 'k%'

select distinct A2 from district where A2 regexp 'k$'


#group by 
# ??average amount of loan taken where status A 

select status, duration, floor(avg(amount)) from loan
group by status, duration;

# whats the biggest loan amount in each status ? 

select status, max(amount) from loan
group by status;

# order table - where ksymbol isnt blank - return the average amount per ksymbol 
# which ksymbol has the smallest avg amount ?

select round(avg(amount)) as average, k_symbol 
from bank.order 
where not k_symbol =''
group by k_symbol
order by average asc
limit 1;

# how many accounts per district ? 

select district_id, count(account_id) from account
group by district_id
order by count(account_id) ASC;

#DQL - vs DDL and DML - data querying language in mysql 

#DDL - data definition language 
# pk fk 
# integrity constraints 



# ddl commands you might use 
#CREATE - to create objects in the database. db , table
#ALTER - alters the structure of the database.
#DROP - delete objects from the database.
#TRUNCATE - remove all records from a table, including all spaces allocated for the records are removed.
#COMMENT - add comments to the data dictionary.
#RENAME - rename an object.

create database books;

use books;

drop table authors; 

create table authors 
(author_id INT NOT NULL, name VARCHAR(20), country VARCHAR(20), 
PRIMARY KEY (author_id));

drop table books; 

create table books 
(book_id INT NOT NULL, author_id INT, bookname VARCHAR(20), 
PRIMARY KEY (book_id));


# next step - we will set constraints on our table books and insert some data into both tables


#DML 
# INSERT
# SELECT
# UPDATE
# DELETE





