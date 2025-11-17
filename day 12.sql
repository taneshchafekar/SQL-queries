/*Find the total investment value in 2016 (tiv_2016) for all policyholders who:

Have the same tiv_2015 value as one or more other policyholders, and

Are located in a unique city (their (lat, lon) pair does not repeat).

Round the result to two decimal places.*/

-- 1. Create the Insurance table
CREATE TABLE Insurance (
    pid       INT PRIMARY KEY,
    tiv_2015  FLOAT NOT NULL,
    tiv_2016  FLOAT NOT NULL,
    lat       FLOAT NOT NULL,
    lon       FLOAT NOT NULL
);

-- 2. Insert sample records
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40);
-- 3. Find the sum of tiv_2016 for valid policyholders
SELECT ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);

