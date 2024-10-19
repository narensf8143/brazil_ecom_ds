with OrderItem as
(

    Select * from {{ref('stg_order_Item')}}
),
Product as
(
    Select * from {{ref('stg_products')}}
),
Sellers as
(
    select * from {{ref('stg_sellers')}}
)

select 

OI.order_id,
OI.order_item_id,
P.PRODUCT_CATEGORY_NAME,
P.PRODUCT_NAME_LENGHT,
P.product_description_lenght,
P.PRODUCT_WEIGHT_G,
P.PRODUCT_WIDTH_CM,
P.PRODUCT_HEIGHT_CM,
P.PRODUCT_LENGTH_CM,

S.SELLER_CITY,
S.SELLER_STATE,
S.SELLER_ZIP_CODE_PREFIX,
OI.seller_id,


OI.Shipping_dtm,
OI.price,
OI.freight_value


from OrderItem as OI
Inner Join Product as  P on P.PRODUCT_ID  = OI.PRODUCT_ID
Inner Join Sellers as S on S.SELLER_ID = OI.SELLER_ID
