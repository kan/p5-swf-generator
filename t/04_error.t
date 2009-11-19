use strict;
use Test::More;
use Test::Exception;

use Path::Class;
use SWF::Generater;

my $swfgen = SWF::Generater->new();

throws_ok { $swfgen->process('t/err.xml'); } 'Template::Exception', 'no template error';

throws_ok { $swfgen->process('t/error.xml'); } qr/parser error : Start tag expected/, 'invalid template error';

done_testing;
