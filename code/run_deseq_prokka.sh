#!/bin/sh

module load bioinfo-tools
module load samtools

anno_genome="/home/elze3417/genome_analysis/results/prokka/annotated_genome.faa"

for siggene in `cat /home/elze3417/genome_analysis/results/deseq/siggenes.txt`
do
	samtools faidx $anno_genome $siggene >> /home/elze3417/genome_analysis/results/deseq/deseq_sequences.txt
done
