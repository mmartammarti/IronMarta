# 1. 	Write a SELECT statement that lists the customer id along with their account number, type, the city the customer lives in and their postalcode.
select c.CustomerID, c.CustomerType,c.AccountNumber,a.City, a.PostalCode
from customer c
join customeraddress ca using(CustomerID)
join address a using(AddressID);

# 2. 	Write a SELECT statement that lists the 20 most recently launched products, their name and colour
select Name, ProductNumber, Color from product
order by SellStartDate DESC
LIMIT 20;

# 3. 	Write a SELECT statement that shows how many products are on each shelf on 2/5/98
select Shelf, count(distinct ProductID)
from productinventory
where ModifiedDate = '1998-05-02 00:00:00'
group by Shelf;

# 4. 	I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?
select c.EmailAddress from contact c
join vendorcontact vc using(ContactID)
join vendor v using (VendorID)
where c.FirstName = 'Stuart'
and v.Name = 'G & K Bicycle Corp.'

# 5. 	What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?
select sum(TaxAmt) from salesorderheader sh
join stateprovince sp using(TerritoryID)
join countryregion cr using(CountryRegionCode)
where cr.Name = 'Germany';

# 6. 	Summarise the distinct # transactions by month



# 7.  Which ( if any) of the sales people exceeded their sales quota this year and last year?


# 8.  Do all products in the inventory have photos in the database and a text product description? 


# 9.  What's the average unit price of each product name on purchase orders which were not fully, but at least partially rejected?


# 10. How many engineers are on the employee list? Have they taken any sickleave?


# 11. How many days difference on average between the planned and actual end date of workorders in the painting stages?
