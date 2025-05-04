with international_calls as (
    select case
            when info1.country_id != info2.country_id
            then 1.0
            else 0
            end as international
    from phone_calls as calls
    inner join phone_info as info1 on calls.caller_id = info1.caller_id
    inner join phone_info as info2 on calls.receiver_id = info2.caller_id
)
select round(sum(international) / count(*) * 100, 1) as international_calls_pct
from international_calls
;
