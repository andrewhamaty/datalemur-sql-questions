select
    PS.manufacturer,
    count(PS.drug) as drug_count,
    sum(PS.cogs - PS.total_sales) as total_loss
from pharmacy_sales as PS
where PS.cogs > PS.total_sales
group by PS.manufacturer
order by total_loss desc
;