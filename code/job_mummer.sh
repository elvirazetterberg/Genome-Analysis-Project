#!/bin/bash -l

#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J elvira_job_mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user elvira.zetterberg@gmail.com

canu="/home/elze3417/genome_analysis/results/canu_pilon/pilon.fasta"
spades="/home/elze3417/genome_analysis/results/spades/contigs.fasta"
cwd=$(pwd)/run_mummer.sh


. mummer_load.sh
cd /home/elze3417/genome_analysis/results/mummer
. $cwd mummer_canu $canu
. $cwd mummer_spades $spades
