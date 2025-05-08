with cte as (
    select
        *
      , row_number() over (partition by user_id order by transaction_date asc) as days_in_a_row
    from transactions
)
select user_id
from cte
where days_in_a_row = 3
;
