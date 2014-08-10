use Test::More;
use Module::Load;
use File::Basename;
use File::Spec;

use_ok('Alien::Leptonica');

my $built_allheaders = '_alien/leptonica-1.71/src/allheaders.h';
my $built_dir = File::Spec->rel2abs(dirname($built_allheaders));
my @inc_built = -f $built_allheaders ? (INC => "-I$built_dir") : ();

SKIP: {
	eval { load 'Inline::C' } or do {
		my $error = $@;
		skip "Inline::C not installed", 1 if $error;
	};

	Inline->import( with => qw(Alien::Leptonica) );
	Inline->bind( C => q{ extern char * getLeptonicaVersion (  ); },
		ENABLE => AUTOWRAP => @inc_built);

	like( getLeptonicaVersion(), qr/^leptonica-/);
}

done_testing;
