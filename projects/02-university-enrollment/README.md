# University enrollment system

Model students, courses, term-specific offerings, and enrollments. A composite enrollment key rejects duplicate registration in the same offering. Grades are optional percentages from 0 to 100.

The starter has two fictional students, one course offering, and one enrollment. Seat capacity is recorded but **not enforced yet**. Prerequisites, timetable conflicts, withdrawals, and grading policy are exercises. Enforce capacity through a transaction that locks the offering row before counting and inserting; test simultaneous requests using two sessions.

Run root setup and tests as described in the main README. See [ERD](docs/erd.md) and [design notes](docs/design.md).
