# Enrollment design notes

## Starter decisions

A course is a reusable catalog entry; an offering identifies its term and section. Enrollment joins a student to that offering. Student numbers are stable identifiers; names need not be unique. NULL grades mean ungraded, not zero. Foreign keys reject deletion while dependent records exist.

## Complete during learning

- Users and reports:
- Data dictionary:
- Functional dependencies and normalization reasoning:
- Capacity, prerequisite, withdrawal, and grading rules:
- Transaction and locking design for the last available seat:
- Tests, including two-session evidence:
- Limitations and next migration:

Use [the case study template](../../../docs/project-template.md) for the final write-up.
