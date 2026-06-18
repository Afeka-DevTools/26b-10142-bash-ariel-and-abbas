#!/bin/bash
# Displays important environment variables
for var in USER HOME SHELL PATH PWD LANG HOSTNAME; do
    echo "$var=${!var}"
done