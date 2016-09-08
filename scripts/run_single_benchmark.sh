#!/bin/bash

# No touchy, just looky.
BENCHMARK_NAME=$1
DATE=$(date +"%d%m%Y_%H%M%S")
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
BENCHMARKS_DIR="${BASE_DIR}/benchmarks"
DIR="${BENCHMARKS_DIR}/${BENCHMARK_NAME}"

if [ ! -d "$DIR" ]; then
  echo "There's no benchmark with that name"
  echo "Current benchmarks are:"

  cd ${BENCHMARKS_DIR} && \

  for d in ./*/
  do
    unclean=$d
    clean_dir=${unclean//./}
    echo "- ${clean_dir//\/}"
  done
  exit 1
fi

### HAVE FUN!

# STEP1: Benchmark
echo -e "-- Running $BENCHMARK_NAME benchmark"
bash $DIR/benchmark.sh $DATE

# STEP2: Plot
echo -e "-- Plotting $BENCHMARK_NAME results"
gnuplot -e "filename='$DIR/output/results_${DATE}.tsv'" -e "imagename='${BASE_DIR}/plots/$BENCHMARK_NAME_${DATE}.png'" -e "title='Benchmark for "${BENCHMARK_NAME}"  (Total: ${TOTAL} | Concurrent: ${CONCURRENT})'" $DIR/plot.p

echo -e "-- Finished $BENCHMARK_NAME Benchmark!"
