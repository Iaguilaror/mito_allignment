#!/bin/bash
mkdir -p tmp/

SAMPLE=$(grep "^TEST_SAMPLE" bin/testing_mk.sh | cut -d"\"" -f2)

MAX_NUMBER_OF_REPEATED_LINES=$(zgrep -e "^@" results/formito_$SAMPLE.unpaired.fastq.gz | sort | uniq -c | tr -s " " | cut -d" " -f2 | sort -u | sort -nr | head -n1)

echo "[DEBUGGING] max number of repeated SEQ_ids is $MAX_NUMBER_OF_REPEATED_LINES. Should not be different than 1, since we are dealing with unpaired reads"

if [ $MAX_NUMBER_OF_REPEATED_LINES -eq 1 ]; then
	echo "[PASS] process did NOT GENERATE DUPLICATED fastq.gz READS"
else
	echo "[WARNING] process GENERATED DUPLICATED fastq.gz READS"
fi