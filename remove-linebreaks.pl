#!/usr/bin/perl -CIO

while ( <> )
{
    s/\n/ /g;
    s/\t/ /g;
    s/  $/ /;
    print;
}
