#!/bin/bash
# Script to archive the entire repository except the .git directory.

# Determine the output archive name with timestamp
TIMESTAMP=$(date +%Y%m%d%H%M%S)
ARCHIVE_NAME="archive_$TIMESTAMP.tar.gz"
ARCHIVE_TEMP=$(mktemp -u)

# Create the archive in a temporary location to avoid interfering with the tar process

tar --exclude="./.git" -czf "$ARCHIVE_TEMP" .

# Move the archive to the repository root with the final name
mv "$ARCHIVE_TEMP" "$ARCHIVE_NAME"

# Print the location of the archive
printf "Archive created: %s\n" "$ARCHIVE_NAME"
