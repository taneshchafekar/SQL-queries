
/* Write a solution to report the ids and the names of all managers, 
the number of employees who report directly to them, 
and the average age of the reports rounded to the nearest integer.
*/

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    reports_to INT,
    age INT
);


-- Insert new data
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES
(1, 'Michael', NULL, 45),
(2, 'Alice', 1, 38),
(3, 'Bob', 1, 42),
(4, 'Charlie', 2, 34),
(5, 'David', 2, 40),
(6, 'Eve', 3, 37),
(7, 'Frank', NULL, 50),
(8, 'Grace', NULL, 48);

select *
from Employees;

select *
from Employees e1
left join Employees e2 on e1.employee_id = e2.reports_to


select e1.employee_id,e1.name ,
	   count(e2.employee_id) as reports_count,
	   Round(avg(e2.age))  as average_age 
from Employees e1
left join 
	Employees e2 
	on e1.employee_id = e2.reports_to
where e2.employee_id is not null
group by e1.employee_id
order by e1.employee_id