# WORKFLOW FOR PROCESSING RNASEQ USING DESEQ2
library(DESeq2)
library(biomaRt)
library(pheatmap)

#CHANGE THIS DEPENDING ON WHAT FILES YOU'RE PROCESSING
directory <- "/Volumes/NO NAME/RNASeq/FUS1 RNASeq/LoTurco/Counts/Name_Sorted/"
setwd(directory)

#ESTABLISH BIOMART OBJECT TO RENAME ENSEMBL IDs
mart <- useDataset("mmusculus_gene_ensembl", useMart(host = "aug2017.archive.ensembl.org", biomart = "ENSEMBL_MART_ENSEMBL"))

#MAY HAVE TO TWEAK THESE ENVIRONMENT VARIABLES BASED ON FILE NAMING CONVENTIONS
fileNames <- list.files(directory)
sampleNames <- sub("_Name_Sorted.txt","",fileNames)
conditionNames <- sub("_\\D\\d","",sampleNames)

sampleTable <- data.frame(sampleName = sampleNames,
						  fileName = fileNames,
						  condition = conditionNames)

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design = ~ condition)
dds <- DESeq(ddsHTSeq)
res <- results(dds)

#Create counts table with statistics for 2-way comparison.
FPvC_counts <- (counts(dds, normalized=TRUE))[,-c(7,8,9,10)]
FPvC_data <- merge(as.data.frame(res), as.data.frame(FPvC_counts), by='row.names', sort=FALSE)
genes <- FPvC_data$Row.names
new_names <- getBM(filters= "ensembl_gene_id", attributes=c("ensembl_gene_id","external_gene_name"), values=genes,mart=mart)
out <- merge(n_FPvC_data,new_names,by.x="Row.names",by.y="ensembl_gene_id")
out <- out[,c(c(ncol(out),1:(ncol(out)-1)))]
out <- out[,-2]
write.table(out, file= "LoTurco_FUS1+P53_vs_CTRL.txt", sep='\t')

#Create a heatmap showing expression of the 43 ependymoma-associated TFs
enhancers <- read.table("/Volumes/NO NAME/RNASeq/FUS1_Enhancers.txt", sep="",header = FALSE,)
enhancers <- merge.data.frame(enhancers, getBM(filters="external_gene_name", attributes="ensembl_gene_id", enhancers, mart), by = "row.names")
counts <- counts(dds, normalized=TRUE)
a <- c(enhancers[3])
counts_enhancers <-counts[enhancers$ensembl_gene_id,]
row.names(counts_enhancers) <- enhancers[,"V1"]
cal_z_score <- function(x){
(x - mean(x)) / sd(x)
}
counts_enhancers_norm <- t(apply(counts_enhancers, 1, cal_z_score))
counts_enhancers_norm["Ccnt2",] <- 0
counts_enhancers_norm["Zfp423",] <- 0
pheatmap(counts_enhancers_norm)
