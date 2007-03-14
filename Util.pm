package Taint::Util;
use base qw(Exporter);
use XSLoader ();

$VERSION   = '0.02';
@EXPORT    = qw(tainted taint untaint);
@EXPORT_OK = @EXPORT;

XSLoader::load __PACKAGE__, $VERSION;

1;

__END__

=head1 NAME

Taint::Util - Test for and flip the taint flag without regex matches or C<eval>

=head1 SYNOPSIS

    use Taint::Util;

    my $sv = "pis";

    # $sv now tainted under taint mode
    taint $sv;

    # Untaint $sv again
    untaint $sv if tainted $sv;

=head1 DESCRIPTION

Wraps perl's internal routines for checking and setting the taint flag
and thus does not rely on regular expressions for untainting or odd
tricks involving C<eval> and C<kill> for checking whether data is
tainted, instead it checks and flips a flag on the scalar in-place.

Provides three functions, C<tainted> which returns a boolean
indicating whether a given variable is tainted and C<taint> and
C<untaint> which always return false and are no-ops if tainting is
disabled.

=head1 EXPORTS

Exports C<tainted>, C<taint> and C<untaint> by default. Individual
functions can be exported by specifying them in the C<use> list, to
export none use C<()>.

=head1 AUTHOR

E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason <avar@cpan.org>

=head1 LICENSE

Copyright 2007 E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
