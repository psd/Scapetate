#!/usr/bin/env perl

# add missing fields to a YAML map

use strict;
use YAML qw(LoadFile Dump);
use Data::Dumper;

my ($yaml_path) = @ARGV;

my $p = LoadFile($yaml_path) or die "unable to read";

foreach (@{$p->{map}->{area}}) {
    my @c = split(/\s*,\s*/, $_->{coords});
    $_->{left} = @c[0];
    $_->{top} = @c[1];
    $_->{width} = @c[2] - @c[0];
    $_->{height} = @c[3] - @c[1];
    $_->{id} = $_->{title};
    $_->{id} =~ s/([^A-Za-z0-9])//g;
}

print Dump($p);
exit 0;
