library(ggplot2)
library(RColorBrewer)
# install.packages("ggchicklet", repos = "https://cinc.rud.is")
library(ggchicklet)
# install.packages("ggprism")
library(ggprism)
data <- read.table("data.txt", header = TRUE,sep = "\t")

p <- ggplot(data,aes(x = reorder(target_database, - novelty_proporation), y = novelty_proporation))+  
  geom_chicklet(aes(fill = target_database)) +
  
  scale_fill_manual(name="",
                    values =c(brewer.pal(5,"Paired"),
                              brewer.pal(5,"Paired")))+
  theme_prism(base_line_size = 1, 
              base_fontface = "plain", 
              base_family = "Arial",
              axis_text_angle = 45)+ 
  theme_bw()+labs(x="Target database",y="Proporation of novel viral sequences (%)")

p
ggsave(paste("./", "histogram_round_corner.pdf", sep=""), p, width = 5, height = 3)
