# Media design notes

## Starter decisions

Titles and genres use a junction table because either can relate to many of the other. A separate watch log preserves repeat watches and makes an unwatched title possible without a placeholder event. Title identity uses name, release year, and kind; this is a simplified deduplication rule, not a universal media identifier.

## Complete during learning

- Users and questions:
- Data dictionary (column, type, nullability, constraint, meaning):
- Normalization reasoning:
- Decisions about series episodes and repeat watches:
- Queries and actual outputs:
- Tests and evidence:
- Limitations and next migration:

Use [the case study template](../../../docs/project-template.md) for the final write-up.
