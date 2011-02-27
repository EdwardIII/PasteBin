use strict;
use warnings;
use Test::More;

#BEGIN { use_ok 'Catalyst::Test', 'PasteBin' }
#BEGIN { use_ok 'PasteBin::Controller::Pastes' }
#
#ok( request('/pastes')->is_success, 'Hit the pastes page' );
#
#use HTTP::Request::Common;
#my $response = request POST '/pastes/add', [
#	name => 'Test Paster',
#	paste_contents => 'Test paste contents',
#];
#use Data::Dumper;
#diag(Dumper($response->as_string));
use Test::WWW::Mechanize::Catalyst;
my $mech = Test::WWW::Mechanize::Catalyst->new(catalyst_app => 'PasteBin');
$mech->get_ok('/pastes', "We can open the pastes page");
is($mech->ct, 'text/html', "Sanity check it's html");

my $name = 'Test Paster';
my $contents = 'My paste';

# should fail without an auth keyword
$mech->post(
	'/pastes/add', 
	{ name => $name, paste_contents => $contents },
);
$mech->content_lacks($name, 'Posting without the authorisation keyword should fail');

$mech->get_ok('/pastes', "We can go back to the pastes page");
$mech->post_ok(
	'/pastes/add', 
	{ name => $name, paste_contents => $contents, 'auth' => 'cornholio' },
	'We can post a second paste, including auth word'
);
$mech->content_contains($name, 'That test name should show up on the next page');
$mech->content_contains($contents, 'That test paste content should show up on the next page');
done_testing();
