#!/usr/bin/env perl

=begin
Welcome to sipp.

This is a zypper/rpm wrapper written in Perl and aims to have a syntax similar to Arch's 'pacman'.

This is free software licensed under the GNU GPL v3.

=cut

$help = <<"EOF";
space: --help
-S     : install a package
-U     : install a local .rpm
-Rs    : remove a package
-Rns   : remove a package (same as -Rs)
-Syu   : perform a system upgrade
-Syuu  : perform a distribution upgrade
-Ss    : search for a package via regex
-Q     : search for a locally installed package
-Qi    : display installed package information
-Si    : display remote package information
-Ql    : display files provided by an installed package
-Qo    : find which package provides which file
-Qc    : show the changelog of a package
-Qu    : list packages which are upgradable
-Sc    : remove packages from the local package cache
-D     : mark an automatically installed package as manually installed
-Sw    : download a package without installing it
EOF

## Identifying command-line arguments
$opt = $ARGV[0];
shift @ARGV;
$after = join " ", @ARGV;

## Defining subroutines

# check if user is root
sub checksu {
    my $thisf = (caller(0)) [3];
    if ($> ne 0) {
        die "arg '$_[0]' requires root \n"
    }
}

# no arguments or --help
sub help {
    die $help;
};

# no arguments for option
sub checkargs {
    if ($_[0] ne '') {
        $mis = $_[0];
    } else {
        $mis = "package(s)"
    }

    if($after eq '') {
        die "no $mis given\n";
    }
}

# -S
sub S {
    checksu '-S';
    checkargs;
    my $cmd = "zypper in $after";
    system $cmd;
};

# -U
sub U {
    checksu '-U';
    if(-e $after) {
        my $cmd = "zypper in $after";
        system $cmd;
    } else {
        die "file '$after' is invalid \n";
    }
};

# -Rs
sub Rs {
    checksu '-Rs';
    checkargs;
    my $cmd = "zypper rm $after";
    system $cmd;
};

# -Syu
sub Syu {
    checksu '-Syu';
    my $cmd = "zypper up";
    system $cmd;
}

# -Syuu
sub Syuu {
    checksu '-Syuu';
    my $cmd = "zypper dup";
    system $cmd;
}

# -Ss
sub Ss {
    checkargs;
    my $cmd = "zypper se $after";
    system $cmd;
}

# -Q
sub Q {
    if($after eq '') {
        my $cmd = "rpm -qa";
        system $cmd;
    } else {
        my $cmd = "rpm -qa $after";
        system $cmd;
    }
}

# -Qi
sub Qi {
    checkargs;
    my $cmd = "rpm -qi $after";
    system $cmd;
}

# -Si
sub Si {
    checkargs;
    my $cmd = "zypper info $after";
    system $cmd;
}

# -Ql
sub Ql {
    checkargs;
    my $cmd = "rpm -ql $after";
    system $cmd;
}

# -Qo
sub Qo {
    if (-e $after) {
        my $cmd = "rpm -qf $after";
        system $cmd;
    } else {
        die "file '$after' invalid \n"
    }
}

# -Qc
sub Qc {
    checkargs;
    my $cmd = "rpm -q --changelog $after";
    system $cmd;
}

# -Qu
sub Qu {
    my $cmd = "zypper list-updates";
    system $cmd;
}

# -Sc
sub Sc {
    checksu '-Sc';
    my $cmd = "zypper clean";
    system $cmd;
}

# -Qtdq # not currently working
sub Qtdq {
    checksu '-Qtdq';
    my $cmd = "zypper autoremove";
    system $cmd;
}

# -De
sub De {
    checksu '-De';
    checkargs;
    my $cmd = "zypper in -f $after";
    system $cmd;
}

# -Sw
sub Sw {
    checksu '-Sw';
    checkargs;
    my $cmd = "zypper in -d $after";
    system $cmd;
}

## Processing arguments
if    ($opt eq '')       { help }
elsif ($opt eq '--help') { help }
elsif ($opt eq '-S')     { S }
elsif ($opt eq '-U')     { U }
elsif ($opt eq '-Rs')    { Rs }
elsif ($opt eq '-Rns')   { Rs }
elsif ($opt eq '-Sy')    { Sy }
elsif ($opt eq '-Syu')   { Syu }
elsif ($opt eq '-Syuu')  { Syuu }
elsif ($opt eq '-Ss')    { Ss }
elsif ($opt eq '-Q')     { Q }
elsif ($opt eq '-Qi')    { Qi }
elsif ($opt eq '-Si')    { Si }
elsif ($opt eq '-Ql')    { Ql }
elsif ($opt eq '-Qo')    { Qo }
elsif ($opt eq '-Qc')    { Qc }
elsif ($opt eq '-Qu')    { Qu }
elsif ($opt eq '-Sc')    { Sc }
elsif ($opt eq '-Scc')   { Sc }
#elsif ($opt eq '-Qtdq')  { Qtdq }
#elsif ($opt eq '-c')     { Qtdq }
elsif ($opt eq '-De')    { De }
elsif ($opt eq '-D')     { De }
elsif ($opt eq '-Sw')    { Sw }
else                     { print "unknown argument \n" }
