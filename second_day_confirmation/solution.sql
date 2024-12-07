select distinct E.user_id
from emails as E
inner join texts as T
  on E.email_id = T.email_id
--where datediff('day', E.signup_date, T.action_date) = 1
where extract(day from (T.action_date - E.signup_date)) = 1
and T.signup_action = 'Confirmed'
;

-- DataLemur does not support datediff()