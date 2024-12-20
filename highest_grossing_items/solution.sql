with products_ranked as (
    select
        PS.category,
        PS.product,
        sum(PS.spend) as total_spend,
        dense_rank() over (partition by PS.category order by sum(PS.spend) desc) as drank
    from product_spend as PS
    --where year(PS.transaction_date) = 2022
    where extract(year from PS.transaction_date) = 2022
    group by
        PS.category,
        PS.product
)
select
    PR.category,
    PR.product,
    PR.total_spend
from products_ranked as PR
where PR.drank in (1, 2)
;