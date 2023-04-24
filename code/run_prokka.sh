

out="/home/elze3417/genome_analysis/results/prokka"
contigs="/home/elze3417/genome_analysis/results/canu_pilon/pilon.fasta"

prokka --outdir $out --prefix annotated_genome --genus Enterococcus --species faecium --strain E745 $contigs
