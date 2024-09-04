--Знайти середній бал у групах з певного предмета.
SELECT gr.group_name , ROUND(AVG(g.grade)) as avarage_grade, COUNT(g.grade) grade_count, g.subject_id
FROM students s JOIN grades g ON s.student_id == g.student_id 
JOIN groups gr ON s.group_id == gr.group_id 
WHERE g.subject_id = 1 -- предмет
GROUP BY s.group_id 
ORDER BY avarage_grade DESC LIMIT 1;