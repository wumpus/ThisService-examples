#!/usr/bin/perl -CIO

my $to = "lindahl\@pbm.com";
my $cmd = "mail -s ";

my $first = <>;
chomp $first;
my $subj = substr $first, 0, 20;
$subj =~ tr/\'/\"/; # avoid quoting problems

$cmd .= "'from laptop: $subj'";
$cmd .= " $to";

open my $fd, "|-", $cmd or die;

print $fd $first if $first;

while ( <> )
{
    print $fd $_;
}

close $fd or die;
