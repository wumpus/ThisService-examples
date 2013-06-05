#!/usr/bin/env perl -CIO

my $text = do { local $/; <> };

# make multiple whitespace single space
# (also takes care of tabs)
$text =~ s/[ \t]+/ /g;

# turn single \n's into spaces without killing paragraphs
$text =~ s/ \n/\n/g;
$text =~ s/\n /\n/g;
$text =~ s/\n/ /g;
$text =~ s/  /\n\n/g;

# delete final space
$text =~ s/ $//;

print $text;
