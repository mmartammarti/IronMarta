select status, date_format(convert(t.date,date),'%M-%Y') as monthandyear,
count(distinct t.account_id) as noofaccounts,
count(distinct t.trans_id) as nooftrans,
ceiling(sum(t.amount)) as movedamount 
from trans t
join disp d using (account_id) 
join loan l using (account_id) 
where d.type = 'OWNER'
group by status, date_format(convert(t.date,date),'%M-%Y');


create or replace view monthly_active_users
 as 
 Select activitymonth, activityyear, count(distinct account_id) as active_users
 from user_activity 
 group by activitymonth, activityyear
 order by activityyear, activitymonth;
 
 # %difference 
 select *, round((active_users-prev_month)/active_users *100,2) as perchange 
 FROM monthonmont_users
 where prev_month is not null;
 
 SELECT 
    category_id
FROM
    category;
#there are 16 categories

select
c.category_id, AVG (f.rental_rate)
FROM
    film f
        JOIN
    film_category c USING (film_id)
group by category_id
order by AVG (f.rental_rate) desc;

