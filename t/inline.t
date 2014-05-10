use Test::More;

use_ok('Alien::Leptonica');

SKIP: {
	eval { require 'Inline' } or do {
		my $error = $@;
		skip "Inline not installed", 1 if $error;
	};

	skip "Inline not installed", 1 if $@;

	Inline->import( with => qw(Alien::Leptonica) );
	Inline->bind( C => q{ extern char * getLeptonicaVersion (  ); },
		ENABLE => AUTOWRAP => );

	like( getLeptonicaVersion(), qr/^leptonica-/);
}


done_testing;
