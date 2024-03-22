# install.packages("ggiraphExtra")
library(ggiraphExtra)
library(ggplot2)
library(ggiraph)
library(plyr)
data_1 <- read.table("KSW-vMAGs_tax.txt",header=T,sep = "\t")
p_1 <- ggPieDonut(data_1, aes(pies=profile, donuts = Phylum))
p_1
ggsave(paste("./", "KSW-vMAGs_tax_phylum.pdf", sep=""), p_1, width = 4, height = 5)


data_2 <- read.table("KSW-vMAGs_tax_detailed.txt",header=T,sep = "\t")
p_2 <- ggPieDonut(data_2, aes(pies=Phylum, donuts = Family))
p_2
ggsave(paste("./", "KSW-vMAGs_tax_family.pdf", sep=""), p_2, width = 4, height = 5)


