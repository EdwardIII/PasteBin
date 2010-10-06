#!/opt/perl5/bin/perl
use strict;
use warnings;

chdir( "/home/edward/public_html/pastebin/" ) or die $!;
exec( "PATH=/opt/perl5/bin script/pastebin_fastcgi.pl", @ARGV ) or die $!;


