import subprocess
import os

#path = os.path.abspath(os.getcwd())
#os.system(". "+path+"/fastqc_load.sh") # load modules

# run fastqc on Illumina reads
seqfiles = "/home/elze3417/genome_analysis/data/my_genomics_data/Illumina/*.fq.gz"

# WORKS! REMOVE COMMENT FOR FINAL PRODUCT
# os.system("fastqc -o /home/elze3417/genome_analysis/results/fastqc/ -d /home/elze3417/genome_analysis/intermediate/ "+seqfiles)


# Trimmomatic on Illumina reads

input1 = "/home/elze3417/genome_analysis/data/my_genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz "
input2 = "/home/elze3417/genome_analysis/data/my_genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz "
out1trim = "/home/elze3417/genome_analysis/results/trimmomatic/SZAXPI015146-56_1.trimmed.fq "
out1un = "/home/elze3417/genome_analysis/results/trimmomatic/SZAXPI015146-56_1un.trimmed.fq "
out2trim = "/home/elze3417/genome_analysis/results/trimmomatic/SZAXPI015146-56_2.trimmed.fq "
out2un = "/home/elze3417/genome_analysis/results/trimmomatic/SZAXPI015146-56_2un.trimmed.fq "
adapters = "ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/rackham/adapters "
trimlog = "-trimlog /home/elze3417/genome_analysis/results/trimmomatic/trimlog.txt "
summary = "-summary /home/elze3417/genome_analysis/results/trimmomatic/summary.txt "
extra = "LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36"

# leading
# trailing
# sliding window

# -trimlog trimlog.txt -summary summary.txt ## need to give path there
run = "trimmomatic PE "+ trimlog + summary + input1 + input2 + out1trim + out1un + out2trim + out2un + adapters + extra

os.system(run)


# fastqc again
# which files are the real output? paired or unpaired?
