use inc::Module::Install;
name 'SWF-Generater';
all_from 'lib/SWF/Generater.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
