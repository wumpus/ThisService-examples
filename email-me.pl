#!/usr/bin/env perl -CIO

use strict;

my $cmd = "mail -s ";
my $to;

if ( open my $fd, "<", "$ENV{HOME}/.email-me" )
{
    $to = <$fd>;
    chomp $to;
    close $fd;
}
else
{
    if ( open my $fd, ">", "$ENV{HOME}/Desktop/HEY YOU NEED TO CONFIGURE THE EMAIL ME SERVICE" )
    {
	print $fd "To configure the 'email me' service, create a file named '.email-me' in your home directory containing your email address.\n";
	close $fd;
	exit;
    }
}

my $first = <>;
chomp $first;
my $subj = substr $first, 0, 20;
$subj =~ tr/\'/\"/; # somewhat avoid quoting problems

$cmd .= "'from laptop: $subj' $to";

open my $fd, "|-", $cmd or die;

print $fd $first if $first;

while ( <> )
{
    print $fd $_;
}

close $fd or die;
