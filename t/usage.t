#!/usr/bin/perl -T
use strict;

use Test::More tests => 7;
use Taint::Util;

# untainted
my $s = 420;
ok(!tainted($s));

# taint
taint($s); ok(tainted($s));

# untaint
untaint($s); ok(!tainted($s));

# taint again
taint($s); ok(tainted($s));

# taint/untaint never return true
ok(!untaint($s));
ok(!taint($s));
ok(!untaint($s));



