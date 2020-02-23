# t/10-synopsis.t: tests from the Synopsis and POD

use strict;
use warnings;
use Test::More;
use Text::LineNumber;

my $text = "foo\nHello World\r\nbar\rbaz";
my $tln = Text::LineNumber->new($text);
my $world_lnr = $tln->off2lnr(10);	# = 2
cmp_ok($world_lnr, '==', 2);

my @world     = $tln->off2lnr(10);	# = (2, 7)
is_deeply(\@world, [2, 7]);

my $l3o       = $tln->lnr2off(3);	# = 17
cmp_ok($l3o, '==', 17);

my $line3     = substr $text, $l3o, $tln->lnr2off(4)-$l3o; # = "bar\r"
is($line3, "bar\r");

done_testing;
