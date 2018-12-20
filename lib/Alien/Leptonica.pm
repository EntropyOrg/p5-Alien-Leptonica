package Alien::Leptonica;

use strict;
use warnings;

use parent qw(Alien::Base);

use Path::Tiny;
use ExtUtils::PkgConfig;

sub inline_auto_include {
	return  [ 'allheaders.h' ];
}

sub libs {
	my ($class) = @_;

	if( $^O eq 'darwin' || $^O eq 'MSWin32' ) {
		my $pc_dir = $class->pkg_config_path;
		my ($libs_private) = path($pc_dir)->child('lept.pc')->slurp_utf8
			=~ /Libs.private: (.*)/;
		return join " ", Alien::Base::libs(@_), $libs_private;
	}

	return Alien::Base::libs(@_);
}


sub pkg_config_path {
	my ($class) = @_;
	if( $class->install_type eq 'share' ) {
		return File::Spec->catfile( File::Spec->rel2abs($class->dist_dir), qw(lib pkgconfig) );
	} else {
		return ExtUtils::PkgConfig->variable('lept', 'pcfiledir');
	}
}

sub Inline {
	my ($self, $lang) = @_;

	if( $lang =~ /^C(PP)?$/ ) {
		my $params = Alien::Base::Inline(@_);

		# Use static linking instead of dynamic linking. This works
		# better on some platforms. On macOS, to use dynamic linking,
		# the `install_name` of the library must be set, but since this
		# is the final path by default, linking to the `.dylib` under
		# `blib/` at test time does not work without using `@rpath`.
		if( $^O eq 'darwin' and $self->install_type eq 'share' ) {
			$params->{MYEXTLIB} .= ' ' .
				join( " ",
					map { File::Spec->catfile(
						File::Spec->rel2abs(Alien::Leptonica->dist_dir),
						'lib',  $_ ) }
					qw(liblept.a)
				);
			$params->{LIBS} =~ s/-llept//g;
		}
		return $params;
	}
}



1;

__END__
# ABSTRACT: Alien package for the Leptonica image processing library

=pod

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<Leptonica|http://www.leptonica.com/>, L<Image::Leptonica>

=cut
