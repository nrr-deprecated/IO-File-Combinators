package IO::File::Combinators;
use base qw[ Exporter::Simple ];

use 5.010;
use strictures;

use IO::File;
use Try::Tiny;

=head1 NAME

IO::File::Combinators - The great new IO::File::Combinators!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use IO::File::Combinators;

    my $foo = IO::File::Combinators->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=cut

sub with_open_filehandle
{
        my ($fh, $callback) = @_;

        try {
                $callback->($fh);
        }
        finally {
                $fh->close;
        };
}

sub with_file_reader
{
        my ($filename, $callback) = @_;

        with_open_filehandle(IO::File->new($filename, 'r') => sub {
                my ($fh) = @_;

                while (my $line = $fh->getline) {
                        $callback->($line);
                }
        });
}

sub with_file_writer
{
        my ($filename, $callback) = @_;

        with_open_filehandle(IO::File->new($filename, 'w') => sub {
                my ($fh) = @_;

                $callback->($fh);
        });
}

=head1 AUTHOR

Nathaniel Reindl, C<< <nrr at corvidae.org> >>

=head1 BUGS

Bugs? Hopefully, none, but if there are any, send me mail.

This distribution needs more meaningful tests.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc IO::File::Combinators


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=IO-File-Combinators>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/IO-File-Combinators>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/IO-File-Combinators>

=item * Search CPAN

L<http://search.cpan.org/dist/IO-File-Combinators/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Nathaniel Reindl.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of IO::File::Combinators
