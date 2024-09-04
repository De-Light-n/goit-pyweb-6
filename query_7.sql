--Знайти оцінки студентів у окремій групі з певного предмета.
WITH SubjGrade AS (SELECT g.*, s.name subject_name FROM grades g
JOIN subjects s ON s.subject_id == g.subject_id 
where s.subject_id == 4)
SELECT * FROM students s 
JOIN SubjGrade grade ON s.student_id = grade.student_id
WHERE s.group_id == 1;