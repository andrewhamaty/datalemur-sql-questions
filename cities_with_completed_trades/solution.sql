select
    U.city,
    count(*) as total_orders
from trades as T
inner join Users as U
  on T.user_id = U.user_id
where T.status = 'Completed'
group by U.city
order by total_orders desc
limit 3
;