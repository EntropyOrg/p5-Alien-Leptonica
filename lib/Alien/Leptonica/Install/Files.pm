package Alien::Leptonica::Install::Files;

# allows other packages to use ExtUtils::Depends like so:
#   use ExtUtils::Depends;
#   my $p = new ExtUtils::Depends MyMod, Alien::Leptonica;
# and their code will have all Leptonica available at C level

use strict;
use warnings;

use Alien::Leptonica qw(Inline);
sub deps { () }
