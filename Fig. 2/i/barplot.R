
library(ggplot2)
# devtools::install_github('Mikata-Project/ggthemr')
library(ggthemr)
library(ggsignif)
library(tidyverse)
library(dplyr)
library(ggpubr)
# install.packages("devEMF")
library(devEMF)


# CF_temperate_total_abundance
data <- read.table("CF_temperate_total_abundance.txt", header=T, sep="\t")


abundance_mean <- data %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(total_abundance),
    sd = sd(total_abundance)
  )


plot_data1 <- abundance_mean
plot_data2 <- data
p <- ggplot()+ 
  geom_bar(data=plot_data1,mapping=aes(x=group,y=mean,fill=group), 
           position="dodge", 
           stat="identity",
           width = 0.7,
           color = "#282A1B")+  
  scale_fill_manual(values = c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ 
  geom_errorbar(data=plot_data1,mapping=aes(x = group,ymin = mean-sd, ymax = mean+sd), 
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

p

ggsave(paste("./", "CF_temperate_total_abundance.pdf", sep=""), p, width = 4, height = 4)


#### VF_temperate_total_abundance
data_1 <- read.table("VF_temperate_total_abundance.txt", header=T, sep="\t")

abundance_mean_1 <- data_1 %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(total_abundance),
    sd = sd(total_abundance)
  )



plot_data3 <- abundance_mean_1
plot_data4 <- data_1
p_1 <- ggplot()+ 
  geom_bar(data=plot_data3,mapping=aes(x=group,y=mean,fill=group), 
           position="dodge", 
           stat="identity", 
           width = 0.7,
           color = "#282A1B")+  
  scale_fill_manual(values = c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ 
  geom_errorbar(data=plot_data3,mapping=aes(x = group,ymin = mean-sd, ymax = mean+sd), 
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

p_1

ggsave(paste("./", "VF_temperate_total_abundance.pdf", sep=""), p_1, width = 4, height = 4)

