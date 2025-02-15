#!/bin/bash
set -e

echo "Inserting test data into users table..."
export PGPASSWORD="${DB_PASS}"

# Insert sample data
psql -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" <<EOF
INSERT INTO users (name) VALUES ('Alice');
INSERT INTO users (name) VALUES ('Bob');
INSERT INTO users (name) VALUES ('Charlie');
EOF

echo "Data inserted successfully!"
