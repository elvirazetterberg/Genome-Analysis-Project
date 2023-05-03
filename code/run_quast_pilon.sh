#!/bin/bash -l

pilon_contigs="/home/elze3417/genome_analysis/results/canu_pilon/pilon.fasta"
output="/home/elze3417/genome_analysis/results/quast_pilon"

. load_quast.sh
. quast.sh $pilon_contigs $output




