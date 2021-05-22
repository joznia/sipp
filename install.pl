#!/usr/bin/env perl

# zpw installer

use File::Copy;

$src = "./main.pl";
$dest = "/usr/bin/zpw";
$destp = "/usr/bin/pacman";

sub base {
    copy $src, $dest or die "install failed: $! \n";
    chmod 0755, $dest;
}

$a = $ARGV[0];
if ($a eq '-u') {
    if (-e $dest) {
        unlink $dest or die "uninstall failed: $! \n";
    }
} elsif ($a eq '-s') {
    base;
    system "ln -sf $dest $destp";
    chmod 0755, $destp;
} else {
    base;
}
