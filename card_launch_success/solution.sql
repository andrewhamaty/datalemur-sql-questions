/* METHOD 1 */
with cte as (
    select
        make_date(issue_year, issue_month, 1) as date
      , card_name
      , issued_amount
    from monthly_cards_issued
)
select
    min(date) over (partition by card_name) as date
  , card_name
  , issued_amount
from cte
order by issued_amount desc
;

/* METHOD 2*/
select distinct
    card_name
  , first_value(issued_amount) over (partition by card_name
                                     order by issue_year, issue_month)
    as issued_amount
from monthly_cards_issued
order by issued_amount desc
;
