use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use t::TestSetting;
    use_ok( 'OneEncoding::CORE', $ENCODING );
}

my $file = 't/temp.txt';

system( "echo �\���\�� > $file" );

open my $txt, $file or die;

my $count;
while ( <$txt> )
{
	$count++ if /�\���\��/;
}

is( $count, 1, "echo" );

close $txt;

unlink $file;