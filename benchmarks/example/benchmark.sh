#!/bin/bash
# Always use these in your benchmarks.
DATE=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Do whatever.
TIMEOUT=3

ab \
  -k -r \
  -n $TOTAL \
  -c $CONCURRENT \
  -s $TIMEOUT \
  -g $DIR/output/results_$DATE.tsv \
  -e $DIR/output/results_$DATE.csv \
  "http://example.com" \
  > $DIR/output/log_$DATE.log
