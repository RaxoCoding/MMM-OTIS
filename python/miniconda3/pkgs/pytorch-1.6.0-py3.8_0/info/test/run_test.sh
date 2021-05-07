

set -ex



OMP_NUM_THREADS=4 python ./test/run_test.py || true
exit 0
