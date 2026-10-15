# 50 learning days

Start on any date. Check a day only when its deliverable exists. Catch-up and rest days can move the schedule without resetting completed work. These are portfolio practice goals, not a guarantee of job readiness.

## Days 1–10: SQL foundations and media archive

- [ ] 01 — Install PostgreSQL tools; record version and connect to a disposable database.
- [ ] 02 — Run setup and tests; explain database, schema, table, row, and column.
- [ ] 03 — Read the media ERD; write five business rules and identify keys.
- [ ] 04 — Write SELECT, WHERE, ORDER BY, and LIMIT queries against media titles.
- [ ] 05 — Practice INSERT, UPDATE, DELETE inside a transaction that rolls back.
- [ ] 06 — Explain NULL and test optional ratings with IS NULL and COALESCE.
- [ ] 07 — Join titles, genres, and watch logs; explain repeated rows.
- [ ] 08 — Write GROUP BY / HAVING reports; distinguish count(*) from count(column).
- [ ] 09 — Add a view for watch history and document its columns.
- [ ] 10 — Finish the media case study with a schema diagram, five queries, and test evidence.

## Days 11–22: University enrollment

- [ ] 11 — Define enrollment scope, users, and required reports.
- [ ] 12 — Explain course versus offering and student versus enrollment.
- [ ] 13 — Complete the data dictionary and a normalization example through 3NF.
- [ ] 14 — Write a student schedule query and a roster query.
- [ ] 15 — Find students without enrollments using NOT EXISTS and a LEFT JOIN.
- [ ] 16 — Add a numbered migration for an instructor model and update the ERD.
- [ ] 17 — Add synthetic fixtures and foreign-key failure tests for that migration.
- [ ] 18 — Define seat-limit behavior and implement enrollment with an offering-row lock.
- [ ] 19 — Test duplicate enrollment and full capacity; show no partial writes.
- [ ] 20 — Use two sessions to attempt enrollment in the final seat; record the outcome.
- [ ] 21 — Add a transcript report with term totals; explain how missing grades behave.
- [ ] 22 — Finish the enrollment case study and list remaining prerequisite/timetable rules.

## Days 23–35: Inventory and orders

- [ ] 23 — Define stock, pending order, payment, and cancellation semantics.
- [ ] 24 — Explain numeric prices and why each order line stores its historical price.
- [ ] 25 — Trace place_order step by step; identify its lock and transaction boundary.
- [ ] 26 — Test valid, unknown-SKU, NULL, zero, and excessive-quantity requests.
- [ ] 27 — Rehearse a checkout and rollback; verify stock and order counts.
- [ ] 28 — Run two competing checkouts in separate sessions and record blocking behavior.
- [ ] 29 — Build a multi-item checkout design with consistent product-lock ordering.
- [ ] 30 — Implement multi-item checkout in a migration; test all-or-nothing failure.
- [ ] 31 — Add a stock movement ledger and reconcile opening stock, sales, and adjustments.
- [ ] 32 — Define and implement cancellation restocking with protection against double restocks.
- [ ] 33 — Add low-stock, order-total, and paid-sales reports; exclude cancelled sales.
- [ ] 34 — Add indexes supported by actual query plans and record before/after observations.
- [ ] 35 — Finish the inventory case study, including concurrency evidence and limitations.

## Days 36–45: PostgreSQL operations

- [ ] 36 — Inspect ops.event, pg_stat_user_tables, and pg_stat_activity.
- [ ] 37 — Run EXPLAIN (ANALYZE, BUFFERS); annotate estimated and actual rows.
- [ ] 38 — Generate a larger synthetic fixture in a separate database; record row count.
- [ ] 39 — Compare selective and broad filters; explain why a sequential scan may win.
- [ ] 40 — Study VACUUM and ANALYZE; run each outside an explicit transaction as needed.
- [ ] 41 — Design a least-privilege read-only role; test allowed SELECT and denied writes in the lab.
- [ ] 42 — Make a custom-format logical backup; record version, duration, and size.
- [ ] 43 — Restore into a new database; compare data and run the test suite.
- [ ] 44 — Record observed recovery time and design a retention/recovery plan; study WAL/PITR limits.
- [ ] 45 — Write an operations runbook with symptoms, diagnosis, recovery, and evidence.

## Days 46–50: Portfolio review

- [ ] 46 — Rebuild from a fresh clone and empty database; fix undocumented prerequisites.
- [ ] 47 — Review SQL constraints, parameter handling, credentials, and ignored artifacts.
- [ ] 48 — Finish all ERDs and case studies; remove claims lacking evidence.
- [ ] 49 — Practice explaining one schema choice, one query plan, and one concurrency bug.
- [ ] 50 — Write a retrospective and choose the next project; review visibility before making anything public.
