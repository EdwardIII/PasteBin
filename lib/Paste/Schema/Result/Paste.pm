package Paste::Schema::Result::Paste;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 NAME

Paste::Schema::Result::Paste

=cut

__PACKAGE__->table("pastes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 paste

  data_type: 'text'
  is_nullable: 1

=head2 last_modified

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "paste",
  { data_type => "text", is_nullable => 1 },
  "last_modified",
  { data_type => "datetime", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-09 18:51:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gMei7PiiYfAKFi7JJ8EztA


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->add_columns('last_modified',
	{ %{__PACKAGE__->column_info('last_modified')},
	set_on_create => 1,
	set_on_update => 1
	}
);

 __PACKAGE__->load_components(qw{Helper::Row::ToJSON}); # provides TO_JSON 
# See http://search.cpan.org/~frew/DBIx-Class-Helpers-2.004000/lib/DBIx/Class/Helper/Row/ToJSON.pm

__PACKAGE__->meta->make_immutable;
1;
