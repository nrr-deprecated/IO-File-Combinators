use 5.010;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'IO::File::Combinators',
    license             => 'perl',
    dist_author         => q{Nathaniel Reindl <nrr@corvidae.org>},
    dist_version_from   => 'lib/IO/File/Combinators.pm',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'perl' => 5.010,
        'strictures' => 0,
        'Exporter::Simple' => 0,
        'Try::Tiny' => 0,
    },
    add_to_cleanup      => [ 'IO-File-Combinators-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
