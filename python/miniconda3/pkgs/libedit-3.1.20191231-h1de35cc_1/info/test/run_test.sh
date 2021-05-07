

set -ex



test -f $PREFIX/lib/libedit.dylib
test ! -f $PREFIX/lib/libedit.a
exit 0
