#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

#BEGIN { use_ok 'Catalyst::Test', 'PasteBin' }
BEGIN { use_ok 'Catalyst' }
BEGIN { use_ok 'Paste::Schema' }
BEGIN { use_ok 'Paste::Schema::Result::Paste' }

my $schema = Paste::Schema->connect(
		{ 
			dsn => 'dbi:SQLite:db/pastebin.db',
	        user => '',
    	    password => '',
		}

);
my @pastes = $schema->resultset('Paste')->all;
use Data::Dumper;
foreach my $paste (@pastes)
{
#	diag(Dumper($paste->TO_JSON));	
}
done_testing();
