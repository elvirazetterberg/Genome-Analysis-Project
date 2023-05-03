#!/bin/bash

. load_htseq.sh

genome="/home/elze3417/genome_analysis/results/prokka/annotated_genome.gff"

for rnaseq in /home/elze3417/genome_analysis/results/map_rnaseq/*
do
        base=$(basename "$rnaseq")
	file="/home/elze3417/genome_analysis/results/map_rnaseq/${base}/${base}.sorted.bam"
	
	htseq-count -m union --nonunique none -f bam -r pos -t CDS -i locus_tag -c ${base}_count.csv $file $genome

done
