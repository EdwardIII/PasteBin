package PasteBin::Controller::Pastes;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PasteBin::Controller::Pastes - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

use Data::Dumper;

sub base : Chained('/'): PathPart('pastes'): CaptureArgs(0)
{
	my ($self, $c) = @_;
	$c->stash(pastes_rs => $c->model('PasteDB::Paste'));
}

sub index :Chained('base') :PathPart('') :Args(0)
{
	my ($self, $c) = @_;
	my $pastes_rs = $c->stash->{pastes_rs};
	$c->log->debug(Dumper($pastes_rs));
}

sub add : Chained('base'): PathPart('add'): Args(0)
{
	my ($self, $c) = @_;
	if(lc $c->req->method eq 'post')
	{
		my $params = $c->req->params;
		my $pastes_rs = $c->stash->{pastes_rs};

		my $new_paste = $pastes_rs->create(
			{
				name => $params->{name},
				paste => $params->{paste_contents}
			}
		);

		$c->stash('current_paste' => $new_paste);

		return $c->res->redirect(
			$c->uri_for( $c->controller()->action_for('view'), [ $new_paste->id ] )
		);
	}
}

sub paste : Chained('base'): PathPart(''): CaptureArgs(1)
{
	my ($self, $c, $paste_id) = @_;	

	if($paste_id =~ /D/)
	{
		die "paste id does not contain only digits";
	}	

	my $paste = $c->stash->{pastes_rs}->find(
		{ id => $paste_id, key => 'primary' }
	);

	die "No such paste" unless ($paste);

	$c->stash(paste => $paste);
}

sub view : Chained('paste'): PathPart('view'): Args(0)
{
	my ($self, $c) = @_;
	
}
=head1 AUTHOR

Edward

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
