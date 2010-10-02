package PasteBin::View::Web;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER => 'page.tt',
    render_die => 1,
	expose_methods => [ qw/truncate_text/ ],
);


=head1 NAME

PasteBin::View::Web - TT View for PasteBin

=head1 DESCRIPTION

TT View for PasteBin.

=head1 SEE ALSO

L<PasteBin>

=head1 AUTHOR

Edward

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

sub truncate_text
{
	my ($self, undef, $text, $chars) = @_;
	if(!defined($chars)) { $chars = 200; }
	$text = substr($text, 0, 100);	
	return $text;

}
1;
