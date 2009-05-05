package Foo::Model::Foo;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Foo::Schema',
    connect_info => {
        dsr => 'dbi:Doesntexist:dbname=foo',
    },
);

=head1 NAME

Foo::Model::Foo - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<Foo>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Foo::Schema>

=head1 AUTHOR

Anders Nor Berle

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
