#!/usr/bin/env perl -CIO

# thanks to John Gruber, http://daringfireball.net/2007/04/google_lucky_thisservice

use strict;
use warnings;
use URI::Escape qw( uri_escape_utf8 );
use open IO => ":utf8", ":std";

my $url = "https://blekko.com/ws/?q=%QUERY%+/urlsonly+/ps=1&f=1";

my $query = do { local $/; <> };
$query =~ s/^\s+//g;
$query =~ s/\s+$//g;
$query = uri_escape_utf8( $query, "^A-Za-z0-9" );

$url =~ s/%QUERY%/$query/;

my $response = `curl -A "Mozilla/5.0 ThisService blekko-lucky-insert-url" "$url"`;
$response =~ m,^(https?://\S+)$,xm;
print $1;

