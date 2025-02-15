#!/bin/bash
set -e

echo "Taking database backup..."
export PGPASSWORD="${DB_PASS}"
pg_dump -h localhost -U "${DB_USER}" -d "${DB_NAME}" > backup.sql

echo "Backup completed successfully!"
