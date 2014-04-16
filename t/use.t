use Test::More;

use_ok('Alien::Leptonica');

my $u = Alien::Leptonica->new;

print "$u->libs\n$u->cflags\n";

like( $u->libs, qr/lept/ );

done_testing;
