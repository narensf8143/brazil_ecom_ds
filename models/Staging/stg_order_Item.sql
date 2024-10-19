
select 
Replace( ORDER_ID, '"', '') order_id,
order_item_id,
Replace( product_id, '"', '') product_id,
Replace( seller_id, '"', '') seller_id,
To_date(shipping_limit_date) Shipping_dtm,
price,
freight_value,
current_date() as Dw_Updt_Dte

from {{ source('braz_ecom', 'order_items') }}

--from  pbdw_p.source_acq.order_items
        