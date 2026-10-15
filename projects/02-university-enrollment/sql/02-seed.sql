INSERT INTO university.student(student_number, full_name) VALUES
('DEMO-001', 'Demo Student A'), ('DEMO-002', 'Demo Student B');
INSERT INTO university.course VALUES ('DB101', 'Relational Databases', 3);
INSERT INTO university.offering(course_code, term, section, capacity)
VALUES ('DB101', '2026-Autumn', 'A', 30);
INSERT INTO university.enrollment(student_id, offering_id, enrolled_on)
SELECT s.id, o.id, DATE '2026-10-01' FROM university.student s
CROSS JOIN university.offering o WHERE s.student_number = 'DEMO-001';
