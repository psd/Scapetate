#!/usr/bin/env perl

# convert MapSpinner HTML into YAML

use strict;
use HTML::Parser;
use YAML;

my $p = new GrabMap;
$p->parse_file(*STDIN);
print Dump($p->{grabmap});
exit 0;

package GrabMap;
use base "HTML::Parser";

sub start {
    my ($self, $tag, $attr, $attrseq, $origtext) = @_;

    if ($tag eq "img" && $attr->{usemap}) {
        $self->{grabmap}->{img}->{src} = $attr->{src};

        $attr->{usemap} =~ s/^#//;
        $self->{grabmap}->{img}->{map} = $attr->{usemap};
    }
    if ($tag eq "map") {
        $self->{grabmap}->{map}->{name} = $attr->{name};
    }
    if ($tag eq "area") {
        $attr->{href} =~ s/^\s*(.*)\s*$/$1/;
        $attr->{title} =~ s/^\s*(.*)\s*$/$1/;
        delete $attr->{href} if ($attr->{href} eq '');
        delete $attr->{alt} if ($attr->{title} eq $attr->{alt});
        if ($attr->{title} ne '') {
            push(@{$self->{grabmap}->{map}->{area}}, $attr);
        }
    }
}
