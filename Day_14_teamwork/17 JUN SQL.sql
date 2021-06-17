#joining multiple tables 

#lets say we want to join the client to the account, you can see from the erd 
#this means going through the disp table 

#short hand version 
select * from client c
join disp d
using (client_id)
join account a
using (account_id);


#long hand version 
select * from client c
join disp d
on c.client_id=d.client_id
join account a
on d.account_id=a.account_id
order by c.client_id;

#you can use USING() instead of on as a short hand if the join is on two tables 
#with the same field name 

#WATCH OUT for duplicates caused by incorrect joins 
#(eg joining client and account via district id)
select * from account a
join district d 
on a.district_id = d.A1
join client c
on d.A1 = c.district_id
order by c.client_id; 

# this query works but we end up with many duplicates >50k rows 

#disp table contains owner or disponent.
#if we want to see which clients own which accounts we add a WHERE condition 

select * from client c
join disp d
using (client_id)
join account a
using (account_id)
where d.type = 'OWNER'
order by c.client_id;


# join clients to loans 
# bring client id, district id, loan id, account_id, district name, amount of loan
# create a view which stores them as 'clients_and_loans' 

drop view if exists clients_loans;

create view clients_loans as
select c.client_id, dp.account_id, c.district_id, l.loan_id, l.amount, 
dt.A2 as district_name
from client c
join disp dp 
on c.client_id = dp.client_id
join loan l
on dp.account_id = l.account_id
join district dt
on c.district_id = dt.A1
where dp.type = 'OWNER'
order by c.client_id; 

# List districts together with total amount borrowed and average loan amount

#using our view 
select sum(cl.amount) as total_borrowed, round(avg(cl.amount)) as loan_amount,
 cl.district_name
from clients_loans cl
group by cl.district_name
order by cl.district_name;

#using a join 
select sum(l.amount) as total_borrowed, round(avg(l.amount)) as loan_amount,
 d.A2 as district_name
from loan l
join account a
using (account_id)
join district d
on a.district_id=d.A1
group by d.A2
order by district_name;

#self join - joining a table to itself - for some reason 
#often used for employee tables where table contains reporting line hierarchy
#alias the table with two different aliases 

# example self join - accounts in the same district 
SELECT * 
FROM account a1
join account a2 
on a1.account_id <>a2.account_id
and a1.district_id =a2.district_id
order by a1.district_id, a1.account_id;

#example self join client owners who are also disponents on their accounts
select * from disp d1
join disp d2 
on d1.account_id=d2.account_id
and d1.type <> d2.type;

---------

#window functions 

#types of windows fx - aggreg avg sum count countd min max 
# plus rank dense rank row number lag lead 
# define the function, use OVER() and optionally define a partition and order by 


# example large loans, compared to the avg balance on that duration across the bank
select loan_id, account_id,
 amount, payments, duration, amount-payments as "Balance",
round(avg(amount-payments) over (partition by duration)) as Avg_Balance
from bank.loan
where amount > 100000
order by duration, balance desc;


# we want to rank the clients on the amount borrowed in each district (biggest =1)
#hint: use your clients_loans view

select *, 
rank() over (partition by district_id order by amount desc) as ranking
from clients_loans
order by district_name;

#to filter by rank we would use a sub query - we will see this tomorrow 