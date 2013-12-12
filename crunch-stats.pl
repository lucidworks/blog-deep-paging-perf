#!/usr/bin/perl -l

use warnings;
use strict;

use Statistics::Lite qw(stddev mean);

while (<>) {
    chomp;
    my @data = split;
    my $key = shift @data;
    my $mean = mean @data;
    my $stddev = stddev @data;
    print "$key\t$mean\t$stddev";
}
