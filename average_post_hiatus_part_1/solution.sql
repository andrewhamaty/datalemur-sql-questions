select
    P.user_id,
    max(P.post_date::date) - min(P.post_date::date) as days_between
from posts as P
where year(P.post_date) = 2021
group by P.user_id
having count(P.post_id) > 1
;