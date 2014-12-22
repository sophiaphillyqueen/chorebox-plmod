# chorebox::comline --- an event-based module for handling
#   an option-only command-line in PERL.

package chorebox::comline;
use strict;
use chorebox::raywork;

sub new {
  my $lc_a;
  my $lc_b;
  
  $lc_a = $_[0];
  $lc_b = {
    "methoda" => { },
    "arglf" => [ ]
  };
  bless $lc_b, $lc_a;
  return $lc_b;
}

# optadd --- adds an option-handler to the object.
#  ARG 1: The name of the option
#  ARG 2: The code-handler for the option
sub optadd {
  $_[0]->{"methoda"}->{$_[1]} = $_[2];
}


# rgleft --- returns 'true' if the object has remaining
#   arguments - and 'false' otherwise.
sub rgleft {
  my $lc_ryref;
  my @lc_rayo;
  
  $lc_ryref = $_[0]->{"arglf"};
  @lc_rayo = @$lc_ryref;
  return &chorebox::raywork::good(@lc_rayo);
}


# rgout --- returns 'false' if the object has remaining
#   arguments - and 'true' otherwise.
sub rgout {
  my $lc_ryref;
  my @lc_rayo;
  
  $lc_ryref = $_[0]->{"arglf"};
  @lc_rayo = @$lc_ryref;
  return &chorebox::raywork::bad(@lc_rayo);
}

# rtvrg --- Retrieves the next argument from the array
sub rtvrg {
  my @lc_rayo;
  my $lc_objo;
  my $lc_ryrf;
  my @lc_ryac;
  my $lc_nexo;
  
  @lc_rayo = @_;
  if ( &chorebox::raywork::bad(@lc_rayo) ) { return ""; }
  $lc_objo = shift(@lc_rayo);
  $lc_ryrf = $lc_objo->{"arglf"};
  @lc_ryac = @$lc_ryrf;
  if ( &chorebox::raywork::bad(@lc_ryac) ) { return ""; }
  $lc_nexo = shift(@lc_ryac);
  $lc_objo->{"arglf"} = [@lc_ryac];
  return $lc_nexo;
}

# arun --- Goes through the provided arguments with the object.
sub arun {
  my @lc_argos;
  my $lc_objo;
  my $lc_opnom;
  my $lc_opact;
  
  if ( &chorebox::raywork::bad(@_) ) { return; }
  @lc_argos = @_;
  $lc_objo = shift(@lc_argos);
  $lc_objo->{"arglf"} = [@lc_argos];
  while ( $lc_objo->rgleft )
  {
    $lc_opnom = $lc_objo->rtvrg;
    $lc_opact = $lc_objo->{"methoda"}->{$lc_opnom};
    if ( ref($lc_opact) ne "CODE" )
    {
      die "\nFAILED TO FIND OPTION HANDLER: " . $lc_opnom . ":\n\n";
    }
    &$lc_opact($lc_objo);
  }
}



1;
