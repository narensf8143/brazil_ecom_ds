with OI as(
select 
order_id,

Shipping_dtm,
max(order_item_id) order_item_id,
sum(price) as price,   --max
sum(freight_value) as freight_value  --max
from {{ref("fact_order_Items")}}

group by 1,2 
),
paymnt as
(
    select 
ORDER_ID

, payment_method
,payment_installments
,payment_value
from {{ref("fact_order_payments")}}

)
,
ords as
(
select  
ORDER_ID,
CUSTOMER_ID ,
ORDER_STATUS,
Ord_Purchase_dtm,
--Ord_Approved_dtm,
Ord_Dely_Ship_Dtm,
Ord_Dely_dtm,
ord_Est_Dely_Dtm
from {{ref("fact_orders")}}

)

SELECT o.order_id, o.CUSTOMER_ID,o.Ord_Purchase_dtm, o.Ord_dely_dtm, 

oi.price,oi.freight_value
,p.payment_method,p.payment_installments,p.payment_value
from ords o
inner join OI as oi on oi.order_id = o.order_id
inner Join paymnt as p on p.ORDER_ID = o.order_id
