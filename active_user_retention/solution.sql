/* METHOD 1 */
with cte as (
    select *
    from user_actions
    where extract(month from event_date) = 7
      and extract(year from event_date) = 2022
      and event_type in ('sign-in', 'like', 'comment')
      and user_id in (select user_id
                      from user_actions
                      where extract(month from event_date) = 6
                        and extract(year from event_date) = 2022
                        and event_type in ('sign-in', 'like', 'comment')
                        )
)
select
    extract(month from event_date) as month
  , count(distinct user_id) as monthly_active_users
from cte
group by month;



/* METHOD 2 */
select
    extract(month from UA1.event_date) as month
  , count(distinct UA1.user_id) as monthly_active_users
from user_actions UA1
inner join user_actions UA2
  on UA1.user_id = UA2.user_id
where extract(month from UA1.event_date) = 7
  and extract(year from UA1.event_date) = 2022
  and UA1.event_type in ('sign-in', 'like', 'comment')
  and extract(month from UA2.event_date) = 6
  and extract(year from UA2.event_date) = 2022
  and UA2.event_type in ('sign-in', 'like', 'comment')
group by extract(month from UA1.event_date)
