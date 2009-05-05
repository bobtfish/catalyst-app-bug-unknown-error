package Foo;

use strict;
use warnings;

use Catalyst::Runtime '5.70';

use base qw/Catalyst/;
use Catalyst qw/-Debug/;
our $VERSION = '0.01';

__PACKAGE__->config( name => 'Foo' );

# Start the application
__PACKAGE__->setup();

__PACKAGE__->model ('Foo')->schema->storage->dbh_do (sub {});

1;
