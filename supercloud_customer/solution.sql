-- Solution 1 
select CC.customer_id
from customer_contracts as CC
inner join products as P
  on CC.product_id = P.product_id
group by CC.customer_id
having count(distinct P.product_category) = 3
;


-- Solution 2
-- Takes into account the the possibility of the # of categories changing
select CC.customer_id
from customer_contracts as CC
inner join products as P
  on CC.product_id = P.product_id
group by CC.customer_id
having count(distinct product_category) = (select count(distinct product_category) 
                                           from products)
;