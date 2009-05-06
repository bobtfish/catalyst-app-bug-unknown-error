package Foo::Schema;

use base qw/DBIx::Class::Schema/;

use strict;
use warnings;

__PACKAGE__->load_namespaces;

package Catalyst::Model::DBIC::Schema;

use strict;
use warnings;

our $VERSION = '0.23';

use base qw/Catalyst::Model Class::Accessor::Fast Class::Data::Accessor/;
#use MRO::Compat;
#use mro 'c3';
#use UNIVERSAL::require;
#use Carp;
#use Data::Dumper;
#require DBIx::Class;

#__PACKAGE__->mk_classaccessor('composed_schema');
#__PACKAGE__->mk_accessors('schema');

#sub new {
#    my $self = shift->next::method(@_);
    
    #my $schema_class = $self->{schema_class};

    #$schema_class->require
    #    or croak "Cannot load schema class '$schema_class': $@";

#    return $self;
#}

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
