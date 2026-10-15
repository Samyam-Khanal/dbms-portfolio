# DBMS Portfolio

Four PostgreSQL projects, built over 50 learning days: from relational modeling and useful queries to transactions, performance, and recovery.

This is a learning portfolio in progress. The supplied SQL is a starting point; completed projects, benchmark results, and recovery evidence will be recorded as the work is done. All sample records are fictional.

| Project | Question it answers | Skills |
| --- | --- | --- |
| [Film & media archive](projects/01-media-archive) | What have I watched, and what should I watch next? | Relationships, joins, grouping, views |
| [University enrollment](projects/02-university-enrollment) | Who is enrolled in each course offering? | Composite keys, constraints, enrollment rules |
| [Inventory & orders](projects/03-inventory-orders) | Can an order be fulfilled without overselling? | Money, transactions, locking, reporting |
| [PostgreSQL operations](projects/04-postgres-operations) | Can I inspect, tune, and recover a database? | Indexes, query plans, maintenance, backups |

## Start here

Install PostgreSQL 17 with its command-line tools (`psql`, `createdb`, `pg_dump`, `pg_restore`). This repository deliberately targets version 17 rather than depending on whichever release is newest. Run commands from the repository root. Examples work in PowerShell and standard shells.

Create a **new, disposable** database using your local PostgreSQL account:

```sh
createdb -h localhost -U postgres dbms_portfolio
psql -X -h localhost -U postgres -d dbms_portfolio -v ON_ERROR_STOP=1 -f scripts/setup.sql
psql -X -h localhost -U postgres -d dbms_portfolio -v ON_ERROR_STOP=1 -f scripts/test.sql
```

Enter your locally configured password when prompted; none is supplied here. Change `postgres` if your local account has a different name. Use a password file outside the repository if repeated prompts become inconvenient. Never place credentials in committed commands, URLs, screenshots, or SQL.

Setup is atomic and intentionally **fails on an existing schema**. It does not erase previous work. For another clean run, create a differently named empty database and use it in the commands. Do not run these scripts against a production or shared database.

Try a query:

```sh
psql -X -h localhost -U postgres -d dbms_portfolio -v ON_ERROR_STOP=1 -f projects/01-media-archive/sql/03-queries.sql
```

## How to use this portfolio

Follow [the 50-day roadmap](ROADMAP.md). A day is a learning session, not a fixed date: missed sessions do not reset progress. Keep the checkboxes honest and use the [learning log](docs/learning-log.md) to record evidence. Aim for 45–90 minutes; on a low-energy day, write one useful query or document one decision.

Each project contains `sql/01-schema.sql`, `02-seed.sql`, `03-queries.sql`, and `04-tests.sql`, plus `docs/erd.md` and `docs/design.md`. Run setup once, then run queries and tests as often as needed. Tests use transactions and roll back their changes.

See [testing](docs/testing.md), [backup & restore](docs/backup-restore.md), and [project documentation template](docs/project-template.md). Extend schemas with numbered migrations; record how to upgrade an existing database instead of silently editing a schema that has already been applied.

## Portfolio completion standard

- Explain the problem, scope, assumptions, and business rules.
- Keep the ERD and data dictionary consistent with the actual schema.
- Demonstrate joins, aggregation, a transaction, and failure cases.
- Record real test output and actual query-plan observations.
- Restore a backup into a separate database and verify it.
- Write a short case study: what changed, why, and what you would improve.

See [starter validation](docs/validation.md) for actual checks performed and their limits. No application API, production access model, or point-in-time recovery setup is included yet.

## References

- [PostgreSQL 17 tutorial](https://www.postgresql.org/docs/17/tutorial.html)
- [psql reference](https://www.postgresql.org/docs/17/app-psql.html)
- [Constraints](https://www.postgresql.org/docs/17/ddl-constraints.html)
- [Explicit locking](https://www.postgresql.org/docs/17/explicit-locking.html)
- [EXPLAIN](https://www.postgresql.org/docs/17/using-explain.html)
- [Logical backups](https://www.postgresql.org/docs/17/backup-dump.html)
