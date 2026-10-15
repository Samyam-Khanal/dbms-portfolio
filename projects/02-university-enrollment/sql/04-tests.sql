BEGIN;
DO $$
BEGIN
    IF (SELECT count(*) FROM university.enrollment) <> 1 THEN
        RAISE EXCEPTION 'Expected one enrollment';
    END IF;
    BEGIN
        INSERT INTO university.enrollment(student_id, offering_id)
        SELECT student_id, offering_id FROM university.enrollment LIMIT 1;
        RAISE EXCEPTION 'Duplicate enrollment accepted';
    EXCEPTION WHEN unique_violation THEN NULL;
    END;
    BEGIN
        UPDATE university.enrollment SET grade = 101;
        RAISE EXCEPTION 'Invalid grade accepted';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
END $$;
ROLLBACK;
