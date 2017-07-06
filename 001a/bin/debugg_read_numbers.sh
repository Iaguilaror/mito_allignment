#!/bin/bash

SAMPLE=$(grep "^TEST_SAMPLE" bin/testing_mk.sh | cut -d"\"" -f2)

echo "[DEBUGGING]counts for $SAMPLE"
CHRM_lines=$(wc -l results/$SAMPLE.unpaired.chrM.fastq | cut -d" " -f1)
UNMAPPED_lines=$(wc -l results/$SAMPLE.unpaired.unmapped.fastq | cut -d" " -f1)
echo "chrM.fastq.gz unpaired lines= $(( CHRM_lines / 4 ))"
echo "unmapped.fastq.gz unpaired lines= $(( UNMAPPED_lines / 4 ))"
