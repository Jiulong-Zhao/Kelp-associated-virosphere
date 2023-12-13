## Families with relative abundance > 0.3%
family_data <- read.table("family_abundance.txt", header = TRUE,row.names = 1,sep = "\t")
family_data <- t(family_data)
family_data <- as.data.frame(family_data)
family_data[is.na(family_data)] <- 0
envdata <- read.table("env.txt", header=TRUE,row.names=1,sep="\t")
envdata[is.na(envdata)] <- 0


library(psych)
library(pheatmap)
family_res <- corr.test(family_data,envdata,method = "spearman",adjust = "holm")
write.table(family_res$r,"family_env_correlation.xls",sep="\t",quote=FALSE,col.names=NA)
write.table(family_res$p,"family_env_pvalue.xls",sep="\t",quote=FALSE,col.names=NA)

library(ggplot2)

family_env_p <- pheatmap(family_res$r, fontsize_number=35,fontsize = 20,cluster_rows = TRUE, 
                         display_numbers = matrix(ifelse(family_res$p <= 0.01, "**", 
                                                         ifelse(family_res$p <= 0.05 ,"*"," ")), nrow(family_res$p)), 
                         cluster_cols = FALSE,fontface = "bold")

ggsave(paste("./", "families_env_correlation.pdf", sep=""), family_env_p, width = 11, height = 8)



