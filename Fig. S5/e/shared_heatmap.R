library(dplyr)
library(vegan)
data=read.table("vOTUs_abundance.txt",header = 1,row.names = 1)
data=na.omit(data)
group=read.table("groups.txt",header = T,stringsAsFactors = T)
rpkm=as.data.frame(apply(data, 2, function(x){sum(x>1)}))
rpkm$type=group$type
colnames(rpkm)[1]="value"


source("new.cbind.R")

nd=matrix(NA,0,0)
for (i in 1:ncol(data)){
  col=as.matrix(data[,i])
  rownames(col)=rownames(data)
  col=as.matrix(col[col[,1]>0,])
  colnames(col)=colnames(data)[i]
  nd=as.matrix(new.cbind(nd,col))
}


for(i in 1:nrow(nd)){
  for (j in 1:ncol(nd)){
    if(is.na(nd[i,j])==FALSE){
      nd[i,j]=1
    }
    else{
      nd[i,j]=0
    }
  }
}


write.table(nd,"vOTUs_abundance_0-1.txt",sep = "\t", col.names = NA)



share=matrix(NA,ncol(nd),ncol(nd))
for (i in 1:ncol(nd)){
  for (j in 1:ncol(nd)){
    print(j)
    sum=as.matrix(apply(nd[,c(i,j)],1,sum))
    shared=as.data.frame(nrow(nd[sum==2,]))
    if(nrow(shared)>0){
      a=sum(nd[,i])
      b=sum(nd[,j])
      viral_shared_content=((shared/a)+(shared/b))/2
      share[i,j]=viral_shared_content[1,1]
    }else{
      share[i,j]==0
    }
  }
}

colnames(share)=colnames(nd)
rownames(share)=colnames(nd)
share[is.na(share)]=0
# The “proportion of shared vOTUs” that were present in different samples was calculated through the equation:
# Proportion of shared vOTUs = ((Sn/a) + (Sn/b))/2
# “a” represents the numbers of vOTUs presented in one sample
# “b” represents the number of vOTUs presented in another samples
# “Sn” represented the numbers of shared vOTUs between the samples “a” and “b”.
# Reference: Liao H, Li H, Duan CS et al (2022) Response of soil viral communities to land use changes. Nat Commun 13: 6027. doi: 10.1038/s41467-022-33771-2



write.table(share,"shared_vOTUs_proportion.txt",sep = "\t", col.names = NA)


library(pheatmap)
library(ggplot2)
annotation=as.data.frame(group[2])
rownames(annotation)=group[,1]
colnames(annotation)=c("type")
log2.share <- log2(share + 1)
p <- pheatmap(log2.share,cutree_rows = 4,cutree_cols =4,
         border_color = "grey",
         color = colorRampPalette(c("white","black"))(10000),
         clustering_method = "average",
         annotation_col = annotation)

p

ggsave(paste("./", "shared_vOTUs_heatmap.pdf", sep=""), p, width = 6, height = 5)

