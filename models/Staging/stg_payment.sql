select 
Replace( ORDER_ID, '"', '') As ORDER_ID
,PAYMENT_SEQUENTIAL
,case when payment_type = 'boleto' THEN 'bank_cheque'
    else payment_type
    END as payment_method
,payment_installments
,payment_value
,current_date() as Dw_Updt_Dte

from {{ source('braz_ecom', 'order_payments') }}
--from pbdw_p.source_acq.order_payments
