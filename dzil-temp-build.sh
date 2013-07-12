#!/bin/sh

CURDIR=`dirname "$0"`
cd "$CURDIR"
PERL5LIB=~/repo/fork/p5-dist-zilla-plugin-alien/lib:$PERL5LIB; dzil build
