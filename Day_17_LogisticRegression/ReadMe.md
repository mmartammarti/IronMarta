# Alt-The Logistic Regression Lab explained
## 💶 Machine Learning example for a Banc Case Stud 💶

###### * following the Jupyter Notebook file Logistic_regression_bank_outline

## 0. Project Brief
##### Good or bad loans

__Scenario__: We are risk analysts employed at a bank. Our team is focussed evaluating the risk in loans given in order to predict future loan requests more accurately.

__Challenge__: This Case study has been centered in analizing through Machine Learning system wether the clients in a bank have good or bad loans.

__Problem__: The focuss is help the bank staff evaluate and easily detect if a client is worth to be given a loan or if it's better not to rosk the bank's business safety because of it.

Find all the necessary documents and datasets in [here](https://github.com/mmartammarti/BEES-DAFT-MAY21).

## 1. Import the Libraries 
##### Having the right tools to help us go through the exercise
<img width="361" alt="Screenshot 2021-06-22 at 17 45 10" src="https://user-images.githubusercontent.com/30186859/122956779-98a31a80-d381-11eb-88e9-6809f1181c16.png">

```import pandas as pd 
import numpy as np 
import seaborn as sns 
import matplotlib.pyplot as plt 

from sqlalchemy import create_engine 
import pymysql 
import getpass
password=getpass.getpass()
```


## 2. Connecting to SQL 
##### Getting the data from our SQL database
<img width="1017" alt="Screenshot 2021-06-22 at 17 45 54" src="https://user-images.githubusercontent.com/30186859/122956889-b2dcf880-d381-11eb-9668-35fb1dee6f33.png">

In the second code we are trying 

```
df=pd.read_sql_query('''
select l.loan_id, l.status, count(distinct t.trans_id) as nooftrans,
DATEDIFF(19981231, convert(a.date,date)) as ageindays, 
d.A12 as 95unemp, d.A13 as 96unemp, dp.type,
l.amount as loanamount, c.birth_number, d.A15 as crime95, d.A16 as crime96,
round((l.amount-l.payments)/l.amount,2) as ratiopaid
from loan l
left join trans t
using(account_id)
left join account a
using(account_id)
left join district d
on a.district_id = d.A1
left join disp dp
on a.account_id= dp.account_id 
left join client c
using(client_id)
where l.status in('A','B') and dp.type='OWNER'
group by loan_id, l.amount, status, d.A12, d.A13, c.birth_number, d.A15, d.A16, DATEDIFF(19981231, convert(a.date,date)),
 dp.type, round((l.amount-l.payments)/l.amount,2)
''', engine)
```

```
```
