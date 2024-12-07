with job_counts as (
    select 
        JL.company_id, 
        JL.title, 
        JL.description, 
        count(JL.job_id) as job_count
    from job_listings as JL
    group by 
        JL.company_id, 
        Jl.title, 
        JL.description
)
select count(distinct JC.company_id) as duplicate_companies
from job_counts as JC
where JC.job_count > 1;