select PRODUCT_ID, product_category_name,  product_name_lenght,
 PRODUCT_DESCRIPTION_LENGHT
,product_photos_qty, product_weight_g, product_length_cm
, product_height_cm, product_width_cm   
,current_date() as Dw_Updt_Dte

from {{ source('braz_ecom', 'Products') }}

--from pbdw_p.source_acq.products
 