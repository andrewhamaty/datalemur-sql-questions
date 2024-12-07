CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    submit_date DATETIME NOT NULL,
    product_id INT NOT NULL,
    stars INT NOT NULL CHECK (stars BETWEEN 1 AND 5)
);

INSERT INTO reviews (review_id, user_id, submit_date, product_id, stars) VALUES
(6171, 123, '2022-06-08 00:00:00', 50001, 4),
(7802, 265, '2022-06-10 00:00:00', 69852, 4),
(5293, 362, '2022-06-18 00:00:00', 50001, 3),
(6352, 192, '2022-07-26 00:00:00', 69852, 3),
(4517, 981, '2022-07-05 00:00:00', 69852, 2);

select
    --month(R.submit_date) as mth,
    extract(month from R.submit_date) as mth,
    R.product_id,
    --round(mean(R.stars), 2) as avg_stars
    round(avg(R.stars), 2) as avg_stars
from reviews as R
group by
    R.product_id,
    mth
order by 
    mth,
    R.product_id
;

-- need to use avg() instead of mean() on datalemur
-- also need to use extract() instead of month()