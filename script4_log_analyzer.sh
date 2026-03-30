#!/bin/bash
# Script 4: Log File Analyzer
# Author: Gaurav Bhardwaj | Reg No: 24BSA10187 | Course: Open Source Software
# Description: Reads a log file line by line, counts keyword matches,
#              and prints the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/system.log error

# --- Accept command-line arguments ---
LOGFILE=$1               
KEYWORD=${2:-"error"}      
COUNT=0             

echo "========================================"
echo "       Log File Analyzer"
echo "       Gaurav Bhardwaj | 24BSA10187"
echo "========================================"

# --- Check if a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo ""
    echo "No log file provided. Using a sample demo instead."
    echo ""

    # --- Demo mode: create a temporary sample log file ---
    # This lets the script run and demonstrate concepts even on macOS
    LOGFILE="/tmp/sample_oss_audit.log"
    cat > "$LOGFILE" <<EOF
2024-01-01 10:00:01 INFO  Apache started successfully
2024-01-01 10:01:15 ERROR Failed to bind to port 80 — permission denied
2024-01-01 10:02:30 INFO  Retrying on port 8080
2024-01-01 10:03:44 WARNING Config file missing — using defaults
2024-01-01 10:04:55 ERROR Could not read /etc/httpd/conf/httpd.conf
2024-01-01 10:05:10 INFO  Fallback config loaded
2024-01-01 10:06:22 ERROR Segmentation fault in module mod_ssl
2024-01-01 10:07:01 INFO  Service restarted
2024-01-01 10:08:33 WARNING Disk usage above 85%
2024-01-01 10:09:50 ERROR Connection timeout to database
EOF
    echo "Sample log created at: $LOGFILE"
fi

# --- Validate that the log file exists and is a regular file ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found. Please provide a valid path."
    exit 1
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: '$LOGFILE' is empty. Nothing to analyze."
    exit 0
fi

echo "Log file : $LOGFILE"
echo "Keyword  : '$KEYWORD'"
echo ""

# --- while read loop: process the file one line at a time ---
# IFS= preserves leading/trailing whitespace in each line
# -r prevents backslash interpretation
while IFS= read -r LINE; do
    # if-then: check if the current line contains the keyword (case-insensitive via -i)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter when keyword is found
    fi
done < "$LOGFILE"   # Redirect file into the while loop

# --- Summary output ---
echo "========================================"
echo "Keyword '$KEYWORD' found: $COUNT times"
echo "Total lines in file    : $(wc -l < "$LOGFILE" | tr -d ' ')"
echo "========================================"
echo ""

# --- Print last 5 matching lines ---
echo "Last 5 lines containing '$KEYWORD':"
echo "----------------------------------------"
# grep -i = case-insensitive, tail -5 = last 5 matches
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo "========================================"
