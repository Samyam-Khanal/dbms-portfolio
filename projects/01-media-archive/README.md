# Personal film & media archive

Track titles, many-to-many genres, and repeat watches. The starter treats a series as one title; episodes, streaming providers, and multiple users are future extensions.

Run the root setup once, then execute `sql/03-queries.sql` through psql. Run `sql/04-tests.sql` against the untouched fixture or use the root test runner. Paths passed with `-f` are relative to your shell directory.

The fixture contains two invented titles, one watch, and one unwatched title. Ratings are optional integers from 1 to 5. Deleting referenced titles is rejected by the foreign keys. Start with the [ERD](docs/erd.md) and complete the [design notes](docs/design.md).
