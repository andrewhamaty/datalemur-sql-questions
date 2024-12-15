with call_count as (
    select
        count(C.case_id) as num_calls
    from callers as c
    group by C.policy_holder_id
)
select count(CC.num_calls) as policy_holder_count
from call_count as CC
where CC.num_calls >= 3
;
