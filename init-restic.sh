#!/bin/bash

# Load environment variables
if [[ -z "$RESTIC_HOME_DIR" ]]; then
    echo "ERROR: RESTIC_HOME_DIR is not set. Please define it in /etc/restic.env."
    exit 1
fi

# Load environment variables from the .env file
set -a && source $RESTIC_HOME_DIR/restic.env && set +a

# Check if the repository is already initialized
if sudo -E restic snapshots > /dev/null 2>&1; then
    echo "Restic repository already initialized."
else
    echo "Initializing Restic repository..."
    sudo -E restic init --repo "$RESTIC_REPOSITORY"

    if [ $? -eq 0 ]; then
        echo "Restic repository initialized successfully!"
    else
        echo "Failed to initialize Restic repository."
        exit 1
    fi
fi
