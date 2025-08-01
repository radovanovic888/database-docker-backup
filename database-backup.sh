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
TIMESTAMP=$("date +%Y-%m-%d-%H-%M-%S")

# Backup filename
BACKUP_FILE="$BACKUP_DIR/backup-database-$TIMESTAMP.sql"

# Perform backup using mysqldump
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"
