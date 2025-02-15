#!/bin/bash
set -e  # Exit script on error

export PGPASSWORD="${DB_PASS}"

echo "🔹 Connecting to PostgreSQL and ensuring 'users' table exists..."

psql -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" <<EOF
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);
EOF

echo "✅ 'users' table is ready!"

echo "🔹 Inserting test data into 'users' table..."

psql -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" <<EOF
INSERT INTO users (name) VALUES 
    ('Alice'), 
    ('Bob'), 
    ('Charlie')
ON CONFLICT DO NOTHING;
EOF

echo "✅ Data inserted successfully!"
