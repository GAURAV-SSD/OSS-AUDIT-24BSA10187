#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Gaurav Bhardwaj | Reg No: 24BSA10187 | Course: Open Source Software
# Description: Checks if a chosen OSS package is installed, shows its version,
#              and prints a philosophy note using a case statement.

# --- Set the package name to inspect ---
# Change this to match your chosen software: git, vlc, python3, wget, etc.
PACKAGE="git"

echo "========================================"
echo "  FOSS Package Inspector: $PACKAGE"
echo "  Gaurav Bhardwaj | 24BSA10187"
echo "========================================"

# --- Detect package manager and check installation ---
# macOS uses 'brew'; Linux uses 'rpm' (RedHat) or 'dpkg' (Debian/Ubuntu)

if command -v brew &>/dev/null; then
    # macOS with Homebrew
    if brew list "$PACKAGE" &>/dev/null; then
        echo "Status  : $PACKAGE is INSTALLED (via Homebrew)"
        VERSION=$(brew info "$PACKAGE" --json 2>/dev/null | grep '"stable"' | head -1 | awk -F'"' '{print $4}')
        echo "Version : $VERSION"
    else
        # Try checking system-installed tools (like git which ships with Xcode)
        if command -v "$PACKAGE" &>/dev/null; then
            echo "Status  : $PACKAGE is available as a system tool"
            VERSION=$("$PACKAGE" --version 2>/dev/null | head -1)
            echo "Version : $VERSION"
        else
            echo "Status  : $PACKAGE is NOT installed."
            echo "Install hint: brew install $PACKAGE"
        fi
    fi

elif command -v rpm &>/dev/null; then
    # RPM-based Linux (Fedora, CentOS, RHEL)
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "Status  : $PACKAGE is INSTALLED"
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "Status  : $PACKAGE is NOT installed."
    fi

elif command -v dpkg &>/dev/null; then
    # Debian/Ubuntu Linux
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "Status  : $PACKAGE is INSTALLED"
        dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "Version:", $3}'
    else
        echo "Status  : $PACKAGE is NOT installed."
    fi

else
    echo "No recognised package manager found (brew/rpm/dpkg)."
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- case statement: prints a philosophy line based on the package name ---
case $PACKAGE in
    git)
        echo "Git: Linus Torvalds built it after BitKeeper's free license was revoked."
        echo "License: GPL v2 — the same license as the Linux kernel itself."
        ;;
    python3 | python)
        echo "Python: shaped entirely by its community under the permissive PSF License."
        echo "It proves that open contribution produces world-class languages."
        ;;
    httpd | apache2)
        echo "Apache HTTP Server: powers ~30% of websites globally under Apache 2.0."
        echo "A permissive license that lets businesses build on it freely."
        ;;
    vlc)
        echo "VLC: born at a French university so students could stream video freely."
        echo "Licensed under LGPL/GPL — plays anything, owned by no corporation."
        ;;
    firefox)
        echo "Firefox: Mozilla's nonprofit fight for an open, non-monopolised web."
        echo "Licensed under MPL 2.0 — a weak copyleft that allows file-level freedom."
        ;;
    mysql)
        echo "MySQL: a dual-license story — GPL v2 for open use, commercial for proprietary."
        echo "Shows how OSS licenses can coexist with business models."
        ;;
    libreoffice)
        echo "LibreOffice: a real community fork — born when OpenOffice was acquired by Oracle."
        echo "A lesson in why community ownership matters in open source."
        ;;
    *)
        echo "$PACKAGE: an open-source tool that someone chose to share freely."
        echo "Every open-source project begins with a decision to give knowledge away."
        ;;
esac

echo "========================================"
