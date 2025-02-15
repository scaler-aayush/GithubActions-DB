#!/bin/bash
set -e

echo "Applying database migrations..."
export PGPASSWORD="${DB_PASS}"

# Example: Create a new table
psql -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" <<EOF
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
EOF

echo "Migrations applied successfully!"
