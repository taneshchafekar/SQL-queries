CREATE TABLE RequestAccepted (
    requester_id INT,
    accepter_id INT,
    accept_date DATE,
    PRIMARY KEY (requester_id, accepter_id)
);

INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES
(1, 2, '2024-01-05'),
(1, 3, '2024-01-06'),
(2, 3, '2024-01-07'),
(3, 4, '2024-01-08'),
(4, 5, '2024-01-09'),
(2, 5, '2024-01-10');

/*Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.*/
with tab as(
SELECT requester_id AS id, accepter_id AS friend_id
FROM RequestAccepted
    UNION
SELECT accepter_id AS id, requester_id AS friend_id
FROM RequestAccepted
)

select id,count(friend_id) as num 
from tab
group by id
order by num  desc
limit 1



SELECT id, COUNT(friend_id) AS num
FROM (
    SELECT requester_id AS id, accepter_id AS friend_id
    FROM RequestAccepted
    UNION
    SELECT accepter_id AS id, requester_id AS friend_id
    FROM RequestAccepted
) AS all_friends
GROUP BY id
ORDER BY num DESC;