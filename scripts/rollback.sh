#!/bin/bash
set -e

echo "Rolling back to last backup..."
export PGPASSWORD="${DB_PASS}"
psql -h localhost -U "${DB_USER}" -d "${DB_NAME}" < backup.sql

echo "Rollback completed!"
