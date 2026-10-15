CREATE SCHEMA university;
CREATE TABLE university.student (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_number text NOT NULL UNIQUE,
    full_name text NOT NULL
);
CREATE TABLE university.course (
    code text PRIMARY KEY,
    title text NOT NULL,
    credits integer NOT NULL CHECK (credits BETWEEN 1 AND 6)
);
CREATE TABLE university.offering (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code text NOT NULL REFERENCES university.course(code),
    term text NOT NULL,
    section text NOT NULL,
    capacity integer NOT NULL CHECK (capacity > 0),
    UNIQUE (course_code, term, section)
);
CREATE TABLE university.enrollment (
    student_id bigint REFERENCES university.student(id),
    offering_id bigint REFERENCES university.offering(id),
    enrolled_on date NOT NULL DEFAULT CURRENT_DATE,
    grade numeric(5,2) CHECK (grade BETWEEN 0 AND 100),
    PRIMARY KEY (student_id, offering_id)
);
CREATE INDEX enrollment_offering_idx ON university.enrollment(offering_id);
-- Capacity, prerequisites, and timetable conflicts are extension exercises.
-- Capacity is metadata here: this starter does NOT enforce seat limits.
