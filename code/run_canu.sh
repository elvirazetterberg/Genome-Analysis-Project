#!/bin/bash

# Load modules
. load_canu.sh
echo modules loaded

# PacBio reads

id="efaecium"
output="/home/elze3417/genome_analysis/results/canu"
path="/home/elze3417/genome_analysis/data/my_genomics_data/PacBio/"
read1=$path"m131023_233432_42174_c100519312550000001823081209281335_s1_X0.1.subreads.fastq.gz"
read2=$path"m131023_233432_42174_c100519312550000001823081209281335_s1_X0.2.subreads.fastq.gz"
read3=$path"m131023_233432_42174_c100519312550000001823081209281335_s1_X0.3.subreads.fastq.gz"
read4=$path"m131024_200535_42174_c100563672550000001823084212221342_s1_p0.1.subreads.fastq.gz"
read5=$path"m131024_200535_42174_c100563672550000001823084212221342_s1_p0.2.subreads.fastq.gz"
read6=$path"m131024_200535_42174_c100563672550000001823084212221342_s1_p0.3.subreads.fastq.gz"


canu -p $id -d $output genomeSize=3.2m -pacbio $read1 $read2 $read3 $read4 $read5 $read6
echo canu assembly done
