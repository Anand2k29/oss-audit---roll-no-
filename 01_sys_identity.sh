#!/bin/bash

# Script Name: 01_sys_identity.sh
# Author: Anand
# Course: Open Source Software
# Description: This script generates a system identity report for the Firefox audit project.

# Clear the screen for a clean welcome presentation
clear

# Header section with basic output formatting
echo "===================================================="
echo "      The Open Source Audit: Firefox Edition"
echo "           System Identity Report"
echo "===================================================="
echo ""

# Extracting Linux Distribution name from /etc/os-release using grep and cut
# This shows the host environment where the audit is conducted
OS_NAME=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d'"' -f2)

# Using command substitution to gather system details
KERNEL_VERSION=$(uname -r)
CURRENT_USER=$(whoami)
USER_HOME=$HOME
UPTIME_REPORT=$(uptime -p)
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Displaying the variables using echo and basic formatting
echo "OS Distribution:  $OS_NAME"
echo "Kernel Version:   $KERNEL_VERSION"
echo "Logged-in User:   $CURRENT_USER"
echo "Home Directory:    $USER_HOME"
echo "System Uptime:    $UPTIME_REPORT"
echo "Current Date:     $CURRENT_DATE"

echo ""
echo "----------------------------------------------------"
# Firefox Context: Display license information as per requirements
echo "Host OS Open Source License: GPL | Target Audit Software: Mozilla Firefox (MPL 2.0)"
echo "----------------------------------------------------"
echo "Report Generated Successfully."
