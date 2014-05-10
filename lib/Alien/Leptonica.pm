package Alien::Leptonica;
$Alien::Leptonica::VERSION = '0.006';
use strict;
use warnings;

use parent 'Alien::Base';

sub Inline {
	return unless $_[0] eq 'C'; # Inline's error message is good
	my $self = __PACKAGE__->new;
	+{
		LIBS => $self->libs,
		INC => $self->cflags,
		AUTO_INCLUDE => '#include "allheaders.h"',
	};
}

1;

=pod

=encoding UTF-8

=head1 NAME

Alien::Leptonica - Alien package for the Leptonica image processing library

=head1 VERSION

version 0.006

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<Leptonica|http://www.leptonica.com/>, L<Image::Leptonica>

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__
# ABSTRACT: Alien package for the Leptonica image processing library

