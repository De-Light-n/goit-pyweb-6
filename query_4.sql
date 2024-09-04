--Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(g.grade)) as avarage_grade, COUNT(g.grade) grade_count
FROM grades g 
ORDER BY avarage_grade DESC;