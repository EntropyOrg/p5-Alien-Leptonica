
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Alien::Base::ModuleBuild;

my %module_build_args = (
  "alien_build_commands" => [
    "%pconfigure --prefix=%s --disable-programs",
    "make"
  ],
  "alien_name" => "Leptonica",
  "alien_repository" => {
    "host" => "",
    "location" => "inc",
    "pattern" => "^leptonica-([\\d\\.]+)-min\\.tar\\.gz\$",
    "protocol" => "local"
  },
  "build_requires" => {},
  "configure_requires" => {
    "Alien::Base" => "0.002",
    "File::ShareDir" => "1.03"
  },
  "dist_abstract" => "Alien package for the Leptonica image processing library",
  "dist_author" => [
    "Zakariyya Mughal <zmughal\@cpan.org>"
  ],
  "dist_name" => "Alien-Leptonica",
  "dist_version" => "0.002",
  "license" => "perl",
  "module_name" => "Alien::Leptonica",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Alien::Base" => "0.002",
    "File::ShareDir" => "1.03",
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Test::More" => 0
  }
);


my %fallback_build_requires = (
  "Test::More" => 0
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Alien::Base::ModuleBuild->new(%module_build_args);

$build->create_build_script;
