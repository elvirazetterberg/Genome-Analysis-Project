#!/bin/bash -l

ref="/home/elze3417/genome_analysis/data/ncbi_dataset/data/GCA_009734005.2/GCA_009734005.2_ASM973400v2_genomic.fna"
db="/home/elze3417/genome_analysis/data/db/ref_db"

makeblastdb -in $ref -title ref_db -out $db -dbtype nucl

fasta="/home/elze3417/genome_analysis/results/spades/contigs.fasta"

blastn -db $db -query $fasta -out /home/elze3417/genome_analysis/results/blast/results_spades.blastn -outfmt 6
