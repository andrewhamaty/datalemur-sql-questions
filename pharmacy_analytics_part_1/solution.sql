select
    PS.drug,
    PS.total_sales - PS.cogs as total_profit
from pharmacy_sales as PS
order by total_profit desc
limit 3
;