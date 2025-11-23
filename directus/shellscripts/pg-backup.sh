#!/bin/bash

# === CONFIG ===
CONTAINER_NAME="directus-db"   # Name of your Postgres Docker container
DB_USER="postgres"            # Or 'directus' if you use that
DB_NAME="directus"            # Your database name
OUTPUT_DIR="./backups"        # Where to store dumps
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create output directory if missing
mkdir -p "${OUTPUT_DIR}"

# === BACKUP COMMAND ===
echo "Starting PostgreSQL backup of directus..."

docker exec -t "$CONTAINER_NAME" \
  pg_dump -U "$DB_USER" "$DB_NAME" \
  > "${OUTPUT_DIR}/db_backup_${TIMESTAMP}.sql"

echo "Backup complete: ${OUTPUT_DIR}/db_backup_${TIMESTAMP}.sql"

