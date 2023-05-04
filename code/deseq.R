library(DESeq2, lib.loc = "/sw/apps/R_packages/4.1.1/rackham")
#library("DESeq2")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("apeglm")
BiocManager::install("pcaExplorer")
library("pcaExplorer")
library("ggplot2")


#### START ####
paf <- "/domus/h1/elze3417/genome_analysis/results/htseq/"
paf <- "."

countFiles <- list.files(path = paf, pattern = "count")

# since they are ordered
countCondition <- c(rep("Human", length(countFiles)/2), rep("BHI", length(countFiles)/2)) 

countSamples <- sub("[^ERR1-9]+","\\1", countFiles)
countSamples <- sub("[_count.csv]+","\\1", countSamples)

countTable <- data.frame(sampleName = countSamples,
                          fileName = countFiles,
                          condition = countCondition)

countTable$condition <- factor(countTable$condition)

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = countTable,
                                       directory = paf,
                                       design= ~ condition)
ddsHTSeq

dds <- DESeq(ddsHTSeq)
keep <- rowSums(counts(dds)) >= 10 # filter out genes that map 10 or fewer reads
dds <- dds[keep,]

resultsNames(dds)
res <- results(dds, name="condition_Human_vs_BHI")
res

# Shrinking effect size for visualization
resLFC <- lfcShrink(dds, coef="condition_Human_vs_BHI", type="apeglm")
resLFC

# results that have an adjusted p-value < 0.05
res05 <- results(dds, alpha=0.05)
summary(res05)
sum(res05$padj < 0.05, na.rm=TRUE)

# plot results of log fold changes
plotMA(res, ylim=c(-2,2))

# plot adjusted results (removed noise in low counts)
plotMA(resLFC, ylim=c(-2,2))

# interact with the plot
idx <- identify(res$baseMean, res$log2FoldChange)
rownames(res)[idx]


d <- plotCounts(dds, gene=which.min(res$padj), intgroup="condition", 
                returnData=TRUE)

ggplot(d, aes(x=condition, y=count)) + 
  geom_point(position=position_jitter(w=0.1,h=0)) + 
  scale_y_log10(breaks=c(25,100,400))

# PCA explorer -- I don't get it.
pcaExplorer(dds = dds)

#### END ####

