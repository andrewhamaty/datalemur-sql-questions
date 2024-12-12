select
    PS.manufacturer,
    concat('$', round(sum(PS.total_sales) / 1000000), ' ', 'million') as sales_mil
from pharmacy_sales as PS
group by PS.manufacturer
order by 
    sum(PS.total_sales) desc,
    PS.manufacturer asc
;