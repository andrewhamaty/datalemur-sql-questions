with salaries_ranked as (
    select
        E.salary,
        dense_rank() over (order by E.salary desc) as drank
    from employee as E
)
select SR.salary as second_highest_salary
from salaries_ranked as SR
where SR.drank = 2
;