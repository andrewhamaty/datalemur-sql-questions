CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(255) NOT NULL
);

INSERT INTO orders (order_id, item) VALUES
(1, 'Chow Mein'),
(2, 'Pizza'),
(3, 'Pad Thai'),
(4, 'Butter Chicken'),
(5, 'Eggrolls'),
(6, 'Burger'),
(7, 'Tandoori Chicken');