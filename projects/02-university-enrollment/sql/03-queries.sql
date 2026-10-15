SELECT c.code, c.title, o.term, o.section, count(e.student_id) AS enrolled,
       o.capacity - count(e.student_id) AS remaining_seats
FROM university.offering o JOIN university.course c ON c.code = o.course_code
LEFT JOIN university.enrollment e ON e.offering_id = o.id
GROUP BY c.code, c.title, o.id ORDER BY c.code, o.term, o.section;
SELECT s.student_number, s.full_name, c.code, c.title, e.grade
FROM university.enrollment e
JOIN university.student s ON s.id = e.student_id
JOIN university.offering o ON o.id = e.offering_id
JOIN university.course c ON c.code = o.course_code
ORDER BY s.student_number, c.code;
