-- METHOD 1
with candidate_skills as (
    select 
        C.candidate_id,
        string_agg(C.skill, ', ') as skills
    from candidates as C
    group by C.candidate_id
)
select CS.candidate_id
from candidate_skills as CS
where CS.skills like '%PostgreSQL%'
  and CS.skills like '%Python%'
  and CS.skills like '%Tableau%'
order by CS.candidate_id
;


-- METHOD 2
select candidate_id
from candidates
where skill = 'Python'

intersect

select candidate_id
from candidates
where skill = 'Tableau'

intersect

select candidate_id
from candidates
where skill = 'PostgreSQL'
order by candidate_id asc
;