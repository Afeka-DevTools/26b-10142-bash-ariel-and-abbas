#!/bin/bash
# Shows disk usage of each subdirectory in a given directory (default: current)
dir="${1:-.}"
du -h --max-depth=1 "$dir" | sort -h