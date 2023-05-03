#!/bin/bash -l

spades_contigs="/home/elze3417/genome_analysis/results/spades/contigs.fasta"
output="/home/elze3417/genome_analysis/results/quast_spades"

. load_quast.sh
. quast.sh $spades_contigs $output




