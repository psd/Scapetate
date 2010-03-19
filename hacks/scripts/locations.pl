#!/usr/bin/env perl -w

use strict;
use YAML qw(LoadFile Dump);
use LWP;

my @headers = (
	'User-Agent' => 'Mozilla/4.76 [en] (Win98; U)',
	'Accept-Charset' => 'iso-8859-1,*,utf-8',
	'Accept-Language' => 'en-US'
);

my $browser = LWP::UserAgent->new;

my ($yaml_path) = @ARGV;

my $p = LoadFile($yaml_path) or die "unable to read";

my $n = 0;

foreach (@{$p->{map}->{area}}) {

	unless ($_->{'latitude'}) {
		my $url = $_->{href};
		next unless ($url =~ /wikipedia/);

		my $response = $browser->get($url, @headers);
		my $content = $response->content;
		next unless defined $content;

		$content =~ s/\n/ /g;
		$content =~ s/^.*class=.geo.>\s*([-\d\.]+)\s*;\s*([-\d\.]+)\s*<.*$/$1 $2/m;
		($_->{'latitude'}, $_->{'longitude'}) = split(/ /, $content);

		sleep(1);
		#last if ($n++ > 2);
	}
}

print Dump($p);
exit 0;
