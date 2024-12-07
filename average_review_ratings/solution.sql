select
    --month(R.submit_date) as mth,
    extract(month from R.submit_date) as mth,
    R.product_id,
    --round(mean(R.stars), 2) as avg_stars
    round(avg(R.stars), 2) as avg_stars
from reviews as R
group by
    R.product_id,
    mth
order by 
    mth,
    R.product_id
;

-- need to use avg() instead of mean() on datalemur
-- also need to use extract() instead of month()