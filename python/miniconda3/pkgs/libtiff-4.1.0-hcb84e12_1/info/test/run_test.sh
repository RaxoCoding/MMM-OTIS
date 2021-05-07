

set -ex



test -f ${PREFIX}/lib/libtiff.a
test -f ${PREFIX}/lib/libtiffxx.a
test -f ${PREFIX}/lib/libtiff${SHLIB_EXT}
test -f ${PREFIX}/lib/libtiffxx${SHLIB_EXT}
exit 0
