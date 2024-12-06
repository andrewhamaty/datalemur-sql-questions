with message_stats as (
    select 
        M.sender_id,
        count(M.sender_id) as message_count,
        dense_rank() over (order by count(M.sender_id) desc) as sender_rank
    from messages as M
    --where year(M.sent_date) = 2022
      --and month(M.sent_date) = 8 
    where extract(year from M.sent_date) = '2022'
      and extract(month from M.sent_date) = '8'
    group by M.sender_id
)
select
    MS.sender_id,
    MS.message_count
from message_stats as MS
where MS.sender_rank <=2
order by MS.message_count desc
;

-- year() & month() don't work with this db