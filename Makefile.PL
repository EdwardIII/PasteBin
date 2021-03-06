#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'PasteBin';
all_from 'lib/PasteBin.pm';

requires 'Catalyst::View::JSON';
requires 'MooseX::NonMoose';
requires 'DBIx::Class::Helper::Row::ToJSON';
requires 'Scalar::Util';
requires 'DBIx::Class::Helper::Row::ToJSON';
requires 'Catalyst::Runtime' => '5.80027';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'MooseX::NonMoose';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
test_requires 'Test::More' => '0.88';
test_requires 'Test::WWW::Mechanize::Catalyst' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
