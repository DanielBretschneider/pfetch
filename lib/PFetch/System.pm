package PFetch::System;

use strict;
use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(get_hostname);

sub get_hostname {
    chomp(my $hostname = `hostname`);
    return $hostname;
}

1;
