--Знайти студента із найвищим середнім балом з певного предмета.
SELECT s.student_id, s.name, ROUND(AVG(g.grade)) as avarage_grade, g.subject_id
FROM students s JOIN grades g ON s.student_id == g.student_id 
WHERE g.subject_id = 1 -- предмет
GROUP BY s.student_id 
ORDER BY avarage_grade DESC LIMIT 1;