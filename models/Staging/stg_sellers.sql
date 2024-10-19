select SELLER_ID, seller_zip_code_prefix
, seller_city, seller_state
,current_date() as Dw_Updt_Dte
from {{ source('braz_ecom', 'sellers') }}
--from pbdw_p.source_acq.sellers

