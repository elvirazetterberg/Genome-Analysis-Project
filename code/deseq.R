library("DESeq2")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("apeglm")
BiocManager::install("pcaExplorer")
library("pcaExplorer")
library("ggplot2")
library("pheatmap")
library("dplyr")


#### START ####
paf <- "." # Assumes HTSeq in the current directory.

countFiles <- list.files(path = paf, pattern = "count")

# since they are ordered
countCondition <- c(rep("Human", length(countFiles)/2), rep("BHI", length(countFiles)/2)) 

# Regular expression to get sample names
countSamples <- sub("[^ERR1-9]+","\\1", countFiles)
countSamples <- sub("[_count.csv]+","\\1", countSamples)

# Create a count table with sample names, file names and condition
countTable <- data.frame(sampleName = countSamples,
                          fileName = countFiles,
                          condition = countCondition)

countTable$condition <- factor(countTable$condition)

# Combine count data with sample table
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = countTable,
                                       directory = paf,
                                       design= ~ condition)
ddsHTSeq



dds <- DESeq(ddsHTSeq, minReplicatesForReplace = Inf)
res <- results(dds, cooksCutoff = FALSE, independentFiltering = FALSE)

# Plot the log distribution of the original counts
res_df <- data.frame(res, rownames='Genes')
ggplot(res_df, aes(x=log(baseMean))) + geom_histogram(fill = '#3a7c85', bins = 50)

# Take out genes with significant differential expression
res2 <- res[which(res$padj < 0.001), ]

# Replicate paper by removing "fold change greater than 2 or smaller than 0.5" 
# which equates to log fold change greater than 1 or smaller than -1
res_3 <- res2[which((res2$log2FoldChange > 1 | res2$log2FoldChange < -1)), ]

# Plot
plotMA(res_3, ylim=c(-10,10))

# filter out the largest log2foldchange values to check GO-terms for these genes
res_top_bot <- res2[which((res2$log2FoldChange > 7 | res2$log2FoldChange < -5)), ]

# plot results of log fold changes
plotMA(res_top_bot, ylim=c(-10,10))

# Normalize data
ntd <- normTransform(dds)

# Select the top 30 genes with highest log2 fold change and make a heat map
res_top_bot2 <- res_top_bot %>% as_tibble(rownames='Gene')
genes <- res_top_bot2$Gene
select <- rownames(dds) %in% genes
df <- as.data.frame(colData(dds)[,c("condition","sizeFactor")])
pheatmap(assay(ntd)[select,], cluster_rows=FALSE, show_rownames=TRUE,
         cluster_cols=FALSE, annotation_col=df)


#### END ####
