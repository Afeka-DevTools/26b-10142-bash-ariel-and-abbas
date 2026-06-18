#!/bin/bash
# backup_dir.sh - Backs up the contents of a given directory into a tar.gz file.
# Usage: ./backup_dir.sh <directory_to_backup> [output_directory]

set -euo pipefail

# Check for required command: tar
if ! command -v tar >/dev/null 2>&1; then
    echo "Error: 'tar' is not installed. Please install it (e.g. sudo apt-get install tar) and try again."
    exit 1
fi

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <directory_to_backup> [output_directory]"
    exit 1
fi

SOURCE_DIR="$1"
OUTPUT_DIR="${2:-.}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: '$SOURCE_DIR' is not a directory or does not exist."
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Build a timestamped archive name from the source directory's base name
BASE_NAME="$(basename "$SOURCE_DIR")"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
ARCHIVE="$OUTPUT_DIR/${BASE_NAME}_backup_${TIMESTAMP}.tar.gz"

# -C changes into the parent dir so the archive stores relative paths
tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$BASE_NAME"

echo "Backup created: $ARCHIVE"
