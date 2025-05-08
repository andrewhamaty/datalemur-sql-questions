with cte as (
    select
        transaction_id
      , product_id
      , spend as curr_year_spend
      , transaction_date
      , lag(spend) over (
            partition by product_id
            order by transaction_date
            ) as prev_year_spend
    from user_transactions
)
select
    extract(year from transaction_date) as year
  , product_id
  , curr_year_spend
  , prev_year_spend
  , round(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100, 2) as yoy_rate
from cte
