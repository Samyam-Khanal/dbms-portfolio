# Backup and restore rehearsal

Use PostgreSQL 17 client tools for this PostgreSQL 17 lab. Run from the repo root. Custom-format dumps use `pg_restore`; plain SQL dumps use `psql`. Use `-f` rather than shell redirection for portable binary output.

```sh
pg_dump -h localhost -U postgres -d dbms_portfolio -Fc --no-owner --no-acl -f portfolio.dump
createdb -h localhost -U postgres -T template0 dbms_portfolio_restore
pg_restore -h localhost -U postgres -d dbms_portfolio_restore --exit-on-error --single-transaction --no-owner --no-acl portfolio.dump
psql -X -h localhost -U postgres -d dbms_portfolio_restore -v ON_ERROR_STOP=1 -f scripts/test.sql
psql -X -h localhost -U postgres -d dbms_portfolio_restore -v ON_ERROR_STOP=1 -c "ANALYZE;"
```

The restore database must be new and empty. Do not restore over your working database. The dump is ignored by Git. Keep it in protected storage if it later contains real data. Do not commit dumps just because a repository is private.

These commands deliberately omit ownership and privileges. `pg_dump` covers one database, not cluster roles or tablespaces. A production recovery plan must also address roles, permissions, encryption, off-site storage, retention, and recovery targets. Logical dumps do not provide point-in-time recovery; study WAL archiving separately.

Before the dump, record table counts and a few ordered query results. After restore, compare those values, constraints, indexes, and query results as well as running tests. Record backup start/end, restore start/end, dump size, tool versions, outcome, and any errors. Do not treat file creation alone as proof of recoverability.

Reference: [PostgreSQL logical backup documentation](https://www.postgresql.org/docs/17/backup-dump.html).
