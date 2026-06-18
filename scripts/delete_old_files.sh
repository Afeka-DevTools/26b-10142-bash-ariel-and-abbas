#!/bin/bash
# delete_old_files.sh - Deletes files older than X days from a specific directory.
# Usage: ./delete_old_files.sh <directory> <days>

set -uo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <days>"
    exit 1
fi

TARGET_DIR="$1"
DAYS="$2"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: '$TARGET_DIR' is not a directory or does not exist."
    exit 1
fi

# Validate that DAYS is a non-negative integer
if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Error: days must be a non-negative integer (got '$DAYS')."
    exit 1
fi

echo "Searching for files older than $DAYS day(s) in '$TARGET_DIR'..."

# List matching files first so the user sees what will be removed
FOUND="$(find "$TARGET_DIR" -type f -mtime +"$DAYS")"

if [ -z "$FOUND" ]; then
    echo "No files older than $DAYS day(s) were found."
    exit 0
fi

echo "The following files will be deleted:"
echo "$FOUND"

# Delete the matching files
find "$TARGET_DIR" -type f -mtime +"$DAYS" -print -delete

echo "Done. Files older than $DAYS day(s) have been deleted from '$TARGET_DIR'."
