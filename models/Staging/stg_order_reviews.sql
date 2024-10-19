select 
REVIEW_ID,
order_id,
review_score,
review_comment_title,
review_comment_message,
TO_date(review_answer_timestamp) review_answer_dtm,
TO_date(review_creation_date) review_create_dtm,
current_date() as Dw_Updt_Dte

from {{ source('braz_ecom', 'order_reviews') }}

--from pbdw_p.source_acq.order_reviews
        