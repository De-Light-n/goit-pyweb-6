--Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT ROUND(AVG(g.grade)) avarage, s.*, t.name FROM grades g 
JOIN subjects s ON g.subject_id == s.subject_id 
JOIN teachers t ON s.teacher_id == t.teacher_id 
where t.teacher_id == 4
GROUP BY s.subject_id;