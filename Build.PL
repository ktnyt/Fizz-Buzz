use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Fizz::Buzz',
    license             => 'artistic2',
    dist_author         => 'Kotone Itaya <t11080hi [at] sfc.keio.ac.jp>',
    dist_version_from   => 'lib/Fizz/Buzz.pm',
    requires => {
        'Test::More' => 0,
        'version'    => 0,
    },
    add_to_cleanup      => [ 'Fizz-Buzz-*' ],
);

$builder->create_build_script();
