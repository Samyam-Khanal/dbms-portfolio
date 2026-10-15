# PostgreSQL operations lab

Inspect 1,000 synthetic events, including 10 error events, and an index on category. Run `sql/03-queries.sql` for query plans and database statistics. A small fixture may use a sequential scan even with an index; the planner's choice is an observation, not a failed test.

Use a separate lab database for larger data and role experiments. Do not run write queries under EXPLAIN ANALYZE without understanding that it executes them. Run VACUUM outside an explicit transaction. Do not terminate other users' sessions.

Complete the [backup rehearsal](../../docs/backup-restore.md), record actual timings, and document a least-privilege read role as an extension. Cluster roles, WAL archiving, monitoring alerts, and automatic failover are not set up by this starter.

See [ERD](docs/erd.md) and [design notes](docs/design.md).
