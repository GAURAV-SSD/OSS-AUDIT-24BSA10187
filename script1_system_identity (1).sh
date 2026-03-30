#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name] | Course: Open Source Software
# Description: Displays a welcome screen with system information

# --- Variables ---
STUDENT_NAME="Gaurav Bhardwaj"   
REG_NO="24BSA10187"             
SOFTWARE_CHOICE="Git"          

# --- Collect system info using command substitution ---
KERNEL=$(uname -r)                         
USER_NAME=$(whoami)                    
HOME_DIR=$HOME                            
DATETIME=$(date '+%d %B %Y, %H:%M:%S')   

# macOS-compatible uptime (strips leading whitespace)
UPTIME=$(uptime | sed 's/.*up //' | sed 's/,.*//')

# Detect OS name (works on macOS and Linux)
if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO=$(sw_vers -productName 2>/dev/null && sw_vers -productVersion 2>/dev/null || echo "Unknown OS")
fi

# --- Display formatted output ---
echo "========================================"
echo "   Open Source Audit — $STUDENT_NAME"
echo "   Reg No: $REG_NO"
echo "========================================"
echo "Software Chosen : $SOFTWARE_CHOICE"
echo "OS / Distro     : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "Logged-in User  : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "System Uptime   : $UPTIME"
echo "Date & Time     : $DATETIME"
echo "========================================"

# --- License message ---
# The Linux kernel and most OSS tools are licensed under GPL v2
# GPL (GNU General Public License) ensures software remains free and open
echo ""
echo "License Note:"
echo "  The Linux Kernel is licensed under GPL v2."
echo "  This means you are free to use, study, modify, and redistribute it,"
echo "  provided all changes remain under the same GPL license."
echo "========================================"
