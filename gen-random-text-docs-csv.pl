#!/usr/bin/perl
#
# usage: gen-random-text-docs-csv.pl 1000 7 13w200 20w5 > data.csv
# -> generates 1000 docs with uniqueKey and 3 random fields
# -> first field is int of cardinality 7.
# -> second field is string of at most 13 "words" from a vocab of 200 "words"
# -> third field is string of at most 20 "words" from a vocab of 5 "words"
#
# (all "words" are synthetic and look suprisingly like integers)

my $num_docs = shift;
die "Need to specify a number of documents" unless $num_docs;

my @field_bounds = @ARGV;
die "Need to specify some random field limits" unless @field_bounds;

while ($num_docs--) {
    print "$num_docs"; # uniqueKey
    for (@field_bounds) {
	print ",";
	if (/(\d+)w(\d+)/) {
	    my $max_words_in_field = rand($1);
	    my $max_words_in_vocab = rand($2);
	    print "\"";
	    map { print int(rand($max_words_in_vocab)) . " " } 0..$max_words_in_field;
	    print "\"";
	} else {
	    print int(rand(@field_bounds));
	}
    }
    print "\n";
}

