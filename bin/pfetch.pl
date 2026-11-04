#!/usr/bin/env perl
# pfetch - A Perl-based system information display tool
#
# AUTHOR:     Daniel Bretschneider, daniel@bretschneider.cc
# DATE:       2026-11-04
# VERSION:    1.0.0
# LICENSE:    MIT License
# DESCRIPTION: Displays system information (OS, Kernel, Uptime, etc.)
#              in a colorful, formatted output similar to fastfetch/neofetch.
# USAGE:      perl pfetch.pl [OPTIONS]
# DEPENDENCIES: Perl 5.10+, Term::ANSIColor (optional)
#
# NOTES:
#   - Ensure you have write permissions to execute this script directly.
#   - This is a learning project exploring systems programming in Perl.
#

use strict;
use warnings;
