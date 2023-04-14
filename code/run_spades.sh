#!/bin/bash


output="/home/elze3417/genome_analysis/results/spades"
nanoreads="/home/elze3417/genome_analysis/data/my_genomics_data/Nanopore/E745_all.fasta.gz"
read1illumina="/home/elze3417/genome_analysis/data/my_genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz"
read2illumina="/home/elze3417/genome_analysis/data/my_genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz"


spades.py -1 $read1illumina -2 $read2illumina --nanopore $nanoreads -o $output --careful --tmp-dir $SNIC_TMP

# --careful works on small genomes (such as this one) and tries to reduce mismatches and short indels

