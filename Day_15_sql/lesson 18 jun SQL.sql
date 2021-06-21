# windowfx() OVER (partition by order by) 

# row_no window fx - top 5 loans by bad status B and D 
#partition by status 
#order by amount 
#order by and limit in the clause 
# kind of ranking - row no and limit does the job 
select loan_id, amount, status,
row_number() OVER(partition by status order by amount DESC) as rowno 
from loan 
where status in('B','D')
order by rowno
limit 10;

# select (select...) 

#inner query first !
# select loans where status is b or d and amount is >400k 

select loan_id, status, amount, MONTH(date) as month
from loan 
where loan_id IN
(
select loan_id 
from loan 
where status in ('B','D')
and amount >400000
);

# example - return the loans which are bigger than average of all loans

#inner query 

select round(avg(amount)) from loan;

# outer query 

select * from loan 
where amount > 
(select avg(amount) from loan) 
order by amount DESC
limit 50;

# subquery returns a table - multiple columns and rows 
# give the subquery an alias 
#Find out the average number of transactions by account. 
# Get those accounts that have more transactions than the average.


#inner query - count transactions per account 
#then do an average 
select round(avg(num_trans)) from
(
select account_id, count(trans_id) num_trans
 from trans
group by account_id
) t1;


#outer query - get account no and no of transactions 
select t.account_id, a.frequency, count(t.trans_id) as num_trans
from trans t
join account a
using(account_id)
group by t.account_id
having count(t.trans_id) > 
(
select round(avg(num_trans)) from
(
select account_id, count(trans_id) num_trans
 from trans
group by account_id
) t1
) 
order by num_trans desc;



-- Get a list of accounts from Central Bohemia using a subquery.
select * from account 
where district_id in (
select A1 from district where A3 = 'central Bohemia'
)
;

-- Rewrite the previous as a join query.
select a.*, d.A3 from account a
join district d on a.district_id=d.A1
where d.A3 = 'central Bohemia';


-- Discuss which method will be more efficient. efficiency = ease of writing 

#subquery filter by rank 
select * from
(
select loan_id, amount, status,
dense_rank() OVER (partition by status order by amount desc) as ranking 
from loan
) statusranking
where ranking <=3
order by status
; 
