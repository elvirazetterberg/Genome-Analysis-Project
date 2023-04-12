#!/bin/bash

# load modules
. prepro_load.sh
echo modules loaded

path="/home/elze3417/genome_analysis/"

# QUALITY
# run fastqc on Illumina reads
seqfiles=$path"data/my_genomics_data/Illumina/*.fq.gz"

#fastqc -o ${path}results/fastqc/ $seqfiles
#echo fastqc round 1 complete

# TRIMMING
# Trimmomatic on Illumina reads

logfile=$path"results/trimmomatic/log.txt"
input1=$path"data/my_genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz"
input2=$path"data/my_genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz"
out1pair=$path"results/trimmomatic/SZAXPI015146-56_1.trimmed"
out1un=$path"results/trimmomatic/SZAXPI015146-56_1.untrimmed"
out2pair=$path"results/trimmomatic/SZAXPI015146-56_2.trimmed"
out2un=$path"results/trimmomatic/SZAXPI015146-56_2.untrimmed"
adapters="ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE-2.fa"
extra="LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:35"

#trimmomatic PE -trimlog $logfile $input1 $input2 $out1pair $out1un $out2pair $out2un $adapter $extra
echo trimmomatic complete


# QUALITY
# fastqc again
seqfiles2=$path"results/trimmomatic/*.trimmed" # use paired trimmed reads

fastqc -o ${path}results/fastqc/ $seqfiles2
echo fastqc round 2 complete

