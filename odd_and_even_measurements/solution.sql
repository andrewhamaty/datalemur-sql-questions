with ranked_measurements as (
  select 
    cast(measurement_time as date) as measurement_day, 
    measurement_value, 
    row_number() over (
        partition by cast(measurement_time as date) 
        order by measurement_time) as measurement_num 
  from measurements
),
evens_and_odds as (
    select 
        measurement_day,
        case
            when measurement_num % 2 = 1
            then measurement_value
            else 0
        end as odds,
        case
            when measurement_num % 2 = 0
            then measurement_value
            else 0
        end as evens
    from ranked_measurements
)
select
    measurement_day,
    sum(odds) as odd_sum,
    sum(evens) as even_sum
from evens_and_odds
group by measurement_day
;