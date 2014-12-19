package chorebox::io;
use strict;

my @infiles = ("/dev/stdin","/proc/self/fd/0");
my @outfiles = ("/dev/stdout","/proc/self/fd/1");
my @errfiles = ("/dev/stderr","/proc/self/fd/2");

sub ins {
  return &firstof(@infiles);
}

sub outs {
  return &firstof(@outfiles);
}

sub errs {
  return &firstof(@errfiles);
}

sub firstof {
  my $lc_a;
  foreach $lc_a (@_)
  {
    if ( -e $lc_a ) { return $lc_a; }
  }
  return ( 1 > 2 );
}


1;
