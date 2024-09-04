--Список курсів, які певному студенту читає певний викладач.
SELECT DISTINCT s2.name, s.student_id , s.name st_name, t.teacher_id, t.name t_name FROM students s 
JOIN grades g ON s.student_id == g.student_id 
JOIN subjects s2 ON g.subject_id == s2.subject_id 
JOIN teachers t ON s2.teacher_id == t.teacher_id 
WHERE s.student_id == 2 
AND t.teacher_id == 4;