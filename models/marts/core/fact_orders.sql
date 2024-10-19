select 
order_id,
CUSTomer_ID,
Order_Status,
Ord_Purchase_dtm,
--Ord_Approved_dtm,
Ord_Dely_Ship_Dtm,
Ord_Dely_dtm,
ord_Est_Dely_Dtm,
Dw_Updt_Dte

from
{{ref('stg_orders')}}