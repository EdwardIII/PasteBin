#!/opt/perl5/bin/perl
use strict;
use warnings;

use strict;
use warnings;

chdir( "/home/edward/public_html/pastebin/" ) or die $!;
exec( "script/pastebin_fastcgi.pl", @ARGV ) or die $!;


