
package chorebox::rg;
use strict;
use chorebox::raywork;


sub wrp {
  my $lc_src;
  my $lc_dst;
  my $lc_chr;
  
  $lc_dst = "\'";
  $lc_src = $_[0];
  while ( $lc_src ne "" )
  {
    $lc_chr = chop($lc_src);
    if ( $lc_chr eq "\'" ) { $lc_chr = "\'\"\'\"\'"; }
    $lc_dst = $lc_chr . $lc_dst;
  }
  $lc_dst = "\'" . $lc_dst;
  return $lc_dst;
}

sub apn {
  my @lc_itlist;
  my $lc_comnd;
  my $lc_argos;
  
  @lc_itlist = @_;
  if ( &chorebox::raywork::bad(@lc_itlist) ) { return; }
  
  $lc_comnd = shift(@lc_itlist);
  while ( &chorebox::raywork::good(@lc_itlist) )
  {
    $lc_comnd .= " " . &wrp(shift(@lc_itlist));
  }
  
  $_[0] = $lc_comnd;
}



1;

