#!/bin/bash
mkdir -p tmp/

SAMPLE=$(grep "^TEST_SAMPLE" bin/testing_mk.sh | cut -d"\"" -f2)

samtools view results/$SAMPLE.paired.chrM.bam > tmp/$SAMPLE.chrM.sam 
samtools view results/$SAMPLE.paired.unmapped.bam > tmp/$SAMPLE.unmapped.sam

MAX_NUMBER_OF_REPEATED_LINES=$(cat tmp/*.sam | cut -f1 | sort | uniq -c | tr -s " " | cut -d" " -f2 | sort -u | sort -nr)

if [ $MAX_NUMBER_OF_REPEATED_LINES -eq 2 ]; then
	echo "[PASS] process did NOT GENERATE DUPLICATED fastq.gz READS"
else
	echo "[WARNING] process GENERATED DUPLICATED fastq.gz READS"
fi