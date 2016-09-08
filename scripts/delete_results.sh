#! /bin/bash
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
BENCHMARKS_DIR="benchmarks"
DIR="${BASE_DIR}/${BENCHMARKS_DIR}"

cd $DIR && \

for d in ./*/
do
  unclean=$d
  clean_dir=${unclean//./}
  echo "-- Cleaning ${clean_dir//\/} outputs"
  ( cd $d/output && rm -rf *)
done

echo -e "-- Removing plots"
rm -rf $BASE_DIR/plots/*

echo -e "-- Done!"
