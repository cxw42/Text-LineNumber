# t/15-other.t: other tests

use strict;
use warnings;
use Test::More;
use Text::LineNumber;

{ # single line, no newline
  my $text = "123456789abcdef";
  my $tln = Text::LineNumber->new($text);
  my $world_lnr = $tln->off2lnr(10);
  cmp_ok($world_lnr, '==', 1);

  my @world = $tln->off2lnr(10);
  is_deeply(\@world, [1, 11]);

  my $l3o = $tln->lnr2off(1);
  cmp_ok($l3o, '==', 0);
}

{ # Single line with trailing newline
  my $text = "123456789abcdef\n";
  my $tln = Text::LineNumber->new($text);
  my $world_lnr = $tln->off2lnr(10);
  cmp_ok($world_lnr, '==', 1);

  my @world = $tln->off2lnr(10);
  is_deeply(\@world, [1, 11]);

  my $l3o = $tln->lnr2off(1);
  cmp_ok($l3o, '==', 0);
}

{ # Single line with leading newline, no trailing newline
  my $text = "\n123456789abcdef";
  my $tln = Text::LineNumber->new($text);
  my $world_lnr = $tln->off2lnr(10);
  cmp_ok($world_lnr, '==', 1);

  my @world = $tln->off2lnr(10);
  is_deeply(\@world, [2, 10]);

  my $l3o = $tln->lnr2off(1);
  cmp_ok($l3o, '==', 0);

  my $l2o = $tln->lnr2off(2);
  comp_ok($l2o, '==', 1);
}

done_testing;
