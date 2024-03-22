library(pheatmap)
library(ggplot2)

K.data <- read.table("K_input.txt",header=T,row.names=1,sep="\t",comment.char="")

KSWCF.data <- read.table("KSW-CF_input.txt",header=T,row.names=1,sep="\t",comment.char="")

KSWVF.data <- read.table("KSW-VF_input.txt",header=T,row.names=1,sep="\t",comment.char="")

KSD.data <- read.table("KSD_input.txt",header=T,row.names=1,sep="\t",comment.char="")

plot.anno <- read.table("annotation.txt",header=T,row.names=1,sep="\t",comment.char="")


# K plot
K.p <- pheatmap(K.data, cluster_rows = FALSE, clustering_method = "ward.D",   
         border_color = "gray",                            
         gaps_row = c(3,7,10,14,26),  
         angle_col = 45,    
         color = colorRampPalette(c("#FFFFFF", "#F4E3A1", "#F09F49", "#D84531", "#7C192A"))(50), 
         annotation_row = plot.anno,  
         cellwidth = 11, cellheight = 11)  
K.p
ggsave(paste("./", "K-heatmap.pdf", sep=""), K.p, width = 10, height = 10)


# KSW-CF plot
KSWCF.p <- pheatmap(KSWCF.data, cluster_rows = FALSE, clustering_method = "ward.D",   
                border_color = "gray",    
                gaps_row = c(3,7,10,14,26),   
                angle_col = 45,    
                color = colorRampPalette(c("#FFFFFF", "#F4E3A1", "#F09F49", "#D84531", "#7C192A"))(50),  
                annotation_row = plot.anno, 
                cellwidth = 11, cellheight = 11)   
KSWCF.p
ggsave(paste("./", "KSWCF-heatmap.pdf", sep=""), KSWCF.p, width = 10, height = 10)


# KSW-VF plot
KSWVF.p <- pheatmap(KSWVF.data, cluster_rows = FALSE, clustering_method = "ward.D", 
                    border_color = "gray",                             
                    gaps_row = c(3,7,10,14,26),   
                    angle_col = 45,  
                    color = colorRampPalette(c("#FFFFFF", "#F4E3A1", "#F09F49", "#D84531", "#7C192A"))(50), 
                    annotation_row = plot.anno,  
                    cellwidth = 11, cellheight = 11)   
KSWVF.p
ggsave(paste("./", "KSWVF-heatmap.pdf", sep=""), KSWVF.p, width = 10, height = 10)


# KSD plot
KSD.p <- pheatmap(KSD.data, cluster_rows = FALSE, clustering_method = "ward.D",  
                    border_color = "gray",                               
                    gaps_row = c(3,7,10,14,26),    
                    angle_col = 45,    
                    color = colorRampPalette(c("#FFFFFF", "#F4E3A1", "#F09F49", "#D84531", "#7C192A"))(50),  
                    annotation_row = plot.anno,  
                    cellwidth = 11, cellheight = 11)  
KSD.p
ggsave(paste("./", "KSD-heatmap.pdf", sep=""), KSD.p, width = 10, height = 10)





