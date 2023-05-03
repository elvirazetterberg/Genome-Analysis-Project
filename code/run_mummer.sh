#!/bin/bash -l

canu="/home/elze3417/genome_analysis/results/canu_pilon/pilon.fasta"
spades="/home/elze3417/genome_analysis/results/spades/contigs.fasta"
cwd=$(pwd)/run_mummer.sh


. load_mummer.sh

cd /home/elze3417/genome_analysis/results/mummer
. $cwd mummer_canu $canu
. $cwd mummer_spades $spades
