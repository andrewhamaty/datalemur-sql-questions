with lagged as (
    select
        *
      , lag(transaction_id) over (
            partition by merchant_id, credit_card_id, amount, cast(transaction_timestamp as date)
            order by transaction_timestamp
        ) as previous_transaction_id
      , lag(transaction_timestamp) over (
            partition by merchant_id, credit_card_id, amount, cast(transaction_timestamp as date)
            order by transaction_timestamp
        ) as previous_transaction_timestamp
    from transactions
),
repeated_flag as (
    select
        case
            when extract(epoch from (transaction_timestamp - previous_transaction_timestamp)) / 60 <= 10
            and previous_transaction_id is not null
            then 1
            else 0
        end as repeated
    from lagged
)
select sum(repeated) as payment_count
from repeated_flag;
