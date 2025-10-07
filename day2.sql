-- Step 1: Create the table
CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type VARCHAR(10),  -- PostgreSQL doesn't support ENUM by default
    timestamp FLOAT,
    PRIMARY KEY (machine_id, process_id, activity_type)
);

-- Step 2: Insert sample data
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end',   1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end',   4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end',   1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end',   1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end',   4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end',   5.000);



select * from Activity;



select machine_id ,
	   round(avg(timestamp - start_time )::numeric,3) as processing_time
from (select machine_id , timestamp,activity_type,
	  lag(timestamp) over(partition by machine_id,process_id order by timestamp)
	  as start_time
	from activity
	) as activity_tab
where activity_type = 'end'
group by machine_id;


SELECT s.machine_id,
   	   ROUND(AVG(e.timestamp - s.timestamp)::numeric, 3) 
	   AS processing_time
FROM Activity s
JOIN Activity e
ON  s.machine_id = e.machine_id AND
    s.process_id = e.process_id
WHERE s.activity_type = 'start' AND
      e.activity_type = 'end'
GROUP BY  s.machine_id;
