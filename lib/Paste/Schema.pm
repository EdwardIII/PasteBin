package Paste::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-09-09 18:37:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z1cYk/XSwpRaYcmLFl4HhA

sub new {} # Workaround for NonMoose bug #65221
# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
