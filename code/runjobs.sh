#!/bin/sh
sbatch <<EOT

#!/bin/sh
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J elvira_job_$1
#SBATCH --mail-type=ALL
#SBATCH --mail-user elvira.zetterberg@gmail.com

. run_${1}.sh

EOT
