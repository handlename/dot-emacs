#!/usr/bin/env perl
use strict;
use warnings;

my $out = "$ENV{HOME}/.emacs.d/shellenv.el";
open my $fh, '>', $out or die "failed to open file: ${out}";

for my $name (keys %ENV) {
    next if ! exists $ENV{$name};
    printf $fh qq{(setenv "%s" "%s")\n}, $name, $ENV{$name};
}

close $fh;
