select
    sum(
        case
            when V.device_type = 'laptop'
            then 1
            else 0
        end) as laptop_views
  , sum(
        case
            when V.device_type in ('tablet', 'phone')
            then 1
            else 0
        end) as mobile_views
from viewership as V
;