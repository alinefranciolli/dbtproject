with markup as (
    SELECT *,
    first_value(string_field_0)
    over (partition by string_field_1, string_field_2 order by string_field_1
    rows between unbounded preceding and unbounded following) as result
    FROM {{ 'dbt_dataset.customers' }}
), removed as (
    select distinct result from markup
), final as ( 
    select * from {{ 'dbt_dataset.customers' }}
where string_field_0 in (select result from removed ) )

select * from final