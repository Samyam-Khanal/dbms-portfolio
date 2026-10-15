\set ON_ERROR_STOP on
BEGIN;
\ir ../projects/01-media-archive/sql/01-schema.sql
\ir ../projects/01-media-archive/sql/02-seed.sql
\ir ../projects/02-university-enrollment/sql/01-schema.sql
\ir ../projects/02-university-enrollment/sql/02-seed.sql
\ir ../projects/03-inventory-orders/sql/01-schema.sql
\ir ../projects/03-inventory-orders/sql/02-seed.sql
\ir ../projects/04-postgres-operations/sql/01-schema.sql
\ir ../projects/04-postgres-operations/sql/02-seed.sql
COMMIT;
