#!/bin/bash -l

#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J elvira_job_canu
#SBATCH --mail-type=ALL
#SBATCH --mail-user elvira.zetterberg@gmail.com

contigs="/home/elze3417/genome_analysis/results/canu/efaecium.contigs.fasta"
output="/home/elze3417/genome_analysis/results/quast"

. quast_load.sh
. run_quast.sh contigs output




