with times as (
    select
        AB.age_bucket,
        case
            when A.activity_type = 'send'
            then A.time_spent
            else 0
        end as sending,
        case
            when A.activity_type = 'open'
            then A.time_spent
            else 0
        end as opening
    from activities as A
    join age_breakdown as AB
      on A.user_id = AB.user_id
)
select
    T.age_bucket,
    round(((sum(T.sending) / sum(T.sending + T.opening)) * 100.0), 2) as send_perc,
    round(((sum(T.opening) / sum(T.opening + T.sending)) * 100.0), 2) as open_perc
from times as T
group by T.age_bucket
;