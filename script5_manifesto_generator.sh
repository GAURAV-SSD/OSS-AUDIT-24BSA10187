#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Gaurav Bhardwaj | Reg No: 24BSA10187 | Course: Open Source Software
# Description: Asks the user three interactive questions, then composes and saves
#              a personalised open source philosophy statement to a .txt file.

echo "========================================"
echo "   Open Source Manifesto Generator"
echo "   Gaurav Bhardwaj | 24BSA10187"
echo "========================================"
echo "Answer three questions to generate your manifesto."
echo ""

# --- read: interactively collect user input ---
# -p flag displays a prompt before waiting for input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Get current date for the manifesto timestamp ---
DATE=$(date '+%d %B %Y')

# --- Alias concept (demonstrated via comment as required by the brief) ---
# In a real shell session you might define: alias today='date +%d\ %B\ %Y'
# Here we achieve the same result with a variable for portability in scripts.

# --- Define output filename using the current user's name ---
OUTPUT="manifesto_$(whoami).txt"

# --- Compose the manifesto using string concatenation and echo with >> ---
# > creates/overwrites the file; >> appends subsequent lines

echo "" > "$OUTPUT"   # Create/clear the file first

echo "========================================"   >> "$OUTPUT"
echo "   My Open Source Manifesto"               >> "$OUTPUT"
echo "   Gaurav Bhardwaj | 24BSA10187"           >> "$OUTPUT"
echo "   Generated on: $DATE"                    >> "$OUTPUT"
echo "   By: $(whoami)"                          >> "$OUTPUT"
echo "========================================"   >> "$OUTPUT"
echo ""                                          >> "$OUTPUT"

# --- Main paragraph using the three user inputs ---
echo "Every day, I rely on $TOOL — a tool built not for profit," >> "$OUTPUT"
echo "but out of a shared belief that knowledge belongs to everyone." >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
echo "To me, freedom means $FREEDOM. That is the value at the heart" >> "$OUTPUT"
echo "of open source: the freedom to see how something works, to change" >> "$OUTPUT"
echo "it, and to pass it on. The GPL, the MIT License, the Apache License" >> "$OUTPUT"
echo "— these are not just legal documents. They are promises." >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "One day, I want to build $BUILD and share it freely — not because" >> "$OUTPUT"
echo "I have to, but because every open-source tool I use today was built" >> "$OUTPUT"
echo "by someone who made that same choice before me." >> "$OUTPUT"
echo ""                                                >> "$OUTPUT"
echo "Standing on the shoulders of giants means I have a responsibility" >> "$OUTPUT"
echo "to extend that foundation, not to lock it away." >> "$OUTPUT"
echo ""                                                >> "$OUTPUT"
echo "========================================"       >> "$OUTPUT"
echo "Signed: $(whoami) | $DATE"                     >> "$OUTPUT"
echo "========================================"       >> "$OUTPUT"

# --- Confirm file was saved and display it ---
echo ""
echo "Manifesto saved to: $OUTPUT"
echo ""
echo "--- Preview ---"
cat "$OUTPUT"
