package Alien::Leptonica::Install::Files;
$Alien::Leptonica::Install::Files::VERSION = '0.006';
# allows other packages to use ExtUtils::Depends like so:
#   use ExtUtils::Depends;
#   my $p = new ExtUtils::Depends MyMod, Alien::Leptonica;
# and their code will have all Leptonica available at C level

use strict;
use warnings;

use Alien::Leptonica qw(Inline);
sub deps { () }

__END__

=pod

=encoding UTF-8

=head1 NAME

Alien::Leptonica::Install::Files

=head1 VERSION

version 0.006

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
