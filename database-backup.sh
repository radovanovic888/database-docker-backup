#!/bin/bash

# MariaDB/MySQL backup script for GNU/Linux Debian 12
# Creates backup in format: backup-database-YYYY-MM-DD-HH-MM-SS

# Configuration
DB_USER="your_username"         # MariaDB/MySQL username
DB_PASS="your_password"         # MariaDB/MySQL password
DB_NAME="your_database"         # Database name to backup
BACKUP_DIR="/path/to/backups"   # Directory to store backups

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

# Backup filename
BACKUP_FILE="$BACKUP_DIR/backup-database-$TIMESTAMP.sql"

# Perform backup using mysqldump
echo "Backing up database $DB_NAME to $BACKUP_FILE..."
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"

# Check if backup succeeded
if [ $? -eq 0 ]; then
     echo "Backup completed successfully."
     # Optional: compress the backup
     gzip "$BACKUP_FILE"
     echo "Backup compressed to $BACKUP_FILE.gz"
else
     echo "Backup failed!"
     exit 1
fi
