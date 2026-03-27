#!/bin/bash

# Script Name: 02_pkg_inspector.sh
# Author: Anand
# Course: Open Source Software
# Description: This script inspects the status and philosophy of FOSS packages.

# Define the primary package to audit
PACKAGE="firefox"

echo "===================================================="
echo "          FOSS Package Inspector: $PACKAGE"
echo "===================================================="

# Use dpkg -s to check if the package is installed on Debian/Ubuntu
# Redirect stderr to /dev/null so "not found" errors don't clutter the screen
if dpkg -s "$PACKAGE" > /dev/null 2>&1; then
    # If installed, extract the version line using grep
    VERSION=$(dpkg -s "$PACKAGE" | grep "^Version:")
    echo "Status: [INSTALLED]"
    echo "$VERSION"
else
    # If not installed, notify the auditor
    echo "Status: [NOT FOUND]"
    echo "Caution: $PACKAGE is missing from the system."
fi

echo ""
echo "--- Open Source Philosophy Review ---"

# A case statement to provide philosophical context for audit-related tools
# This mimics a student's research notes on FOSS philosophy
for PKG in "firefox" "chromium-browser" "curl" "wget"; do
    case $PKG in
        "firefox")
            echo "- Firefox: Backed by a nonprofit fighting for a free and open internet."
            ;;
        "chromium-browser")
            echo "- Chromium: The open-source foundation for many modern browsers."
            ;;
        "curl")
            echo "- curl: Essential command-line tool for data transfer, widely open-source."
            ;;
        "wget")
            echo "- wget: A non-interactive tool for retrieving files from the web."
            ;;
        *)
            echo "- $PKG: No philosophy data found."
            ;;
    esac
done

echo "----------------------------------------------------"
echo "Audit Task Complete."
