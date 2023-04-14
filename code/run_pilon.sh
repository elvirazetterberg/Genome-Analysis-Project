#!/bin/bash

# move to pilon folder to output here
cd /home/elze3417/genome_analysis/results/pilon

contigs="/home/elze3417/genome_analysis/results/canu/efaecium.contigs.fasta"
reads="/home/elze3417/genome_analysis/data/my_genomics_data/Illumina/*"
bwamapsam="efaecium_illu_pb_contigs.sam"
bwamapbam="efaecium_illu_pb_contigs.bam"
bwasortbam="efaecium_illu_pb_contigs.sorted.bam"

# index for easier bwa
bwa index $contigs

# map illumina reads to contigs
bwa mem $contigs $reads > $bwamapsam

# format conversion
samtools view -b $bwamapsam > $bwamapbam
samtools sort -o $bwasortbam $bwamapbam
samtools index $bwasortbam

# run pilon
java -jar $PILON_HOME/pilon.jar --genome $contigs --frags $bwasortbam
