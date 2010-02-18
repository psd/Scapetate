#!/usr/bin/env perl

use strict;
use Template;
use YAML qw(LoadFile Dump);

my $yaml = LoadFile('index.yaml') or die "unable to read";

my $tt = Template->new();

$tt->process("template.html", $yaml, "index.html");

