#!/bin/bash
# Sorts lines of a file alphabetically
if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi
if [ ! -f "$1" ]; then
    echo "Error: file '$1' not found"
    exit 1
fi
sort "$1"s