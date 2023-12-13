library(ggplot2)
library(ggsignif)
library(ggpubr)
library(RColorBrewer)
library(dplyr)


# Phycodnaviridae_CF
plot_data_1 <- read.table("CF_Phycodnaviridae_abun_log10.txt",header=T)
stat_plot_data_1 <- plot_data_1 %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(abundance),
    sd = sd(abundance)
  )

p_1 <- ggplot(data=plot_data_1)+ 
  geom_jitter(mapping=aes(x=group,y=abundance,colour = group),
              alpha = 0.3,size=2)+
  geom_boxplot(mapping=aes(x=group,y=abundance,colour = group),
              alpha = 0.5,
              size=1.5,
              width = 0.6,
              colour = "black")+ 
  scale_color_manual(limits=c("C0","C63","T0","T63"), 
                     values=c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ 
  geom_signif(mapping=aes(x=group,y=abundance), 
              comparisons = list(c("C0", "C63"),c("C63", "T63"),c("T0", "T63"),c("C0", "T0")),
              map_signif_level=T, 
              tip_length=c(0,0,0,0,0,0,0,0), 
              y_position = c(3,3.3,3.6,3.9), 
              size=1, 
              textsize = 4, 
              test = "wilcox.test")+ 
  theme_classic( 
    base_line_size = 1 
  )+
  labs(title="",x="",y="Relative abundance(RPKM, log10 scale)")+ 
  theme(plot.title = element_text(size = 15,
                                  colour = "black",
                                  hjust = 0.5),
        axis.title.y = element_text(size = 15, 
                                    color = "black",
                                    face = "bold", 
                                    vjust = 1.9, 
                                    hjust = 0.5, 
                                    angle = 90),
        legend.title = element_text(color="black", 
                                    size=15, 
                                    face="bold"),
        legend.text = element_text(color="black", 
                                   size = 10, 
                                   face = "bold"),
        axis.text.x = element_text(size = 13,  
                                   color = "black", 
                                   face = "bold", 
                                   vjust = 0.5, 
                                   hjust = 0.5, 
                                   angle = 0), 
        axis.text.y = element_text(size = 13,  
                                   color = "black",
                                   face = "bold", 
                                   vjust = 0.5, 
                                   hjust = 0.5, 
                                   angle = 0) 
  )
p_1

ggsave(paste("./", "CF_Phycodnaviridae_abundance.pdf", sep=""), p_1, width = 4, height = 5)


# Phycodnaviridae_VF_abundance
plot_data_2 <- read.table("VF_Phycodnaviridae_abun_log10.txt",header=T)

stat_plot_data_2 <- plot_data_2 %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(abundance),
    sd = sd(abundance)
  )


p_2 <- ggplot(data=plot_data_2)+ 
  geom_jitter(mapping=aes(x=group,y=abundance,colour = group), 
              alpha = 0.3,size=3)+
  geom_boxplot(mapping=aes(x=group,y=abundance,colour = group),
               alpha = 0.5,
               size=1.5,
               width = 0.6,
               colour = "black")+ 
  scale_color_manual(limits=c("C0","C63","T0","T63"), 
                     values=c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ 
  geom_signif(mapping=aes(x=group,y=abundance),
              comparisons = list(c("C0", "C63"),c("C63", "T63"),c("T0", "T63"),c("C0", "T0")),
              map_signif_level=T, 
              tip_length=c(0,0,0,0,0,0,0,0),
              y_position = c(2.7,3,3.3,3.6), 
              size=1, 
              textsize = 4, 
              test = "wilcox.test")+ 
  theme_classic(  
    base_line_size = 1 
  )+
  labs(title="",x="",y="Relative abundance(RPKM, log10 scale")+ 
  theme(plot.title = element_text(size = 15,
                                  colour = "black",
                                  hjust = 0.5),
        axis.title.y = element_text(size = 15, 
                                    color = "black",
                                    face = "bold", 
                                    vjust = 1.9, 
                                    hjust = 0.5, 
                                    angle = 90),
        legend.title = element_text(color="black", 
                                    size=15, 
                                    face="bold"),
        legend.text = element_text(color="black", 
                                   size = 10, 
                                   face = "bold"),
        axis.text.x = element_text(size = 13,  
                                   color = "black", 
                                   face = "bold",
                                   vjust = 0.5, 
                                   hjust = 0.5, 
                                   angle = 0), 
        axis.text.y = element_text(size = 13,  
                                   color = "black",
                                   face = "bold", 
                                   vjust = 0.5, 
                                   hjust = 0.5, 
                                   angle = 0) 
  )
p_2

ggsave(paste("./", "VF_Phycodnaviridae_abundance.pdf", sep=""), p_2, width = 4, height = 5)





