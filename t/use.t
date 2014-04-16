use Test::More;

use_ok('Alien::Leptonica');

my $u = Alien::Leptonica->new;

use DDP; p $u->libs;
use DDP; p $u->cflags;

like( $u->libs, qr/lept/ );

done_testing;
