with ordered_transactions as (
    select
        T.user_id,
        T.spend,
        T.transaction_date,
        dense_rank() over (partition by T.user_id order by T.transaction_date) as transaction_order
    from transactions as T
)
select
    OT.user_id,
    OT.spend,
    OT.transaction_date
from ordered_transactions as OT
where OT.transaction_order = 3
;