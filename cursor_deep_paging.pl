#!/usr/bin/perl

# usage: ./cursor_deep_paging.pl "some query string" "score desc, foo asc"

use strict;
use warnings;
use LWP::Simple;
use JSON;
use URI;
use Time::HiRes qw(gettimeofday tv_interval);
$| = 1;

my $q = shift || die "you must specify a q param";
my $sort = shift || die "you must specify a sort param";

my $rows = 1000; # assume non trivial page size for deep paging
my $uri = URI->new('http://localhost:8983/solr/collection1/select');

# baseline params & prime the field caches
my $params = {
    'fl' => 'id,score',
    'wt' => 'json',
    'start' => 0,
    'rows' => 0,
    'q' => '*:*',
    # must add tiebreaker on id
    'sort' => "$sort, id desc",
};
$uri->query_form($params);
get($uri) || die "field cache warming query failed";

# prep for deep walk
$params->{'rows'} = $rows;
$params->{'q'} = $q;
$params->{'cursorMark'} = '*';

my $docsOnPage = 0;
my $page = 0;
do {
    $uri->query_form($params);

    my $timer_start = [gettimeofday];
    my $rawdata = get($uri);
    my $timer_end = [gettimeofday];

    my $data = decode_json($rawdata);
    for (@{$data->{'response'}->{'docs'}}) {
	print STDERR $_->{'id'}, ,"\t", $_->{'score'}, "\n";
    }
    $params->{'cursorMark'} = $data->{'nextCursorMark'};
    $docsOnPage = scalar(@{$data->{'response'}->{'docs'}});
    print STDOUT $page++, "\t", tv_interval($timer_start, $timer_end), "\n";
} while ($docsOnPage == $rows);

