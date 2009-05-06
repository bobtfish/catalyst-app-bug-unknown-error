package Catalyst::Model::DBIC::Schema;

use strict;
use warnings;

our $VERSION = '0.23';

use base qw/Catalyst::Model Class::Accessor::Fast Class::Data::Accessor/;
use MRO::Compat;
use mro 'c3';
use UNIVERSAL::require;
use Carp;
use Data::Dumper;
require DBIx::Class;

__PACKAGE__->mk_classaccessor('composed_schema');
__PACKAGE__->mk_accessors('schema');

sub new {
    my $self = shift->next::method(@_);
    
    my $class = ref($self);
    my $model_name = $class;
    $model_name =~ s/^[\w:]+::(?:Model|M):://;

    croak "->config->{schema_class} must be defined for this model"
        unless $self->{schema_class};

    my $schema_class = $self->{schema_class};

    $schema_class->require
        or croak "Cannot load schema class '$schema_class': $@";

    if( !$self->{connect_info} ) {
        if($schema_class->storage && $schema_class->storage->connect_info) {
            $self->{connect_info} = $schema_class->storage->connect_info;
        }
        else {
            croak "Either ->config->{connect_info} must be defined for $class"
                  . " or $schema_class must have connect info defined on it."
          . " Here's what we got:\n"
          . Dumper($self);
        }
    }

    $self->composed_schema($schema_class->compose_namespace($class));
    $self->schema($self->composed_schema->clone);

    $self->schema->storage_type($self->{storage_type})
        if $self->{storage_type};

    $self->schema->connection( 
        ref $self->{connect_info} eq 'ARRAY' ? 
        @{$self->{connect_info}} : 
        $self->{connect_info}
    );
    
    no strict 'refs';
    foreach my $moniker ($self->schema->sources) {
        my $classname = "${class}::$moniker";
        *{"${classname}::ACCEPT_CONTEXT"} = sub {
            shift;
            shift->model($model_name)->resultset($moniker);
        }
    }

    return $self;
}

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
