#!/bin/bash

SAMPLE=$(grep "^TEST_SAMPLE" bin/testing_mk.sh | cut -d"\"" -f2)

MAX_NUMBER_OF_REPEATED_LINES=$(zgrep -e "^@" results/R*_formito_$SAMPLE.paired.fastq.gz | cut -d":" -f2- | cut -d"/" -f1 | sort | uniq -c | tr -s " " | cut -d" " -f2 | sort -u | sort -nr | head -n1)

echo "[DEBUGGING] max number of repeated SEQ_ids is $MAX_NUMBER_OF_REPEATED_LINES. Should not be different than 2, since we are dealing with paired reads"

if [ $MAX_NUMBER_OF_REPEATED_LINES -eq 2 ]; then
	echo "[PASS] process did NOT GENERATE DUPLICATED fastq.gz READS"
else
	echo "[WARNING] process GENERATED DUPLICATED fastq.gz READS"
fi
