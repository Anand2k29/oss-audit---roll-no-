#!/bin/bash

# Script Name: 05_manifesto_gen.sh
# Author: Anand
# Course: Open Source Software
# Description: This script interactively generates a FOSS manifesto based on user input.

# Task: Collect user input through interactive read prompts
echo "===================================================="
echo "          The Open Web Manifesto Generator"
echo "===================================================="
echo "Welcome, Auditor. Let us define our vision for the web."
echo ""

# Question 1: Developer Identity
read -p "What is your developer alias? " DEVELOPER_ALIAS

# Question 2: Architectural Philosophy
read -p "What is the most important aspect of web development to you? (e.g., Privacy, Speed, Access): " PHILOSOPHY_ASPECT

# Question 3: Technology Preference
read -p "Name one web technology you think should always remain free and open: " OPEN_TECH

# Compose a 3-sentence personalized manifesto using string concatenation
MANIFESTO_LINE1="As a developer known as $DEVELOPER_ALIAS, I believe the core of the web must remain accessible to all."
MANIFESTO_LINE2="In my vision of the internet, $PHILOSOPHY_ASPECT is the foundational principle that guides every line of code."
MANIFESTO_LINE3="By keeping $OPEN_TECH free and open-source, we ensure a digital future that respects the rights of the user."

# Define the target output file
OUTPUT_FILE="open_web_manifesto.txt"

# Writing the manifesto to the file using redirection (>)
# This creates a NEW file or overwrites an existing one
echo "$MANIFESTO_LINE1" > "$OUTPUT_FILE"
echo "$MANIFESTO_LINE2" >> "$OUTPUT_FILE"
echo "$MANIFESTO_LINE3" >> "$OUTPUT_FILE"

# Append the current date to the bottom of the file (>>)
echo "" >> "$OUTPUT_FILE"
echo "Manifesto Generated on: $(date)" >> "$OUTPUT_FILE"

echo ""
echo "[SYSTEM] Manifesto successfully written to $OUTPUT_FILE."
echo "--- PREVIEWING MANIFESTO ---"

# Display the content of the file to the terminal as per requirement
cat "$OUTPUT_FILE"

echo "----------------------------------------------------"
echo "Thank you for contributing to the Open Source Audit."
