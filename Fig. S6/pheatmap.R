library(pheatmap)
library(ggplot2)

data <- read.table("K-KSW-sharing_vOTUs_vMAGs.txt",header=T,row.names=1,sep="\t",comment.char="")
data <- log10(data+1)

p <- pheatmap(data, cluster_cols = T, cluster_rows = T,   # 聚类
         border_color = "gray",    # 热图方块边框为灰色                           
         # gaps_row = c(2,11,17),    # 分别在2,11,17行断开
         # gaps_col = c(4,6,8),    # 分别在4,6,8列断开
         angle_col = 90,    # x轴label旋转45度
         color = colorRampPalette(c("#FFFFFF", "#F4E3A1", "#F09F49", "#D84531", "#7C192A"))(50),  # 选择一组颜色并进行渐变，分为50个等级
         cellwidth = 15, cellheight = 15)   # 方格的尺寸固定为10
p
ggsave(paste("./", "heatmap.pdf", sep=""), p, width = 10, height = 10)






