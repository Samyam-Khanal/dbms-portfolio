# Starter validation — 15 October 2026

## Environment

- PostgreSQL server and client tools: 18.6, x86_64 Windows.
- Isolated, disposable local cluster; separate working and restore databases.
- Repository documentation targets PostgreSQL 17. No PostgreSQL 17 server was available for this run; compatibility with 17 is not runtime-verified.

## Executed checks

| Check | Actual result |
| --- | --- |
| Setup into an empty database | Completed; all four schemas and seed data committed |
| Root test runner | All four suites completed without error |
| Four sample-query files | All completed without error |
| Media watchlist | City of Lanterns; one unwatched title |
| Enrollment report | One student enrolled; 29 remaining seats |
| Seeded inventory order | Total 300.00; notebook stock 18 |
| Operations fixture | 1,000 events; 10 error and 990 info |
| Custom-format pg_dump | Completed with no ownership/ACL restoration requirement |
| Restore into new template0 database | Completed atomically without error |
| Tests against restored database | All four suites completed without error |
| ANALYZE after restore | Completed |
| Temporary server shutdown | Completed |

The category query used an index scan in this small local run. This is not a performance benchmark. Exact timings are not used as portfolio performance claims.

Not executed: PostgreSQL 17 runtime checks, two-session concurrency testing, production permissions, WAL/PITR recovery, automated CI, or the later roadmap extensions. Learning-day checkboxes remain unchecked; scaffold verification does not mean the learner has completed those sessions.

Tests and rolled-back queries can consume identity sequence values even when data changes roll back. Gaps in IDs are normal; the tests do not require contiguous IDs.
