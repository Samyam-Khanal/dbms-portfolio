BEGIN;
DO $$
BEGIN
    IF (SELECT count(*) FROM media.title) <> 2 THEN
        RAISE EXCEPTION 'Expected two fixture titles';
    END IF;
    IF (SELECT count(*) FROM media.title t WHERE NOT EXISTS
       (SELECT 1 FROM media.watch_log w WHERE w.title_id = t.id)) <> 1 THEN
        RAISE EXCEPTION 'Expected one unwatched title';
    END IF;
    BEGIN
        INSERT INTO media.watch_log(title_id, watched_on, rating)
        SELECT id, CURRENT_DATE, 6 FROM media.title LIMIT 1;
        RAISE EXCEPTION 'Invalid rating accepted';
    EXCEPTION WHEN check_violation THEN NULL;
    END;
    BEGIN
        INSERT INTO media.watch_log(title_id, watched_on) VALUES (-1, CURRENT_DATE);
        RAISE EXCEPTION 'Missing title accepted';
    EXCEPTION WHEN foreign_key_violation THEN NULL;
    END;
END $$;
ROLLBACK;
