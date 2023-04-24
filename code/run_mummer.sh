#!/bin/bash

#nucmer -p namn referens assembly

reference="/home/elze3417/genome_analysis/data/ncbi_dataset/data/GCA_009734005.2/GCA_009734005.2_ASM973400v2_genomic.fna"
name=$1
assembly=$2

nucmer -p $name $reference $assembly
mummerplot -p $name --png -l ./${name}.delta #-R ref,-Q assembly? to possibly improve plot
