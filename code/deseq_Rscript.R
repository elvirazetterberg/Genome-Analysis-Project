library(DESeq2, lib.loc = "/sw/apps/R_packages/4.1.1/rackham")

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("pasilla")


directory <- system.file("extdata", package="pasilla",
                         mustWork=TRUE)

sampleFiles <- grep("treated",list.files(directory),value=TRUE)
sampleCondition <- sub("(.*treated).*","\\1",sampleFiles)
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = sampleCondition)
sampleTable$condition <- factor(sampleTable$condition)


ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)
ddsHTSeq


# load all csv files
#data1 <- read.csv("/domus/h1/elze3417/genome_analysis/results/htseq/...")

# dds <- DESeqDataSetFromMatrix(countData=data1)

#rbind to bind dataframes

#dds <- DESeq(dds)
#resultsNames(dds)

