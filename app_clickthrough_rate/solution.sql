select
    E.app_id,
    round((100.0 * 
           sum(case when E.event_type = 'click' then 1 else 0 end) / 
           sum(case when E.event_type = 'impression' then 1 else 0 end))
           , 2) as ctr 
from events as E
--where year(timestamp) = 2022
where E.timestamp >= '2022-01-01'
and E.timestamp <= '2023-01-01'
group by E.app_id
;