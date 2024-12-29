with confirmations_encoded as (
    select
        case
            when T.signup_action = 'Confirmed'
            then 1
            else 0
        end as confirmations
    from emails as E
    left join texts as T
      on E.email_id = T.email_id
      and T.signup_action = 'Confirmed'
)
select 
    round(sum(confirmations)::decimal / count(confirmations), 2) as confirm_rate
from confirmations_encoded
;

-- dividing an integer with another integer would sometimes result in '0'
-- to avoid, need to cast either the denominator or the numerator to DECIMAL type 