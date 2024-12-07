select 
    MCI.card_name,
    max(MCI.issued_amount) - min(MCI.issued_amount) as difference
from monthly_cards_issued as MCI
group by MCI.card_name
order by difference desc
;