CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    PRIMARY KEY (product_id, start_date, end_date)
);
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);
-- Prices
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

-- UnitsSold
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

select * from Prices;
select * from UnitsSold;

-- query to calculate the average selling price per product, rounded to 2 decimal
select p.product_id,coalesce(round(sum(p.price * u.units)*1.0/nullif(sum(u.units),0),2),0) as average_price
from Prices p
left join UnitsSold u on p.product_id = u.product_id 
and u.purchase_date between p.start_date and p.end_date
group by p.product_id;