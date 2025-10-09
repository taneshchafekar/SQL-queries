select * from employee;
-- Step 1: Create the Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    managerId INT
);

-- Step 2: Insert sample data
INSERT INTO Employee (id, name, department, managerId) VALUES
(101, 'John',  'A', NULL),
(102, 'Dan',   'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy',   'A', 101),
(105, 'Anne',  'A', 101),
(106, 'Ron',   'B', 101);

-- Step 3: Query to find managers with at least five direct reports
WITH nos AS (
    SELECT 
        managerId,
        COUNT(managerId) AS pappu
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)

SELECT 
    e.name AS manager_name,
    t.pappu AS direct_reports
FROM Employee e
JOIN nos t ON e.id = t.managerId;
