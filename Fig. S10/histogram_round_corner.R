library(ggplot2)
library(RColorBrewer)
# install.packages("ggchicklet", repos = "https://cinc.rud.is")
library(ggchicklet)
# install.packages("ggprism")
library(ggprism)
data <- read.table("data.txt", header = TRUE,sep = "\t")

p <- ggplot(data,aes(x = reorder(datasets, - novelty_proporation), y = novelty_proporation * 100))+  
      
  geom_chicklet(aes(fill = datasets)) +
  
  scale_fill_manual(name="",
                    values =c(brewer.pal(8,"Paired"),
                              brewer.pal(8,"Paired")))+
  theme_prism(base_line_size = 1, 
              base_fontface = "plain",
              base_family = "Arial", 
              axis_text_angle = 45)+ 
  theme_bw()+labs(x="Datasets",y="Proporation of novel viral sequences (%)")

p
ggsave(paste("./", "histogram_round_corner.pdf", sep=""), p, width = 10, height = 8)
