select 
od.orderid, od.productid, od.unitprice, od.quantity, pr.productname, pr.supplierid, pr.categoryid ,
od.unitprice * od.quantity total,
(pr.unitprice * od.quantity) - (od.unitprice * od.quantity) discount
from {{'dbt_dataset.orderdetails'}}  od 
left join {{'dbt_dataset.products'}} pr on (od.productid = pr.productid)

-- WITH cte_totals AS (
--   SELECT 
--     od.*,
--     od.unitprice * od.quantity AS total,
--     pr.unitprice * od.quantity AS discount
--   FROM 
--     {{'dbt_dataset.orderdetails'}} od
--   LEFT JOIN 
--     {{'dbt_dataset.products'}} pr ON od.productid = pr.productid
-- )
-- SELECT 
--   *,
--   discount - total AS discount_amount
-- FROM 
--   cte_totals