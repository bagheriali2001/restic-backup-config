#!/bin/bash

# Load environment variables
if [[ -z "$RESTIC_HOME_DIR" ]]; then
    echo "ERROR: RESTIC_HOME_DIR is not set. Please define it in /etc/restic.env."
    exit 1
fi

# Load environment variables from the .env file
export $(grep -v '^#' $RESTIC_HOME_DIR/restic.env | xargs)

# Ensure the required environment variables are set
if [[ -z "$RESTIC_REPOSITORY" || -z "$RESTIC_PASSWORD" || -z "$BACKUP_PATH" || -z "$KEEP_LAST" ]]; then
    echo "Error: Missing required environment variables. Check $RESTIC_HOME_DIR/restic.env"
    exit 1
fi

# Perform backup
echo "Starting backup for $BACKUP_PATH..."
restic backup "$BACKUP_PATH" --verbose

# Prune old backups based on the KEEP_LAST value
echo "Pruning old backups (keeping last $KEEP_LAST snapshots)..."
restic forget --keep-last "$KEEP_LAST" --prune

echo "Backup completed successfully!"