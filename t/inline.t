use Test::More;

use_ok('Alien::Leptonica');

SKIP: {
	eval { require Inline };

	skip "Inline not installed" if $@;

	Inline->import( with => qw(Alien::Leptonica) );
	Inline->bind( C => q{ extern char * getLeptonicaVersion (  ); },
		ENABLE => AUTOWRAP => );

	like( getLeptonicaVersion(), qr/^leptonica-/);
}


done_testing;
