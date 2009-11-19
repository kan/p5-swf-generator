package SWF::Generater;
use strict;
use warnings;
our $VERSION = '0.01';

use Template;
use IPC::Run qw/run/;

sub new {
    my ( $class, %opt ) = @_;

    my $tmpl = Template->new;

    return bless {
        _template       => $tmpl,
        _swfmill_option => $opt{swfmill_option} || [],
    }, $class;
}

sub process {
    my ($self, $input, $vars) = @_;

    $self->{_template}->process($input, $vars, \my $xml) or die $self->{_template}->error();

    my $err;
    run ['swfmill', @{$self->{_swfmill_option}}, qw/xml2swf stdin/], \$xml, \my $swf, \$err or die $err;

    return $swf;
}

1;
__END__

=head1 NAME

SWF::Generater -

=head1 SYNOPSIS

  use SWF::Generater;

=head1 DESCRIPTION

SWF::Generater is

=head1 AUTHOR

Default Name E<lt>default {at} example.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
