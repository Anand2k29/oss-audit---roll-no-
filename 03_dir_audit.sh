#!/bin/bash

# Script Name: 03_dir_audit.sh
# Author: Anand
# Course: Open Source Software
# Description: This script audits Linux directories related to Firefox installation and usage.

# Define an array of key directories to audit
# These represent browser binaries, system-wide policies, and user profiles
FILESYSTEM_TARGETS=(
    "/usr/lib/firefox" 
    "/etc/firefox" 
    "$HOME/.mozilla/firefox" 
    "/usr/bin" 
    "/tmp"
)

echo "===================================================="
echo "          Firefox Directory & Resource Audit"
echo "===================================================="

# Iterate through each directory in the array
for DIR in "${FILESYSTEM_TARGETS[@]}"; do
    # Check if the directory exists using -d flag
    if [ -d "$DIR" ]; then
        # Extract permissions string using ls -ld and awk
        # The first column ($1) of ls -l output contains the permission bitmask
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        
        # Calculate human-readable directory size using du -sh
        # du -sh provides totals for the entire folder structure
        SIZE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
        
        # Format and print the audit results
        echo "[FOUND]    $DIR"
        echo "           Permissions: $PERMS"
        echo "           Total Size:  $SIZE"
    else
        # If directory is missing, notify the auditor
        echo "[MISSING]  $DIR: This location does not exist on this host."
    fi
    echo "----------------------------------------------------"
done

echo "Audit Summary: Directory check complete."
