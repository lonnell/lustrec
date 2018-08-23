#!/usr/bin/env tclsh

set top [pwd] 
set name lustrec
set version 1.6.0 
set platform amd64

puts "making directories..."
# file mkdir $top/_build
file mkdir $top/_install

puts "building system..."
eval exec autoconf >>& /dev/tty
eval exec ./configure >>& /dev/tty
eval exec make >>& /dev/tty
eval exec make DESTDIR=$top/_install install >>& /dev/tty

puts "creating tarball..."
set tarball "$name-$version-$platform.tar.gz"
eval exec tar cfz $top/$tarball -C $top/_install/usr/local . >>& /dev/tty

puts "done."
