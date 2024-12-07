select
    E1.employee_id,
    E1.name as employee_name
from employee as E1
inner join employee as E2
  on E1.manager_id = E2.employee_id
where E1.salary > E2.salary
;