
library(ggcorrplot)
library(ggthemes)

data <- read.table("all_envs.txt", header = T,row.names = 1)
dim(data)
head(data)

corr <- round(cor(data), 3)
head(corr[, 1:6])

p.mat <- round(cor_pmat(data), 3)
head(p.mat[,1:6])



p <- ggcorrplot(corr, method = "circle",
           hc.order = TRUE, hc.method = "ward.D", 
           outline.col = "white", ggtheme = theme_bw(),
           show.legend = TRUE, 
           colors = c("#6D9EC1","white","#E46726"),lab = TRUE,lab_size = 2, 
           p.mat = p.mat,insig = "blank") 

ggsave(p,filename = "env_cor_heatmap.pdf",width = 20, height = 15, units = c("cm"),colormodel="srgb")


