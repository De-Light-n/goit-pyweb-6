--Знайти список студентів у певній групі.
SELECT s.* FROM groups g 
JOIN students s ON s.group_id = g.group_id
where g.group_id == 2;
