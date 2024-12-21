with department_salaries_ranked as (
    select
        D.department_name,
        E.name,
        E.salary,
        dense_rank() over (partition by D.department_name order by E.salary desc) as drank
    from employee as E
    inner join department as D
      on E.department_id = D.department_id
    group by 
        D.department_name,
        E.name,
        E.salary
)
select
    DSR.department_name,
    DSR.name,
    DSR.salary
from department_salaries_ranked as DSR
where DSR.drank <= 3
order by
    DSR.department_name asc,
    DSR.salary desc,
    DSR.name asc
;