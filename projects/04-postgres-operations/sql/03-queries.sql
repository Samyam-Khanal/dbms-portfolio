-- ANALYZE updates statistics; EXPLAIN ANALYZE executes this read-only SELECT.
ANALYZE ops.event;
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM ops.event WHERE category = 'error';
SELECT category, count(*) FROM ops.event GROUP BY category ORDER BY category;
SELECT schemaname, relname, n_live_tup, n_dead_tup
FROM pg_stat_user_tables WHERE schemaname IN ('media', 'university', 'inventory', 'ops')
ORDER BY schemaname, relname;
SELECT pid, state, wait_event_type, wait_event
FROM pg_stat_activity WHERE datname = current_database();
