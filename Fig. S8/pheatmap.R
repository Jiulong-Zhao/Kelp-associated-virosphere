library(pheatmap)
library(ggplot2)

data <- read.table("KS-viral_laminarinase_abundance.txt",header=T,row.names=1,sep="\t",comment.char="")
data <- log10(data+1)

p <- pheatmap(data, cluster_cols = FALSE, cluster_rows = FALSE,   
         border_color = "gray",                               
         gaps_row = c(2,11,17),    
         gaps_col = c(4,12,20,29),   
         angle_col = 90,   
         color = colorRampPalette(c("#FFFFFF", "#F4E3A1", "#F09F49", "#D84531", "#7C192A"))(50),  
         cellwidth = 11, cellheight = 11)  
p
ggsave(paste("./", "heatmap.pdf", sep=""), p, width = 10, height = 10)






