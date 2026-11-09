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
readonly VERSION="v1.0.3"

# programs needed for sys_info_page to do it's job
readonly PROGRAMS=("lsusb" "lsblk" "lscpu" "ip" "free")

# colored messages
readonly OK_GREEN="\e[32mOk\e[0m"
readonly ERROR_RED="\e[31mError\e[0m"

# Operating system information
declare -A OS_INFO=()

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
# Function: command_exists()
# Description: This function checks if a certain program/command exists.
# ------------------------------------------------------------------------------
command_exists() {
    command -v "$1" &> /dev/null
}


# ------------------------------------------------------------------------------
# Function: check_dependencies()
# Description: Check if all programs in $PROGRAMS are installed on device
# ------------------------------------------------------------------------------
check_dependencies() {
    for curr_program in "${PROGRAMS[@]}"; do
        printf "[*] checking if '%s' is installed..." "$curr_program"

        if command_exists "$curr_program"; then
            printf '%b\n' "$OK_GREEN"
        else
            printf '%b\n' "$ERROR_RED"
            printf "[-] Please install '%s' so we can continue." "$curr_program" >&2

            # return 1: error command not found.
            return 1
        fi
    done

    # return 0: success
    return 0
}


# ------------------------------------------------------------------------------
# Function: html_escape()
# Description: This function changes special characters into their html entity.
#
# &	-> &amp;
# <	-> &lt;
# >	-> &gt;
# "	-> &quot;
# '	-> &#39;
#
# Explanation:
# ┌───┐  ┌─────────────────────┐  ┌──┐
# │sed│  │-e 's/&/\&amp;/g'    │  │g │
# └───┘  └─────────────────────┘  └──┘
#  Command    Substitution command   Global flag
#
# s -> Substitute (find and replace)
# g -> global flag (replace ALL occurences, not only the first)
# ------------------------------------------------------------------------------
html_escape() {
    local input="$1"

    printf '%s' "$input" | \
        sed -e 's/&/\&amp;/g' \
            -e 's/</\&lt;/g' \
            -e 's/>/\&gt;/g' \
            -e 's/"/\&quot;/g' \
            -e "s/'/\&#39;/g"
}


# ------------------------------------------------------------------------------
# Function: get_os_info()
# Description: Collects operating system and kernel information.
#
# Our goal is to retrieve:
# - Distribution name (e.g. CachyOS)
# - Distribution version
# - Kernel version
# - System architecture
# - Hostname
#
# | Information             | Command or File                            |
# |-------------------------|--------------------------------------------|
# | Distribution Name       | `cat /etc/os-release` or `lsb_release -a`  |
# | Distribution Version    | Same as above (`VERSION_ID`, `VERSION`)    |
# | Kernel Version          | `uname -r`                                 |
# | System Architecture     | `uname -m` or `arch`                       |
# | Hostname                | `hostname` or `cat /etc/hostname`          |
#
# ------------------------------------------------------------------------------
get_os_info() {
    # check if /etc/os-release exists
    if [[ ! -r /etc/os-release ]]; then
        printf "[-] Cannot read /etc/os-release\n" >&2
        return 1
    fi

    # load operating system information
    local os_name=""
    local os_pretty_name=""
    local os_version=""

    # source into a function scope using a subshell
    source /etc/os-release

    # collect operating system information
    OS_INFO["distribution"]="${PRETTY_NAME:-${NAME:-Unknown}}"
    OS_INFO["version"]="${VERSION_ID:-Unknown}"
    OS_INFO["kernel"]="$(uname -r)"
    OS_INFO["architecture"]="$(uname -m)"
    OS_INFO["hostname"]="$(hostname)"
}


# ------------------------------------------------------------------------------
# Function: print_os_info()
# Description: Print gathered operating system information to terminal.
# ------------------------------------------------------------------------------
print_os_info() {
    printf '\n===== SYSTEM INFORMATION =====\n'

    for key in "${!OS_INFO[@]}"; do
        printf '%-15s : %s\n' "$key" "${OS_INFO[$key]}"
    done
}


# ==============================================================================
# MAIN
# ==============================================================================

main() {
    # greeting
    printf '[*] Starting %s %s\n' "$SCRIPT_NAME" "$VERSION"
    printf '[*] Checking dependencies...\n'

    # Exit the script if return value of check_dependencies() is non zero.
    if ! check_dependencies; then
        return 1
    fi

    # testing html_escape
    # test_string='Daniel'\''s PC & Linux <CachyOS> "Awesome"'
    # html_escape "$test_string"

    # collect operating system information
    get_os_info || return 1

    # print operating system information
    print_os_info

    # return code success
    return 0
}


# ==============================================================================
# SCRIPT EXECUTION
# ==============================================================================

main "$@"
