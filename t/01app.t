use strict;
use warnings;
use Test::More tests => 2;

use Catalyst::Test ();
Catalyst::Test->import('Foo');

ok( request('/')->is_success, 'Request should succeed' );
