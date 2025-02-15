#!/bin/bash
set -e

echo "Starting rollback..."
export PGPASSWORD="${DB_PASS}"

# Ensure backup file exists before restoring
if [ ! -f backup.sql ]; then
    echo "Error: No backup file found! Rollback failed."
    exit 1
fi

# Restore the database from the backup
psql -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" < backup.sql

echo "Rollback completed successfully!"
