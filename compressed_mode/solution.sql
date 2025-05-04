with cte as (
    select
        item_count
      , dense_rank() over (order by order_occurrences desc) as drank
  from items_per_order
)
select item_count
from cte
where drank = 1
;
