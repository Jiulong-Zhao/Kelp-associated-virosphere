
library(ggplot2)
# devtools::install_github('Mikata-Project/ggthemr')
library(ggthemr)
library(ggsignif)
library(tidyverse)
library(dplyr)
library(ggpubr)
# install.packages("devEMF")
library(devEMF)



#### CF_phage_abundance
data_2 <- read.table("CF_phage_abundance.txt", header=T, sep="\t")

abundance_mean_2 <- data_2 %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(total_abundance),
    sd = sd(total_abundance)
  )


plot_data5 <- abundance_mean_2
plot_data6 <- data_2
p_2 <- ggplot()+ 
  geom_bar(data=plot_data5,mapping=aes(x=group,y=mean,fill=group),
           position="dodge", 
           stat="identity", 
           width = 0.7,
           color = "#282A1B")+  
  scale_fill_manual(values = c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ 
  geom_errorbar(data=plot_data5,mapping=aes(x = group,ymin = mean-sd, ymax = mean+sd), 
                width = 0.1, 
                color = 'black', 
                size=0.8)+ 
  theme_classic(  
    base_line_size = 1 
  )+
  labs(title="",x="",y="")+ 
  theme(plot.title = element_text(size = 20,
                                  colour = "red",
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

ggsave(paste("./", "CF_phage_abundance.pdf", sep=""), p_2, width = 4, height = 4)



#### VF_phage_total_abundance

data_3 <- read.table("VF_phage_total_abundance.txt", header=T, sep="\t")
abundance_mean_3 <- data_3 %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(total_abundance),
    sd = sd(total_abundance)
  )


plot_data7 <- abundance_mean_3
plot_data8 <- data_3
p_3 <- ggplot()+ 
  geom_bar(data=plot_data7,mapping=aes(x=group,y=mean,fill=group), 
           position="dodge", 
           stat="identity", 
           width = 0.7,
           color = "#282A1B")+  
  scale_fill_manual(values = c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ 
  geom_errorbar(data=plot_data7,mapping=aes(x = group,ymin = mean-sd, ymax = mean+sd), 
                width = 0.1, 
                color = 'black', 
                size=0.8)+ 
  theme_classic(  
    base_line_size = 1
  )+
  labs(title="",x="",y="")+ 
  theme(plot.title = element_text(size = 20,
                                  colour = "red",
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

p_3

ggsave(paste("./", "VF_phage_total_abundance.pdf", sep=""), p_3, width = 4, height = 4)
