with ranked_artists as (
    select
        A.artist_name,
        dense_rank() over (order by count(A.artist_name) desc) as artist_rank
    from artists as A
    inner join Songs as S
      on A.artist_id = S.artist_id
    inner join global_song_rank as GSR
      on S.song_id = GSR.song_id
    where GSR.rank <= 10
    group by A.artist_name
)
select
    RA.artist_name,
    RA.artist_rank
from ranked_artists as RA
where RA.artist_rank <= 5
;