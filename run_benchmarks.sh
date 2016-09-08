#!/bin/bash
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="${BASE_DIR}/scripts"

TOTAL=$1
CONCURRENT=$2
BENCHMARK_NAME=$3

# TODO: Make it more expressive (use -n -c and --<benchmark_name>) and be able to run them all at once.
# Check further into `getopts`.
TOTAL=$TOTAL CONCURRENT=$CONCURRENT bash $SCRIPTS_DIR/run_single_benchmark.sh $BENCHMARK_NAME
