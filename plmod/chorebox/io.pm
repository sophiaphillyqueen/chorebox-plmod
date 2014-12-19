package chorebox::io;
use strict;

my @outfiles = ("/dev/stdout","/proc/self/fd/1");
my @errfiles = ("/dev/stderr","/proc/self/fd/2");

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
    if ( -f $lc_a ) { return $lc_a; }
  }
  return ( 1 > 2 );
}


1;
