#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'IO::File::Combinators' ) || print "Bail out!\n";
}

diag( "Testing IO::File::Combinators $IO::File::Combinators::VERSION, Perl $], $^X" );
