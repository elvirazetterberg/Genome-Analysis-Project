#!/bin/bash -l

contigs="/home/elze3417/genome_analysis/results/canu/efaecium.contigs.fasta"
output="/home/elze3417/genome_analysis/results/quast"

. load_quast.sh
. quast.sh $contigs $output




