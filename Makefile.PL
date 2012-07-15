use PDL::Core::Dev;
use ExtUtils::MakeMaker;
use Data::Dumper;
PDL::Core::Dev->import();
   
$package = ["iir.pd",Iir,PDL::DSP::Iir];
%hash = pdlpp_stdargs($package);

$hash{VERSION_FROM} = 'iir.pd';
$hash{ABSTRACT_FROM} = 'iir.pd';
$hash{LICENSE} = 'perl';
$hash{AUTHOR} = 'John Lapeyre <jlapeyre@cpan.org>';

$hash{PREREQ_PM}  = {
    "Exporter" => 0,
    "PDL" => 0
};



#$hash{INST_LIBDIR}

sub MY::postamble {pdlpp_postamble($package)};

WriteMakefile( %hash );

if(exists $ARGV[0] && $ARGV[0] eq 'README.pod')
{
  open MOD, 'Iir.pm' or die "Couldn't open main module";
  open README, '>README.pod' or die "Couldn't open README.pod";

  while (<MOD>)
  {
    if (/^=/../^=cut/)
    { print README; }
  }
}
