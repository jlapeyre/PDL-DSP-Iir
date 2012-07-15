#!perl
use Test::More;

use strict;
use warnings;
use Test::More;

BEGIN {
    plan tests => 1;
}

use PDL::LiteF;
use PDL::NiceSlice;
use PDL::DSP::Iir qw( moving_average );
use PDL::Constants qw( PI );
use PDL::IO::Misc;

my $x = sequence(1000);
my $x1 = sin(2*PI*$x/$x->nelem);
my $x2 = $x1 + 0.1 * sin(20*PI*$x/$x->nelem);
my $hw = 20;
my $y = $x2->moving_average($hw,5);
my $diff = $y-$x1;

ok ( abs($diff)->sum  < 20);

#wcols $x2 , 'x2.dat';
#wcols $y , 'y.dat';
#wcols $y-$x1 , 'ydiff.dat';
#print abs($diff)->sum, "\n";



