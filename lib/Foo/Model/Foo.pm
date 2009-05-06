package CatalystX::Model::DBIC::Schema;
use base qw/Catalyst::Model Class::Accessor::Fast Class::Data::Accessor/;

package Foo::Model::Foo;

use strict;
use base 'CatalystX::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Foom::Schema',
    connect_info => {
#        dsr => 'dbi:Doesntexist:dbname=foo',
    },
);

1;
