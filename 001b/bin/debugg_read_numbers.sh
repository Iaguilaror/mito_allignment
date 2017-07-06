#!/bin/bash

SAMPLE=$(grep "^TEST_SAMPLE" bin/testing_mk.sh | cut -d"\"" -f2)

echo "[DEBUGGING]counts for $SAMPLE"
R1_LINES=$(zcat results/R1_formito_$SAMPLE.paired.fastq.gz | wc -l)
R2_LINES=$(zcat results/R2_formito_$SAMPLE.paired.fastq.gz | wc -l)
echo "R1.fastq.gz paired lines= $(( R1_LINES / 4 ))"
echo "R2.fastq.gz paired lines= $(( R2_LINES / 4 ))"
