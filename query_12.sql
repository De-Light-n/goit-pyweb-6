--Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT g.*, s.group_id FROM grades g
JOIN students s ON g.student_id = s.student_id
JOIN subjects s2 ON g.subject_id = s2.subject_id
WHERE s.group_id = 1
AND s2.subject_id = 4
AND g.created_at = (
    SELECT MAX(g2.created_at) FROM grades g2
    WHERE g2.student_id = g.student_id
    AND g2.subject_id = s2.subject_id
);
