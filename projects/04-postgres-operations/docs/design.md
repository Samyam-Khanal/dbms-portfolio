# Operations notebook

## Starter decisions

The small event fixture is deterministic. Error events occur every hundredth row. Category is indexed, but no particular query-plan shape or speedup is guaranteed. JSONB keeps auxiliary event details flexible; required searchable fields remain typed columns.

## Complete during learning

- PostgreSQL/client versions and machine context:
- Dataset size and query:
- Actual plans before/after an index change:
- Maintenance observations:
- Role matrix and allowed/denied access evidence:
- Backup path, size, duration, and restore verification:
- Recovery targets versus actual measured recovery:
- Incident symptoms, diagnosis, action, and outcome:
- Limitations and next experiment:

Use [the case study template](../../../docs/project-template.md) for the final write-up.
