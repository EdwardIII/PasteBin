package PasteBin::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

PasteBin::Controller::Root - Root Controller for PasteBin

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut
use Data::Dumper;

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

	my $pastes_rs = $c->model('PasteDB::Paste');

	my $pastes_sorted = $pastes_rs->search(undef, 
		{ 
			order_by => { -desc => 'last_modified' }, 
			rows => 10 
		}
	);
	$c->stash(pastes_sorted => $pastes_sorted);
    # Hello World
    #$c->response->body( $c->welcome_message );
}

sub json : Local # Path('json'): Args(0)
{
	my ( $self, $c ) = @_;
	
	#$c->forward('index');
	my $pastes_rs = $c->model('PasteDB::Paste');
	$c->stash(result => $pastes_rs->TO_JSON);
	$c->stash->{current_view} = 'JSON';

	
}
=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Edward

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
