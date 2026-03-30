#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Gaurav Bhardwaj | Reg No: 24BSA10187 | Course: Open Source Software
# Description: Loops through key system directories, reports size and permissions.
#              Also checks your chosen software's config directory.

# --- List of important directories to audit ---
DIRS=("/etc" "/var/log" "/tmp" "/usr/bin" "/usr/local")

echo "========================================"
echo "     Directory Audit Report"
echo "     Gaurav Bhardwaj | 24BSA10187"
echo "========================================"
printf "%-20s %-12s %-30s\n" "Directory" "Size" "Permissions (type/owner/group)"
echo "------------------------------------------------------------------------"

# --- for loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Get permissions, owner, group using ls -ld
        # awk extracts fields: $1=perms, $3=owner, $4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives human-readable size; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted row
        printf "%-20s %-12s %-30s\n" "$DIR" "$SIZE" "$PERMS"
    else
        # Directory doesn't exist on this system
        printf "%-20s %-12s\n" "$DIR" "[does not exist]"
    fi
done

echo "========================================"
echo ""

# --- Check your chosen software's config directory ---
# Change SOFTWARE_CONFIG to the config path relevant to your chosen software
# Examples:
#   Git       -> $HOME/.gitconfig  (or ~/.git)
#   Apache    -> /etc/httpd  OR  /etc/apache2
#   MySQL     -> /etc/mysql
#   Python    -> /usr/lib/python3 (Linux) or /usr/local/lib/python3.x (macOS)
#   VLC       -> $HOME/.config/vlc  (Linux) or ~/Library/Preferences/org.videolan.vlc (macOS)

SOFTWARE_NAME="Git"
SOFTWARE_CONFIG="$HOME/.gitconfig"

echo "--- Config Check: $SOFTWARE_NAME ---"
if [ -e "$SOFTWARE_CONFIG" ]; then
    echo "Config found at : $SOFTWARE_CONFIG"
    # stat command: macOS uses -f flags, Linux uses -c flags
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS stat syntax
        PERMS=$(ls -ld "$SOFTWARE_CONFIG" | awk '{print $1, $3, $4}')
    else
        # Linux stat syntax
        PERMS=$(stat -c '%A %U %G' "$SOFTWARE_CONFIG")
    fi
    echo "Permissions     : $PERMS"
else
    echo "Config path '$SOFTWARE_CONFIG' not found on this system."
    echo "This may mean $SOFTWARE_NAME is not installed or uses a different path."
fi

echo "========================================"
