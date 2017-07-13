# Module for making new mitocondrial alignments

This document explains the stages for SNAP remapping of mitochondrial regions against NC_012920.1 mitochondrial reference genome.
Process starts from previously SNAP alignments done using whole genome Homo_sapiens_assembly38 as reference, from the broad institute bundle.
This module can process any .bam file that has the "chrM" contig defined in the header, as long as the file contains R1 or R2 in filename, and "paired" or "unpaired" adjective. 

## 001a - For extracting *.unpaired.fastq.gz, from *.unpaired.bam:
	1. extraction of unpaired reads mapped at "chrM"
	2. extraction of unpaired unmapped reads
	3. concatenation of 1 & 2 and compression to *.unpaired.fastq.gz

## 001b - For extracting *.unpaired.fastq.gz, from *.unpaired.bam:
	1. extraction of paired reads mapped at "chrM"
	2. extraction of paired unmapped reads, by concatenating:
		- reads unmapped, with an unmapped mate read
		- reads mapped, with an unampped mate read
		- reads unmapped, with a mapped mate read
	3. concatenation of 1 & 2 and compression to *.paired.fastq.gz

## 002/ - Read alignment using SNAP against NC_012920.1
Modification from SNAP allignment module developed at inmegen. Makes new alignments using mithocondrial genome NC_012920.1, and using the fastq.gz files generated in 001a and 001b.
[snap]: http://snap.cs.berkeley.edu/
[man snap]: http://snap.cs.berkeley.edu/downloads/snap-1.0beta-manual.pdf
[snap quickstart]: http://snap.cs.berkeley.edu/downloads/snap-1.0beta-quickstart.pdf

1. The SNAP index was created with default parameters, since NC_012920.1 genome is small. Tweaks to index generation would have a minimal gain in time optimization of future alignments.
2. Regarding the original development of /100g/analysis/002b/, this modification of the mkfile has the following line:
_sed "s#ref|NC_012920.1|_Homo_sapiens_mitochondrion,_complete_genome#chrM#g"_
Said line changes the complex chromosome name asigned by SNAP, to a "chrM" format, which is more widely used.
Example from paired:
```
results/%.paired.bam:D:	data/paired/%_R1.paired.fastq.gz	data/paired/%_R2.paired.fastq.gz
	mkdir -p dirname $target
	snap-aligner \
		paired \
		$SNAP_REFERENCEDIR \
		$prereq \
		$SNAP_OPTS \
		-o -sam - \
	| sed "s#ref|NC_012920.1|_Homo_sapiens_mitochondrion,_complete_genome#chrM#g" \
	| samtools view -S -b -o $target".build" - \
	&& mv $target".build" $target
```
