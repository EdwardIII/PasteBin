#!/usr/bin/perl

use lib 'lib';

require PasteBin;
PasteBin->model('PasteDB')->schema->deploy;
