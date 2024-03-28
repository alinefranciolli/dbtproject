with calc_employees as (select 
extract (year from current_date) - extract( year from birthdate) age,
extract (year from current_date) - extract( year from hiredate) lengthofservice,
firstname || '  '  || lastname name,  
* 
from {{ 'dbt_dataset.employees' }} 
)
select * from calc_employees
