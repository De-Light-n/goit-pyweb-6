--Знайти список курсів, які відвідує студент.
SELECT DISTINCT s2.name, s.student_id , s.name FROM students s 
JOIN grades g ON s.student_id == g.student_id 
JOIN subjects s2 ON g.subject_id == s2.subject_id 
WHERE s.student_id == 2;