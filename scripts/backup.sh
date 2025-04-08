#!/bin/bash
set -e

echo "Starting database backup..."
export PGPASSWORD="${DB_PASS}"

# Create a database dump
pg_dump -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" > backup.sql

# Verify the backup file exists
if [ -f backup.sql ]; then
    echo "Backup successful! Saved as backup.sql"
    ls -lah backup.sql
else
    echo "Backup failed: File not found!"
    exit 1
fi

# Testing the workflow
