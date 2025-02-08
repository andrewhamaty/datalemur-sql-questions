with order_counts as (
    select count(O.order_id) as total_orders    
    from orders as O
)
select
    case
        when O.order_id % 2 != 0 and O.order_id != OC.total_orders
        then O.order_id + 1
        when O.order_id % 2 != 0 and O.order_id = OC.total_orders
        then O.order_id
        else O.order_id - 1
    end as corrected_order_id,
    O.item
from Orders as O
cross join order_counts as OC
order by corrected_order_id asc
;