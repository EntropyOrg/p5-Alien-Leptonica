use Test::More;

use_ok('Alien::Leptonica');

my $u = Alien::Leptonica->new;

like( $u->libs, qr/leptonica/ );

done_testing;
