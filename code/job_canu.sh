#!/bin/bash -l

#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J elvira_job_canu
#SBATCH --mail-user elvira.zetterberg@gmail.com

. assemble_canu.sh

