library(lmerTest)
library(ggplot2)
library(ggpubr)
library(ggpmisc)

# Regression of DOC and prokaryotic abundance
DOC.PA <- read.table("DOC-PA_data.txt", header = TRUE,sep = "\t")
p_DOC.PA <- ggplot(DOC.PA, aes(x = DOC, y = PA, colour = withkelp, shape = withkelp)) +    
  geom_point()+
  geom_smooth(aes(color = withkelp, fill = withkelp), method='lm',se=T,level = 0.95)+
  stat_cor(method = "pearson") +
  scale_color_manual(values = c("#000000", "#009300"))+
  scale_fill_manual(values = c("#000000", "#009300"))
p_DOC.PA
ggsave(paste("./", "DOC-PA.pdf", sep=""), p_DOC.PA, width = 4, height = 3)


# Regression of POC and prokaryotic abundance
POC.PA <- read.table("POC-PA_data.txt", header = TRUE,sep = "\t")
p_POC.PA <- ggplot(POC.PA, aes(x = POC, y = PA, colour = withkelp, shape = withkelp)) +    
  geom_point()+
  geom_smooth(aes(color = withkelp, fill = withkelp), method='lm',se=T,level = 0.95)+
  stat_cor(method = "pearson") +
  scale_color_manual(values = c("#000000", "#009300"))+
  scale_fill_manual(values = c("#000000", "#009300"))
p_POC.PA
ggsave(paste("./", "POC-PA.pdf", sep=""), p_POC.PA, width = 4, height = 3)


# Regression of DOC and viral abundance
DOC.VA <- read.table("DOC-VA_data.txt", header = TRUE,sep = "\t")
p_DOC.VA <- ggplot(DOC.VA, aes(x = DOC, y = VA, colour = withkelp, shape = withkelp)) +    
  geom_point()+
  geom_smooth(aes(color = withkelp, fill = withkelp), method='lm',se=T,level = 0.95)+
  stat_cor(method = "pearson") +
  scale_color_manual(values = c("#000000", "#009300"))+
  scale_fill_manual(values = c("#000000", "#009300"))
p_DOC.VA
ggsave(paste("./", "DOC-VA.pdf", sep=""), p_DOC.VA, width = 4, height = 3)


# Regression of POC and viral abundance
POC.VA <- read.table("POC-VA_data.txt", header = TRUE,sep = "\t")
p_POC.VA <- ggplot(POC.VA, aes(x = POC, y = VA, colour = withkelp, shape = withkelp)) +    
  geom_point()+
  geom_smooth(aes(color = withkelp, fill = withkelp), method='lm',se=T,level = 0.95)+
  stat_cor(method = "pearson") +
  scale_color_manual(values = c("#000000", "#009300"))+
  scale_fill_manual(values = c("#000000", "#009300"))
p_POC.VA
ggsave(paste("./", "POC-VA.pdf", sep=""), p_POC.VA, width = 4, height = 3)


# Regression of prokaryotic abundance and viral abundance
PA.VA <- read.table("PA-VA_data.txt", header = TRUE,sep = "\t")
p_PA.VA <- ggplot(PA.VA, aes(x = PA, y = VA, colour = withkelp, shape = withkelp)) +    
  geom_point()+
  geom_smooth(aes(color = withkelp, fill = withkelp), method='lm',se=T,level = 0.95)+
  stat_cor(method = "pearson") +
  scale_color_manual(values = c("#000000", "#009300"))+
  scale_fill_manual(values = c("#000000", "#009300"))
p_PA.VA
ggsave(paste("./", "PA-VA.pdf", sep=""), p_PA.VA, width = 4, height = 3)


# Regression of DO and viral abundance
DO.VA <- read.table("DO-VA_data.txt", header = TRUE,sep = "\t")
p_DO.VA <- ggplot(DO.VA, aes(x = DO, y = VA, colour = withkelp, shape = withkelp)) +    
  geom_point()+
  geom_smooth(aes(color = withkelp, fill = withkelp), method='lm',se=T,level = 0.95)+
  stat_cor(method = "pearson") +
  scale_color_manual(values = c("#000000", "#009300"))+
  scale_fill_manual(values = c("#000000", "#009300"))
p_DO.VA
ggsave(paste("./", "DO-VA.pdf", sep=""), p_DO.VA, width = 4, height = 3)


# Regression of DO and prokaryotic abundance
DO.PA <- read.table("DO-PA_data.txt", header = TRUE,sep = "\t")
p_DO.PA <- ggplot(DO.PA, aes(x = DO, y = PA, colour = withkelp, shape = withkelp)) +    
  geom_point()+
  geom_smooth(aes(color = withkelp, fill = withkelp), method='lm',se=T,level = 0.95)+
  stat_cor(method = "pearson") +
  scale_color_manual(values = c("#000000", "#009300"))+
  scale_fill_manual(values = c("#000000", "#009300"))
p_DO.PA
ggsave(paste("./", "DO-PA.pdf", sep=""), p_DO.PA, width = 4, height = 3)

