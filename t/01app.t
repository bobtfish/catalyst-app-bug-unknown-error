use strict;
use warnings;
use Test::More tests => 1;
use Test::Exception;

eval q{ use Foo; };
unlike $@, qr/Unknown error/;

