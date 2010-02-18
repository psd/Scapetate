#!/usr/bin/env perl

# apply YAML to the template toolkit template

use strict;
use Template;
use YAML qw(LoadFile Dump);
use Data::Dumper;

my ($yaml_path, $template_path, $target_path) = @ARGV;

my $yaml = LoadFile($yaml_path) or die "unable to read";
my $tt = Template->new();
$tt->process($template_path, $yaml, $target_path);
