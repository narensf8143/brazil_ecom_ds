 with customers_detail as
(
    select  customer_id, customer_unique_id,customer_city, customer_state
    from pbdw_p.source_acq.customers
)
,Ord_stat as

(
    select customer_id,
Min(date(Ord_Purchase_dtm)) first_ord_Purchs_dte,
MAX(date(Ord_Purchase_dtm)) Last_ord_purchs_dte

from {{ref("stg_orders")}}
group by customer_id
)

select
c.customer_id
,c.customer_unique_id
,c.customer_city
,c.customer_state
,o.first_ord_Purchs_dte
,o.Last_ord_purchs_dte
from  customers_detail as c
left join Ord_stat as O on c.customer_id = O.customer_id
  