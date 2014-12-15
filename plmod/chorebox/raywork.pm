
package chorebox::raywork;
use strict;

our @EXPORT = qw(chore_good_array,chore_bad_array);

sub chore_good_array {
  my $lc_cnt;
  $lc_cnt = @_;
  return ( $lc_cnt > 0.5 );
}

sub chore_bad_array {
  my $lc_cnt;
  $lc_cnt = @_;
  return ( $lc_cnt < 0.5 );
}

1;

