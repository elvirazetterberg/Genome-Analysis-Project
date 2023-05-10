#!/bin/sh
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J elvira_job_korv
#SBATCH --mail-type=ALL
#SBATCH --mail-user elvira.zetterberg@gmail.com

. run_korv.sh

EOT
