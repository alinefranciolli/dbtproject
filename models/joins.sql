with prod as (
    select 
ct.categoryname, 
sp.companyname suppliers, 
pd.productname, 
pd.unitprice, 
pd.productid
from {{'dbt_dataset.products'}} pd 
left join {{'dbt_dataset.suppliers'}} sp on (pd.supplierid = sp.supplierid)
left join {{'dbt_dataset.categories'}} ct on (pd.categoryid = ct.categoryid)
), orddetai as (
    select pd.*, od.orderid, od.quantity, od.discount
    from {{ref('orderdetails')}} od 
    left join prod pd on (od.productid = pd.productid)
)
select * from orddetai

select *
from {{source('dbt_dataset','orderdetails')}}