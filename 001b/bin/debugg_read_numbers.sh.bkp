#!/bin/bash

SAMPLE=$(grep "^TEST_SAMPLE" bin/testing_mk.sh | cut -d"\"" -f2)

echo "[DEBUGGING]counts for $SAMPLE"
CHRM_lines=$(samtools view -c results/$SAMPLE.paired.chrM.bam)
UNMAPPED_lines=$(samtools view -c results/$SAMPLE.paired.unmapped.bam)
echo "chrm.bam= $CHRM_lines"
echo "chrm.bam unpaired lines= $(( CHRM_lines / 2 ))"
echo "unmapped.bam= $UNMAPPED_lines"
echo "unmapped.bam unpaired lines= $(( UNMAPPED_lines / 2 ))"
R1_lines=$(zcat results/R1_formito_$SAMPLE.paired.fastq.gz | wc -l)
R2_lines=$(zcat results/R2_formito_$SAMPLE.paired.fastq.gz | wc -l)
echo "R1_fastq.gz= $(( R1_lines / 4 ))"
echo "R2_fastq.gz= $(( R2_lines / 4 ))"