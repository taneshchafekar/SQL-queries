
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    salary INT
);

INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES
(3, 'Mila', 9, 60301),
(12, 'Antonella', NULL, 31000),
(13, 'Emery', NULL, 67084),
(1, 'Kalel', 11, 21241),
(9, 'Mikaela', NULL, 50937),
(11, 'Joziah', 6, 28485);


select * from Employees

/*Find the IDs of employees earning less than $30,000 whose manager
is no longer in the Employees table. Return results ordered by employee_id.*/


select employee_id
from Employees
where salary < 30000 and manager_id not in (select employee_id from Employees) 


 