#!/bin/bash
# run by: . quast.sh {path to contigs} {path to output}


quast="/sw/bioinfo/quast/5.0.2/rackham/bin/quast.py"
#contigs="/home/elze3417/genome_analysis/results/canu/efaecium.contigs.fasta"
reference="/home/elze3417/genome_analysis/data/ncbi_dataset/data/GCA_009734005.2/GCA_009734005.2_ASM973400v2_genomic.fna"
#output="/home/elze3417/genome_analysis/results/quast"

python $quast $1 -r $reference -o $2
