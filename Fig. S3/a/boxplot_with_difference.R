# 导入所需的包
library(ggplot2)
library(ggsignif)
library(ggpubr)
library(RColorBrewer)
library(dplyr)


# other_Nucleocytoviricota_CF
# 导入数据
plot_data_1 <- read.table("CF_other_Nucleocytoviricota_abun_log10.txt",header=T)
# 数据统计
stat_plot_data_1 <- plot_data_1 %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(abundance),
    sd = sd(abundance)
  )

# 分组检验数据的正态性 
# shapiro.test(resid(lm(abundance ~ group,plot_data_1)))
# 不符合正态分布，用非参数检验：威尔科克森秩检验
# wilcox.test_1 <- wilcox.test(abundance ~ group, plot_data_1, paired = FALSE, alternative = 'two.sided')
# wilcox.test_1
# wilcox.test_1$p.value

p_1 <- ggplot(data=plot_data_1)+ 
  geom_jitter(mapping=aes(x=group,y=abundance,colour = group), #散点
              alpha = 0.3,size=2)+
  geom_boxplot(mapping=aes(x=group,y=abundance,colour = group), #箱线图
              alpha = 0.5,
              size=1.5,
              width = 0.6,
              colour = "black")+ 
  scale_color_manual(limits=c("C0","C63","T0","T63"), 
                     values=c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ #颜色
  geom_signif(mapping=aes(x=group,y=abundance), # 不同组别的显著性
              comparisons = list(c("C0", "C63"),c("C63", "T63"),c("T0", "T63"),c("C0", "T0")),
              map_signif_level=T, # T显示显著性，F显示p value
              tip_length=c(0,0,0,0,0,0,0,0), # 修改显著性线两端的长短
              y_position = c(3,3.3,3.6,3.9), # 设置显著性线的位置高度
              size=1, # 修改线的粗细
              textsize = 4, # 修改显著性标记的大小
              test = "wilcox.test")+ # 检验的类型
  theme_classic(  # 主题设置，这个是无线条主题
    base_line_size = 1 # 坐标轴的粗细
  )+
  labs(title="",x="",y="Relative abundance(RPKM, log10 scale)")+ # 添加标题，x轴，y轴内容
  theme(plot.title = element_text(size = 15,
                                  colour = "black",
                                  hjust = 0.5),
        axis.title.y = element_text(size = 15, 
                                    color = "black",
                                    face = "bold", 
                                    vjust = 1.9, 
                                    hjust = 0.5, 
                                    angle = 90),
        legend.title = element_text(color="black", # 修改图例的标题
                                    size=15, 
                                    face="bold"),
        legend.text = element_text(color="black", # 设置图例标签文字
                                   size = 10, 
                                   face = "bold"),
        axis.text.x = element_text(size = 13,  # 修改X轴上字体大小，
                                   color = "black", # 颜色
                                   face = "bold", #  face取值：plain普通，bold加粗，italic斜体，bold.italic斜体加粗
                                   vjust = 0.5, # 位置
                                   hjust = 0.5, 
                                   angle = 0), #角度
        axis.text.y = element_text(size = 13,  
                                   color = "black",
                                   face = "bold", 
                                   vjust = 0.5, 
                                   hjust = 0.5, 
                                   angle = 0) 
  )
p_1

ggsave(paste("./", "CF_other_Nucleocytoviricota_abundance.pdf", sep=""), p_1, width = 4, height = 5)


# other_Nucleocytoviricota_VF_abundance
# 导入数据
plot_data_2 <- read.table("VF_other_Nucleocytoviricota_abun_log10.txt",header=T)

# 数据统计
stat_plot_data_2 <- plot_data_2 %>% 
  dplyr::group_by(group) %>% 
  dplyr::summarize(
    count=n(),
    mean = mean(abundance),
    sd = sd(abundance)
  )

# 分组检验数据的正态性 
# shapiro.test(resid(lm(abundance ~ group,plot_data_2)))
# 不符合正态分布，用非参数检验：威尔科克森秩检验
# wilcox.test_2 <- wilcox.test(abundance ~ group, plot_data_2, paired = FALSE, alternative = 'two.sided')
# wilcox.test_2
# wilcox.test_2$p.value

p_2 <- ggplot(data=plot_data_2)+ 
  geom_jitter(mapping=aes(x=group,y=abundance,colour = group), #散点
              alpha = 0.3,size=3)+
  geom_boxplot(mapping=aes(x=group,y=abundance,colour = group), #箱线图
               alpha = 0.5,
               size=1.5,
               width = 0.6,
               colour = "black")+ 
  scale_color_manual(limits=c("C0","C63","T0","T63"), 
                     values=c("#DEDEE0","#6E6E70","#A2D5B2","#588662"))+ #颜色
  geom_signif(mapping=aes(x=group,y=abundance), # 不同组别的显著性
              comparisons = list(c("C0", "C63"),c("C63", "T63"),c("T0", "T63"),c("C0", "T0")),
              map_signif_level=T, # T显示显著性，F显示p value
              tip_length=c(0,0,0,0,0,0,0,0), # 修改显著性线两端的长短
              y_position = c(4.7,5,5.3,5.6), # 设置显著性线的位置高度
              size=1, # 修改线的粗细
              textsize = 4, # 修改显著性标记的大小
              test = "wilcox.test")+ # 检验的类型
  theme_classic(  # 主题设置，这个是无线条主题
    base_line_size = 1 # 坐标轴的粗细
  )+
  labs(title="",x="",y="Relative abundance(RPKM, log10 scale")+ # 添加标题，x轴，y轴内容
  theme(plot.title = element_text(size = 15,
                                  colour = "black",
                                  hjust = 0.5),
        axis.title.y = element_text(size = 15, 
                                    color = "black",
                                    face = "bold", 
                                    vjust = 1.9, 
                                    hjust = 0.5, 
                                    angle = 90),
        legend.title = element_text(color="black", # 修改图例的标题
                                    size=15, 
                                    face="bold"),
        legend.text = element_text(color="black", # 设置图例标签文字
                                   size = 10, 
                                   face = "bold"),
        axis.text.x = element_text(size = 13,  # 修改X轴上字体大小，
                                   color = "black", # 颜色
                                   face = "bold", #  face取值：plain普通，bold加粗，italic斜体，bold.italic斜体加粗
                                   vjust = 0.5, # 位置
                                   hjust = 0.5, 
                                   angle = 0), #角度
        axis.text.y = element_text(size = 13,  
                                   color = "black",
                                   face = "bold", 
                                   vjust = 0.5, 
                                   hjust = 0.5, 
                                   angle = 0) 
  )
p_2

ggsave(paste("./", "VF_other_Nucleocytoviricota_abundance.pdf", sep=""), p_2, width = 4, height = 5)

