package Fizz::Buzz;

use warnings;
use strict;
use Carp;

use version; our $VERSION = qv('0.0.3');


# Module implementation here
sub new {
    my ($class, %args) = (@_);
    my $thys = bless \%args, $class;

    $thys->set_args(%args);

    return $thys;
}

sub exec {
    my ($thys, %args) = (@_);

    $thys->set_args(%args);

    my $start = $thys->get("start") || 1;
    my $end   = $thys->get("end")   || 100;
    my $fizz  = $thys->get("fizz")  || "fizz";
    my $buzz  = $thys->get("buzz")  || "buzz";
    my $sep   = $thys->get("sep")   || "\n";
    my $ret   = $thys->get("ret")   || "print";

    my @fizzbuzz = ();

    my $counter;

    for($counter = $start; $counter <= $end; ++$counter){
        my $buf = '';

        if(!($counter % 3)) {
            $buf .= $fizz;
        }

        if(!($counter % 5)) {
            $buf .= $buzz;
        }

        if(!(length $buf)) {
            $buf .= $counter;
        }

        push @fizzbuzz, $buf;
    }

    if($ret eq "print") {
        printf "%s\n", join $sep, @fizzbuzz;
    }

    if($ret eq "array") {
        return @fizzbuzz;
    }

    if($ret eq "string") {
        return join $sep, @fizzbuzz;
    }
}

sub set {
    my ($thys, $key, $value) = (@_);

    $thys->{$key} = $value;
}

sub get {
    my ($thys, $key) = (@_);

    return $thys->{$key};
}

sub set_args {
    my ($thys, %args) = (@_);

    foreach my $key (keys %args) {
        $thys->{$key} = $args{$key};
    }
}

1; # Magic true value required at end of module
__END__

=head1 NAME

Fizz::Buzz - Your fully customizable FizzBuzz solver.


=head1 VERSION

This document describes Fizz::Buzz version 0.0.1


=head1 SYNOPSIS

    use Fizz::Buzz;

    Fizz::Buzz->exec;
  
  
=head1 AUTHOR

Kotone Itaya  C<< <t11080hi [at] sfc.keio.ac.jp> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2013, Kotone Itaya C<< <t11080hi [at] sfc.keio.ac.jp> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
