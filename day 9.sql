CREATE TABLE Products (
    product_id INT,
    new_price INT,
    change_date DATE,
    PRIMARY KEY (product_id, change_date)
);
INSERT INTO Products (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');

/*You are asked to write a query that returns the price of each product on the date 2019-08-16.

This means:

For each product, find the most recent price change on or before 2019-08-16.

If a product has no price changes before that date, its price is still the default value of 10.*/

select * 
from products;





with ranked_prices AS (
SELECT 
    product_id,
    new_price,
    change_date,
    ROW_NUMBER() OVER (
      PARTITION BY product_id 
      ORDER BY change_date DESC
    ) AS rn
FROM Products
WHERE change_date <= '2019-08-16'
),
fin as(
SELECT product_id, new_price,change_date
FROM ranked_prices 
WHERE rn = 1
),
nnp as (
select  distinct product_id FROM products 
)
select n.product_id,coalesce(new_price,10)
from fin f
right join nnp n on f.product_id = n.product_id
