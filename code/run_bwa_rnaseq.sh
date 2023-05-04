#!/bin/bash

. load_bwa_rnaseq.sh

genome="/home/elze3417/genome_analysis/results/canu_pilon/pilon.fasta"
pathBH="/home/elze3417/genome_analysis/data/my_transcriptomics_data/RNA-Seq_BH"
pathSerum="/home/elze3417/genome_analysis/data/my_transcriptomics_data/RNA-Seq_Serum"

# index for easier bwa
bwa index $genome

# BHI
for file1 in /home/elze3417/genome_analysis/data/my_transcriptomics_data/RNA-Seq_BH/trim_paired*_pass_1*
do
	file2="$(basename "$file1" 1.fastq.gz)2.fastq.gz"
	base=$(basename "$file1" _pass_1.fastq.gz) 
 
	dir=/home/elze3417/genome_analysis/results/map_rnaseq/$base
	mkdir $dir
	cd $dir
  

	bwamapsam="${base}.sam"
	bwamapbam=${base}.bam
	bwasortbam=${base}.sorted.bam
	echo $bwamapsam

	# map RNA Seq from BHI broth to genome
	bwa mem $genome $file1 ${pathBH}/$file2 | samtools view -b - | samtools sort -o $bwasortbam -
	samtools index $bwasortbam

	# format conversion
	#samtools view -b $bwamapsam > $bwamapbam
	#samtools sort -o $bwasortbam $bwamapbam
	#samtools index $bwasortbam

done


# Heat inactivated serum
for file1 in /home/elze3417/genome_analysis/data/my_transcriptomics_data/RNA-Seq_Serum/trim_paired*_pass_1*
do
	file2="$(basename "$file1" 1.fastq.gz)2.fastq.gz"
	base=$(basename "$file1" _pass_1.fastq.gz)

	dir=/home/elze3417/genome_analysis/results/map_rnaseq/$base
	mkdir $dir
	cd $dir

	bwamapsam="${base}.sam"
	bwamapbam=${base}.bam
	bwasortbam=${base}.sorted.bam
	echo $bwamapsam

	# map RNA Seq from BHI broth to genome
	
	bwa mem $genome $file1 ${pathSerum}/$file2 | samtools view -b - | samtools sort -o $bwasortbam -
	samtools index $bwasortbam
	
	# format conversion
	#samtools view -b $bwamapsam > $bwamapbam
	#samtools sort -o $bwasortbam $bwamapbam
	#samtools index $bwasortbam
done
