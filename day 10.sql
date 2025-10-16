CREATE TABLE Queue (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50),
    weight INT,
    turn INT
);
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES
(1, 'Alice', 120, 1),
(2, 'Bob', 150, 2),
(3, 'Charlie', 200, 3),
(4, 'Diana', 180, 4),
(5, 'Ethan', 220, 5),
(6, 'Fiona', 160, 6),
(7, 'George', 190, 7),
(8, 'Hannah', 170, 8);


/*
🚌 Bus Boarding Challenge You have a table of people in a queue
with their weight and boarding turn. The bus can carry up to 1000 kg. 
Find the name of the last person who can board the bus without 
exceeding the weight limit.*/

select *
from Queue



select person_name
from(select person_id,person_name,
			sum(weight) over(order by turn)  as summ
	from Queue ) as pip
where  summ <= 1000
order by summ desc
limit 1