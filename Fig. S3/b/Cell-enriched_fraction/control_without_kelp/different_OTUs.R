
library(DESeq2)


gene <- read.delim('vOTUs_raw_counts_CF_control.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
gene <- round(as.matrix(gene))

coldata <- data.frame(group = factor(rep(c('start', 'end'), each = 2), levels = c('start', 'end')))


dds <- DESeqDataSetFromMatrix(countData = gene, colData = coldata, design = ~group)


vsd <- assay(varianceStabilizingTransformation(dds, blind = FALSE))
head(vsd, 10)
write.table(vsd, 'norm_matrix.txt', sep = '\t', col.names = NA, quote = FALSE)


dds <- DESeq(dds, parallel = FALSE)	
suppressMessages(dds)

res <- results(dds, contrast = c('group', 'end', 'start'), pAdjustMethod = 'fdr', alpha = 0.05)



deseq_res$gene_id <- rownames(deseq_res)
write.table(deseq_res[c(7, 1:6)], 'DESeq2.txt', row.names = FALSE, sep = '\t', quote = FALSE)


library(ggplot2)

deseq_res <- read.delim('DESeq2.txt', sep = '\t')

# |log2FC| >= 1 & FDR p-value < 0.05 
deseq_res[which(deseq_res$padj %in% NA),'sig'] <- 'no diff'
deseq_res[which(deseq_res$log2FoldChange >= 1 & deseq_res$padj < 0.05),'sig'] <- 'rich (p.adj < 0.05, log2FC >= 1)'
deseq_res[which(deseq_res$log2FoldChange <= -1 & deseq_res$padj < 0.05),'sig'] <- 'down (p.adj < 0.05, log2FC <= -1)'
deseq_res[which(abs(deseq_res$log2FoldChange) < 1 | deseq_res$padj >= 0.05),'sig'] <- 'no diff'


volcano_p <- ggplot(deseq_res, aes(log2FoldChange, -log(padj, 10))) +
  geom_point(aes(color = sig), alpha = 0.6, size = 1) +
  scale_color_manual(values = c('blue2', 'gray30', 'red2')) +
  theme(panel.grid = element_blank(), panel.background = element_rect(color = 'black', fill = 'transparent'), legend.position = c(0.26, 0.92)) +
  theme(legend.title = element_blank(), legend.key = element_rect(fill = 'transparent'), legend.background = element_rect(fill = 'transparent')) +
  geom_vline(xintercept = c(-1, 1), color = 'gray', size = 0.25) + 
  geom_hline(yintercept = -log(0.05, 10), color = 'gray', size = 0.25) +
  labs(x = 'log2 Fold Change', y = '-log10 p-value', color = NA) 

ggsave('volcano_p.pdf', volcano_p, width = 5, height = 6)
ggsave('volcano_p.png', volcano_p, width = 5, height = 6)

