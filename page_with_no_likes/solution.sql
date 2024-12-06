select pages.page_id
from pages
left join page_likes
    on pages.page_id = page_likes.page_id
where page_likes.user_id is null
order by pages.page_id asc
;