select  
Replace( ORDER_ID, '"', '') As ORDER_ID,
Replace( CUSTOMER_ID, '"', '') As CUSTOMER_ID ,
ORDER_STATUS,
TO_date(ORDER_PURCHASE_TIMESTAMP) Ord_Purchase_dtm,
TO_date(ORDER_DELIVERED_CARRIER_DATE) Ord_Dely_Ship_dtm,
TO_date(ORDER_DELIVERED_CUSTOMER_DATE) Ord_dely_dtm,
TO_date(ORDER_ESTIMATED_DELIVERY_DATE) ord_est_dely_dtm,
current_date() as Dw_Updt_Dte


from {{ source('braz_ecom', 'orders') }}
