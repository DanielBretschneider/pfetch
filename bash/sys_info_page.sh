#!/usr/bin/env bash
#
# ==============================================================================
# Project       : pfetch
# Script        : sys_info_page.sh
# Description   : Generates a HTML report containing information about the system.
#
# Author        : Daniel Bretschneider
# Email         : daniel@bretschneider.cc
# Website       : https://www.bretschneider.cc/
#
# Created       : 2026-11-08
# Last Modified : 2026-11-08
# Version       : 1.0.0
#
# License       : MIT License
#
# Requirements  : Bash 4.0+
#
# Usage         : ./sys_info_page.sh [OPTIONS]
#
# ==============================================================================
#
# Notes:
#   Additional information, important details or examples.
#
# ==============================================================================

# ==============================================================================
# CONFIGURATION
# ==============================================================================

set -Eeuo pipefail


# ------------------------------------------------------------------------------
# Global Variables
# ------------------------------------------------------------------------------

# script version
readonly VERSION="v1.0"

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------

# script dir and file name
readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename -- "${BASH_SOURCE[0]}")"

# report dir and file name
readonly DESKTOP_DIR="$HOME/Desktop"
readonly REPORT_DIR="$DESKTOP_DIR/sys_info_report"
readonly REPORT_FILE="$REPORT_DIR/sys_info_report.html"

# ------------------------------------------------------------------------------
# Environment Variables
# ==============================================================================


# ==============================================================================
# FUNCTIONS
# ==============================================================================

# ------------------------------------------------------------------------------
# Function: function_name
# Description: Short description of what the function does.
# ------------------------------------------------------------------------------


# ==============================================================================
# MAIN
# ==============================================================================

main() {
    printf '[*] Starting %s %s\n' "$SCRIPT_NAME" "$VERSION"

    printf '[-] The report will be created at %s\n' "$REPORT_FILE"
}


# ==============================================================================
# SCRIPT EXECUTION
# ==============================================================================

main "$@"
