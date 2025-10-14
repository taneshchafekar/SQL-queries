-- Step 1: Create the Employee table
CREATE TABLE Employee (
    employee_id INT,
    department_id INT,
    primary_flag VARCHAR(1),
    PRIMARY KEY (employee_id, department_id)
);

-- Step 2: Insert sample data
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES
(1, 1, 'N'),
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');

/* You have a table Employee(employee_id, department_id, primary_flag).

Each employee can belong to multiple departments.

primary_flag = 'Y' marks their primary department.

If an employee belongs to only one department, the flag is 'N'.

Write a query to return each employee's primary department. If they belong to only one department, return that one.*/

WITH op AS (
    SELECT employee_id
    FROM employee
    GROUP BY employee_id
    HAVING COUNT(employee_id) = 1
)

SELECT e1.employee_id, e1.department_id
FROM employee e1
LEFT JOIN op e2 ON e1.employee_id = e2.employee_id
WHERE e1.primary_flag = 'Y' OR e2.employee_id IS NOT NULL;
