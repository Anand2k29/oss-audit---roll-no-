#!/bin/bash

# Script Name: 04_log_analyzer.sh
# Author: Anand
# Course: Open Source Software
# Description: This script analyzes Firefox logs for specific keywords using a while loop.

# Task: Check if a log file was provided as a command-line argument ($1)
# If not, generate a dummy log for simulation as required by the university rubric
FILE_PATH=$1
KEYWORD=${2:-"SEC_ERROR"} # Default to SEC_ERROR if $2 is not provided

# Pre-execution logic: Generate simulated logs if no file is provided
if [ -z "$FILE_PATH" ]; then
    FILE_PATH="browser_console.log"
    echo "[SYSTEM] No log file provided. Generating simulated Firefox logs: $FILE_PATH"
    
    # Writing simulated logs using multi-line redirection
    # Included common SSL/TLS errors and telemetry entries found in Firefox console
    cat > "$FILE_PATH" <<EOF
[2024-03-27 10:00:01] INFO: Firefox session started successfully.
[2024-03-27 10:05:23] WARNING: Potential SSL/TLS Handshake failure [SEC_ERROR_UNKNOWN_ISSUER]
[2024-03-27 10:05:45] DEBUG: Telemetry block: 'browser.ping.core' sent.
[2024-03-27 10:10:12] ERROR: SEC_ERROR_BAD_CERT_DOMAIN - Domain mismatch detected.
[2024-03-27 10:15:33] WARNING: Third-party cookie blocked for telemetry.org
[2024-03-27 10:20:44] ERROR: SEC_ERROR_EXPIRED_CERTIFICATE - Site certificate expired.
[2024-03-27 10:25:55] INFO: Heartbeat telemetry sent.
EOF
    echo "[SYSTEM] Generation complete."
fi

# Main Logic: Line-by-line log analysis
echo "===================================================="
echo "          Log Analysis Report: $FILE_PATH"
echo "          Searching for: [$KEYWORD]"
echo "===================================================="

# Initialize a counter variable
MATCH_COUNT=0

# Check if the file exists before attempting to read it
if [ ! -f "$FILE_PATH" ]; then
    echo "Error: Log file $FILE_PATH not found."
    exit 1
fi

# Read file line-by-line using a while loop as per assignment requirements
# Using IFS= to preserve leading/trailing whitespace during audit
while IFS= read -r LINE; do
    # Perform an if-then check for the keyword in each line
    if [[ "$LINE" == *"$KEYWORD"* ]]; then
        echo "[MATCH FOUND]: $LINE"
        # Increment the counter
        ((MATCH_COUNT++))
    fi
done < "$FILE_PATH"

# Print final audit summary
echo "----------------------------------------------------"
echo "Total occurrences of '$KEYWORD': $MATCH_COUNT"
echo "----------------------------------------------------"
echo "Audit complete: Security log analysis finished."
