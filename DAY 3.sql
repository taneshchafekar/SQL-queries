CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(50)
);

INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(6, 'Alex'),
(13, 'John');

CREATE TABLE Subjects (
  subject_name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

CREATE TABLE Examinations (
  student_id INT,
  subject_name VARCHAR(50)
);

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');


SELECT S.student_id,S.student_name, E.subject_name,COUNT(E.subject_name) 
FROM students S
CROSS JOIN subjects SB
LEFT JOIN examinations E ON S.student_id =E.student_id 
AND SB.subject_name =E.subject_name
GROUP BY S.student_id , E.subject_name
ORDER BY S.student_id, E.subject_name;

