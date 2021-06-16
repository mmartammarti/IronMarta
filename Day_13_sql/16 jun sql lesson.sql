#lets start with some DDL on our books db

# yesterday we created the tables - ill drop and recreate them 

create database books;

use books;

#drop table authors; 

create table authors 
(author_id INT NOT NULL, name VARCHAR(20), country VARCHAR(20), 
PRIMARY KEY (author_id));

#drop table books; 

create table books 
(book_id INT NOT NULL, author_id INT, bookname VARCHAR(20), 
PRIMARY KEY (book_id));

# next step - we will set constraints on our table books and insert some data into both tables
# 2 tables - effectively join together pk fk relationship 
# null / default null 
# dtypes 
# auto increment 

#step 1 - auto increment id field and set null defaults 

drop table authors; 

create table authors 
(author_id INT AUTO_INCREMENT NOT NULL,
name VARCHAR(20) DEFAULT NULL,
country VARCHAR(20) DEFAULT NULL,
PRIMARY KEY (author_id));

# data types  https://www.tutorialspoint.com/mysql/mysql-data-types.htm

#insert data - 1 value  or multiple values (author name) 
insert into authors (name) VALUES ('D Spiegelhalter');

insert into authors (name) VALUES ('D McCandless'),('T Harford');

# insert data - multiple columns 
insert into authors (name, country) 
VALUES ('H Rosling', 'Sweden'),('C Craido Perez', 'Britain'),('M Gladwell','USA');

# add missing values 
update authors set country='Britain' 
where author_id in (1,2,3);

# add a book into book table 
INSERT INTO books (bookname) VALUES ('The Art of Statistics');
#Error Code: 1406. Data too long for column 'bookname' at row 1

# more space needed!
alter table books modify bookname VARCHAR(50);
#Error Code: 1364. Field 'book_id' doesn't have a default value

drop table if exists books;
# recreate book table with constraints, defaults, auto increment, longer column 
create table books
(book_id INT AUTO_INCREMENT NOT NULL, 
author_id INT NOT NULL, 
bookname VARCHAR(50), 
PRIMARY KEY (book_id),
KEY idx_fk_author_id (author_id),
CONSTRAINT fk_author_id FOREIGN KEY (author_id)
REFERENCES authors(author_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

#try dropping authors

# drop table authors;

#insert some book data 
insert into books (bookname, author_id) VALUES
('The Art of Statistics',1),('Knowledge is beautiful',2),
('Information is Beautiful',2),('The Data Detective',3),
('Factfulness', 4),('Invisible Women', 5),('Outliers',6), ('Blink',6);

# add a column 'i have read it' tinyint (boolean) default false (0)
alter table books 
add column I_have_read_it boolean default false;

#fill in the column per your reading history
update books set I_have_read_it= true
where book_id in(1,3,4,6,7);


#join to query 

select b.bookname, a.name, a.country, b.I_have_read_it 
from books b
right join authors a
on b.author_id = a.author_id ;

select * from books right join authors using(author_id);

insert into authors (name, country) 
VALUES('D Trump','USA');

select * from books join authors using(author_id);

select * 
from bank.account ac
join bank.district d
on ac.district_id = d.A1;








------------

#Group by plus having 

# erd - cardinality 1:M M:M M:1 PK FK entities, use of colour, structure types , types of ERD 

#Conceptual data model: The highest-level view containing the least detail. Its value is showing overall scope of the model and portraying the system architecture. For a system of smaller scope, it may not be necessary to draw. Instead, start with the logical model.
#Logical data model: Contains more detail than a conceptual model. More detailed operational and transactional entities are now defined. The logical model is independent of the technology in which it will be implemented.
#https://www.lucidchart.com/pages/er-diagrams


# if time (more regexp examples)



