#!/bin/bash
# check_internet.sh - Checks internet connectivity and prints a log to the screen.
# Usage: ./check_internet.sh

set -uo pipefail

# Host to test against (Google public DNS - reliable and fast)
TARGET_HOST="8.8.8.8"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

# Prefer ping; fall back to curl if ping is unavailable
if command -v ping >/dev/null 2>&1; then
    # -c 1 : one packet, -W 3 : 3 second timeout (Linux). Works on most systems.
    if ping -c 1 -W 3 "$TARGET_HOST" >/dev/null 2>&1; then
        echo "[$TIMESTAMP] [OK] Internet connection is UP (reached $TARGET_HOST)."
        exit 0
    else
        echo "[$TIMESTAMP] [FAIL] Internet connection is DOWN (could not reach $TARGET_HOST)."
        exit 1
    fi
elif command -v curl >/dev/null 2>&1; then
    if curl -s --max-time 5 https://www.google.com >/dev/null 2>&1; then
        echo "[$TIMESTAMP] [OK] Internet connection is UP (curl reached google.com)."
        exit 0
    else
        echo "[$TIMESTAMP] [FAIL] Internet connection is DOWN (curl failed)."
        exit 1
    fi
else
    echo "[$TIMESTAMP] [ERROR] Neither 'ping' nor 'curl' is installed. Cannot check connectivity."
    exit 2
fi
