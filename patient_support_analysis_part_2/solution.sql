with cte as (
    select
        *
      , case
          when call_category = 'n/a'
          or call_category is null
          then 1
          else 0
        end as uncategorised
    from callers
)
select
    round((sum(uncategorised) / count(uncategorised)) * 100, 1)
from cte
;
