# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install;

name 'Foo';
all_from 'lib/Foo.pm';

requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::Runtime' => '5.80002';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
