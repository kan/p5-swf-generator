use strict;
use Test::More;

use Path::Class;
use SWF::Generater;

my $swfgen = SWF::Generater->new(swfmill_option => [qw(-e cp932)]);

my $swf = $swfgen->process('t/test3.xml');

my $swf_pref = file('t/test3.swf')->slurp;

is $swf, $swf_pref;

done_testing;
