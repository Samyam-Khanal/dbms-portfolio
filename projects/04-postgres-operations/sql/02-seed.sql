INSERT INTO ops.event(occurred_at, category, details)
SELECT TIMESTAMPTZ '2026-10-01 00:00:00+00' + n * INTERVAL '1 minute',
       CASE WHEN n % 100 = 0 THEN 'error' ELSE 'info' END,
       jsonb_build_object('sequence', n)
FROM generate_series(1, 1000) AS s(n);
