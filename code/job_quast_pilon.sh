#!/bin/bash -l

#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J elvira_job_canu
#SBATCH --mail-type=ALL
#SBATCH --mail-user elvira.zetterberg@gmail.com

pilon_contigs="/home/elze3417/genome_analysis/results/pilon/pilon.fasta"
output="/home/elze3417/genome_analysis/results/quast_pilon"

. quast_load.sh
. run_quast.sh $pilon_contigs $output




