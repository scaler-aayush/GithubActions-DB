#!/bin/bash
set -e

echo "Running migrations..."
export PGPASSWORD="${DB_PASS}"

psql -h localhost -U "${DB_USER}" -d "${DB_NAME}" -c "
    CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL
    );
"

echo "Migration completed successfully!"
