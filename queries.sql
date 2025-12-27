-- It Shows each student with their marks in every subject
SELECT s.Name AS Student_Name,
       sub.SubjectName AS Subject,
       m.Marks AS Marks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID        -- connect student with their marks
JOIN Subjects sub ON m.SubjectID = sub.SubjectID -- get subject name for each mark
ORDER BY s.StudentID, sub.SubjectID;             -- keep data neat and ordered


-- Find total marks scored by each student
SELECT s.Name AS Student_Name,
       SUM(m.Marks) AS Total_Marks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.StudentID;                            -- one total per student


-- Calculate average marks of every student
SELECT s.Name AS Student_Name,
       ROUND(AVG(m.Marks), 2) AS Average_Marks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.StudentID;


-- Show students whose total marks are above the limit
SELECT s.Name AS Student_Name,
       SUM(m.Marks) AS Total_Marks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.StudentID
HAVING SUM(m.Marks) > 450;                       -- filter by total marks


-- Get the highest mark scored in each subject
SELECT sub.SubjectName AS Subject,
       MAX(m.Marks) AS Highest_Marks
FROM Marks m
JOIN Subjects sub ON m.SubjectID = sub.SubjectID
GROUP BY sub.SubjectID;


-- Temporary result to store total and average marks of students
WITH StudentTotals AS (
    SELECT s.StudentID,
           s.Name,
           SUM(m.Marks) AS Total_Marks,
           ROUND(AVG(m.Marks), 2) AS Average_Marks
    FROM Students s
    JOIN Marks m ON s.StudentID = m.StudentID
    GROUP BY s.StudentID
)
SELECT *
FROM StudentTotals
WHERE Average_Marks > 85;                        -- show only good performers


-- Find students who failed in at least one subject
SELECT DISTINCT s.Name AS Student_Name
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
WHERE m.Marks < 40;                              -- marks below pass level
