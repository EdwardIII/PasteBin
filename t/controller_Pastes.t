use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'PasteBin' }
BEGIN { use_ok 'PasteBin::Controller::Pastes' }

ok( request('/pastes')->is_success, 'Request should succeed' );
done_testing();
