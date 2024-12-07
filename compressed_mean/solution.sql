select
    round(
        --sum(IPO.item_count * IPO.order_occurrences) / sum(order_occurrences), 
        sum(IPO.item_count::decimal * IPO.order_occurrences) / sum(order_occurrences), 
        1) as mean
from items_per_order as IPO
;

/*not casting item_count as a decimal on datalemur will result in the following
  error: function round(double precision, integer) does not exist

  note: it should work fine w/o casting on other databases/*