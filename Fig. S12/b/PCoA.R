library(vegan)
library(ape)
data <- read.table("ASV_table_normalized.txt",header=T,row.names=1,sep="\t")
data <- t(data)
data[is.na(data)] <- 0
distance <- vegdist(data, method = "bray")
pcoa<- pcoa(distance, correction = "none", rn = NULL)

groups <- read.table("metadata.txt",sep = "\t",header = T,colClasses = c("character"))
groups <- as.list(groups)
PC1 = pcoa$vectors[,1]
PC2 = pcoa$vectors[,2]
plotdata <- data.frame(rownames(pcoa$vectors),PC1,PC2,groups$site)
colnames(plotdata) <-c("sample","PCo1","PCo2","group")

pc1 <-floor(pcoa$values$Relative_eig[1]*100)
pc2 <-floor(pcoa$values$Relative_eig[2]*100)


library(ggplot2)
p <- ggplot(plotdata, aes(PCo1, PCo2)) +
  geom_point(aes(colour=groups$site,fill=groups$site),size=6)+
  labs(title="PCoA") + 
  xlab(paste("PC1 ( ",pc1,"%"," )",sep="")) + 
  ylab(paste("PC2 ( ",pc2,"%"," )",sep=""))+
  theme(text=element_text(size=30))+
  geom_vline(aes(xintercept = 0),linetype="dotted")+
  geom_hline(aes(yintercept = 0),linetype="dotted")+
  theme(panel.background = element_rect(fill='white', colour='black'),
        panel.grid=element_blank(), 
        axis.title = element_text(color='black',size=10),
        axis.ticks.length = unit(0.4,"lines"), axis.ticks = element_line(color='black'),
        axis.line = element_line(colour = "black"), 
        axis.title.x=element_text(colour='black', size=10),
        axis.title.y=element_text(colour='black', size=10),
        axis.text=element_text(colour='black',size=10),
        legend.title=element_blank(),
        legend.text=element_text(size=10),
        legend.key=element_blank(),
        legend.background = element_rect(colour = "black"),
        legend.key.height=unit(0,"cm"))+
  theme(plot.title = element_text(size=15,colour = "black",hjust = 0.5,face = "bold")) +
  geom_text(aes(label=sample),size=5,hjust=0.5,vjust=-1)

p

ggsave(paste("./", "PCoA.pdf", sep=""), p, width = 6.5, height = 5)

#PERMANOVA
comparision.site <- adonis2(data ~ site, data = groups, permutations = 9999,distance = "bray")
summary(comparision.site)
capture.output(comparision.site,file = "comparision_site.txt" )

