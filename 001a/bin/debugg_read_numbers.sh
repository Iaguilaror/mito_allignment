#!/bin/bash

SAMPLE=$(grep "^TEST_SAMPLE" bin/testing_mk.sh | cut -d"\"" -f2)

echo "[DEBUGGING]counts for $SAMPLE"
FASTQ_lines=$(zcat results/formito_$SAMPLE.unpaired.fastq.gz | wc -l)
echo "sample.fastq.gz unpaired lines= $(( FASTQ_lines / 4 ))"

