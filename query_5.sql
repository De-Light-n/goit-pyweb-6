--Знайти які курси читає певний викладач.
SELECT t.teacher_id ,t.name, s.subject_id, s.name FROM teachers t 
join subjects s ON s.teacher_id == t.teacher_id 
where t.teacher_id == 5; -- за ід викладача