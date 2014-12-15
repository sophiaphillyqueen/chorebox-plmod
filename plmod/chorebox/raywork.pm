
package chorebox::raywork;
use strict;

sub good {
  my $lc_cnt;
  $lc_cnt = @_;
  return ( $lc_cnt > 0.5 );
}

sub bad {
  my $lc_cnt;
  $lc_cnt = @_;
  return ( $lc_cnt < 0.5 );
}

1;

