CREATE TABLE Signups (
    user_id INT PRIMARY KEY,
    time_stamp TIMESTAMP
);
CREATE TABLE Confirmations (
    user_id INT,
    time_stamp TIMESTAMP,
    action VARCHAR(10) CHECK (action IN ('confirmed', 'timeout')),
    PRIMARY KEY (user_id, time_stamp),
    FOREIGN KEY (user_id) REFERENCES Signups(user_id)
);
-- Insert into Signups
INSERT INTO Signups (user_id, time_stamp) VALUES
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

-- Insert into Confirmations
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');

select * from signups;
select * from confirmations;
-- Calculate the confirmation rate for each user based 
-- on their signup and confirmation activity.

SELECT  s.user_id,
    ROUND(
        COALESCE(
            SUM(CASE 
                    WHEN c.action = 'confirmed' THEN 1 
                    ELSE 0 
                END) * 1.0 
            / NULLIF(COUNT(c.user_id), 0),
        0),
    2) AS confirmed_rate
FROM  signups s
LEFT JOIN  confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

