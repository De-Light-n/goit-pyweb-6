--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT s.student_id, s.name, ROUND(AVG(g.grade)) as avarage_grade
FROM students s JOIN grades g ON s.student_id == g.student_id 
GROUP BY s.student_id 
ORDER BY avarage_grade DESC LIMIT 1;

