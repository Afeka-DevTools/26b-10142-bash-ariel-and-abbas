#!/bin/bash
# weather.sh - Fetches the current weather for a specific city and displays it.
# Uses the wttr.in service. Usage: ./weather.sh <city>

set -uo pipefail

# Ensure curl is available; if not, try to install it, otherwise inform the user.
if ! command -v curl >/dev/null 2>&1; then
    echo "'curl' is not installed. Attempting to install it..."
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y curl
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y curl
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y curl
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm curl
    elif command -v brew >/dev/null 2>&1; then
        brew install curl
    else
        echo "Error: could not detect a package manager. Please install 'curl' manually and rerun."
        exit 1
    fi
fi

# Re-check after attempted install
if ! command -v curl >/dev/null 2>&1; then
    echo "Error: 'curl' is still not available. Cannot fetch weather."
    exit 1
fi

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <city>"
    exit 1
fi

# Join all arguments so multi-word cities (e.g. "New York") work, and URL-encode spaces.
CITY="$*"
CITY_ENCODED="${CITY// /%20}"

echo "Fetching current weather for '$CITY'..."

# format=3 gives a short one-line summary; remove it for full report.
if ! curl -s --max-time 15 "https://wttr.in/${CITY_ENCODED}?format=3"; then
    echo "Error: failed to fetch weather. Check your internet connection or the city name."
    exit 1
fi
