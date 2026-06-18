#!/bin/bash
# random_password.sh - Generates a random 10-character password containing at least
# one uppercase letter, one lowercase letter, one digit, and one special character.
# Usage: ./random_password.sh

set -uo pipefail

LENGTH=10

UPPER='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
LOWER='abcdefghijklmnopqrstuvwxyz'
DIGITS='0123456789'
SPECIAL='!@#$%^&*()-_=+'
ALL="$UPPER$LOWER$DIGITS$SPECIAL"

# Pick one random character from the string passed as $1
pick_one() {
    local set="$1"
    local idx=$(( RANDOM % ${#set} ))
    printf '%s' "${set:$idx:1}"
}

# Guarantee one of each required category
password="$(pick_one "$UPPER")$(pick_one "$LOWER")$(pick_one "$DIGITS")$(pick_one "$SPECIAL")"

# Fill the rest from the full character set
for (( i = ${#password}; i < LENGTH; i++ )); do
    password+="$(pick_one "$ALL")"
done

# Shuffle the characters so the guaranteed ones aren't always at the front
shuffled="$(printf '%s' "$password" | fold -w1 | shuf | tr -d '\n')"

echo "$shuffled"
