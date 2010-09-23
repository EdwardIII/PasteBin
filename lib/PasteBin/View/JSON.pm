package PasteBin::View::JSON;

use strict;
use base 'Catalyst::View::JSON';
use JSON::XS ();

=head1 NAME

PasteBin::View::JSON - Catalyst JSON View

=head1 SYNOPSIS

See L<PasteBin>

=head1 DESCRIPTION

Catalyst JSON View.

=head1 AUTHOR

Edward

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
sub encode_json {
      my($self, $c, $data) = @_;
      my $encoder = JSON::XS->new->ascii->pretty->allow_nonref;
	  #$encoder->allow_blessed( [ 1 ] );
	  $encoder->convert_blessed( [1] );
      $encoder->encode($data);
}

__PACKAGE__->config( { expose_stash => [ qw/result/ ] } );

1;
