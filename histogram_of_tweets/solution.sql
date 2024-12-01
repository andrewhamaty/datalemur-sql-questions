with total_tweets as (
    select
        T.user_id,
        count(T.tweet_id) as tweet_count_per_user,
    from tweets as T
    --where year(T.tweet_date) = '2022'
    where T.tweet_date >= '2022-01-01'
    and T.tweet_date <= '2022-12-31'
    group by T.user_id
)
select
    TT.tweet_count_per_user as tweet_bucket,
    count(TT.user_id) as users_num
from total_tweets as TT
group by TT.tweet_count_per_user
;

-- year() works with other dbs but not on datalemur