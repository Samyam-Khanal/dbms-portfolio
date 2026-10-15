# Testing guide

Run `scripts/test.sql` using the README command. `ON_ERROR_STOP` makes unexpected errors fail the command. Each suite rolls back its mutations and raises an exception when an expected result is wrong. Expected constraint failures are caught inside PL/pgSQL blocks; an uncaught failure means the suite failed.

The seed fixture is part of the tests' contract. Keep fixture changes and expected results together. To test after experimenting with the data, create another empty database and run setup there.

Extend coverage with duplicate keys, missing foreign keys, invalid quantities, NULL boundaries, and expected aggregate totals. Check that a failed multi-step transaction leaves no partial data. Add concurrency tests using two separate psql sessions; one session alone cannot prove isolation behavior.

Record date, PostgreSQL version (`SELECT version();`), commit, database name, command, exit status, and a redacted output excerpt. Do not mark unrun checks as passed. Performance claims need data volume, query, plan, timing, and repeated measurements under stated conditions.
