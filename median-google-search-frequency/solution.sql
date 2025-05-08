with recursive uncounted as (
    select
        searches,
        num_users,
        1 as n
    from search_frequency

    union all

    select
        searches,
        num_users,
        n + 1
    from uncounted
    where n + 1 <= num_users
),
searches_unnested as (
    select searches
    from uncounted
    order by searches
)
select percentile_cont(0.5) within group (order by searches) as median
from searches_unnested
