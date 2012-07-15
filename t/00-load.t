#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'PDL::DSP::Iir' ) || print "Bail out!\n";
}

diag( "Testing PDL::DSP::Iir $PDL::DSP::Iir::VERSION, Perl $], $^X" );
