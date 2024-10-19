with order_Itm AS (

    select 
    order_id,
           -- product_id,
            seller_id,
            freight_value,
            price
           ,freight_value/ price as frieght_efficiency
    from {{ref("fact_order_Items")}}    
    
)

select
*,
case 
    when frieght_efficiency     <= 10   then 'A'
    when frieght_efficiency     <=20    then 'B'
    when frieght_efficiency     >= 21   then 'C'
    End as frieght_efficiency_Catgy
from order_Itm
