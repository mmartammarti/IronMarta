select * from account
where district_id=1;

# this is a first query
select account_id, frequency from account;
#annotation this is not a query

select client_id, district_id from client;
select * from district where A1 = 50;

#SELECT <fields> 
#FROM <table>
#where <condition is true>

#alias for fields /columns 
# alias for tables 

select tr.trans_id as transaction,
tr.account_id as acc,
tr.type as 'credit-debit', 
tr.operation as mode, 
tr.amount
from trans tr
where k_symbol= ' ';

# limit 
select * from trans
order by trans_id
limit 30;

# top 10 districts, ordered by no of inhabitants 
SELECT *, A4 as inhabitants from district
ORDER BY A4 DESC
LIMIT 10;

 
 #Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order by trans_id' at line 3
Select 11* 4;

select distinct A1 from district;

select distinct account_id from trans;

----------

#select (maths) from 

SELECT 
    loan_id,
    amount - payments AS loanbalance,
    (amount - payments) * 0.039 AS eurobal
FROM
    loan
ORDER BY loanbalance DESC;


# where = and or  - accounts where the district is Prague or Most

select account_id from account
where district_id = 1 and frequency='POPLATEK MESICNE';
# where  >  < =  all loans where balance is greater than 150k Kr 

SELECT 
    loan_id,
    amount - payments AS loanbalance,
    (amount - payments) * 0.039 AS eurobal
FROM
    loan
where (amount - payments) > 150000
ORDER BY loanbalance DESC;
# where    and > 
#loan - any loans which are loan status b - written off / bad debt
#and amount > 100,000

select loan_id, account_id , status, amount
from loan 
where (status = 'B' or status = 'D') and not duration = 24;
#where status = 'B' and amount >100000
# where status in ('B', 'D')
# where (status = 'B' or status = 'D') and duration = 12
# where (status = 'B' or status = 'D') and not duration = 24


#count(*) 
#count(loan_id)
# sum , min,  max , avg 
# count of order id in order table 
select count(order_id) from bank.order;

