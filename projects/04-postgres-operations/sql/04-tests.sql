BEGIN;
DO $$
BEGIN
    IF (SELECT count(*) FROM ops.event) <> 1000 THEN
        RAISE EXCEPTION 'Expected 1000 synthetic events';
    END IF;
    IF (SELECT count(*) FROM ops.event WHERE category = 'error') <> 10 THEN
        RAISE EXCEPTION 'Expected 10 error events';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes
        WHERE schemaname = 'ops' AND indexname = 'event_category_idx') THEN
        RAISE EXCEPTION 'Missing category index';
    END IF;
END $$;
ROLLBACK;
