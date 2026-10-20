#!/bin/sh
# Regenerate the autotools build system (configure, Makefile.in, ...).
set -e
cd "$(dirname "$0")"
autoreconf -fi
echo "Now run ./configure && make"
