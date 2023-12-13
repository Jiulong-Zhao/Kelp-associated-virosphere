library(pheatmap)
library(ggplot2)

data <- read.table("S9_0_3_enriched_kelp_viruses.txt",header=T,row.names=1,sep="\t",comment.char="")
data <- log10(data+1)

p <- pheatmap(data, cluster_cols = T, cluster_rows = T,  
         border_color = "gray",                            
         angle_col = 90,    
         color = colorRampPalette(c("#FFFFFF", "#F4E3A1", "#F09F49", "#D84531", "#7C192A"))(50),  
         cellwidth = 15, cellheight = 15)  
p
ggsave(paste("./", "heatmap.pdf", sep=""), p, width = 10, height = 10)






