suppressWarnings(suppressMessages(library(amplicon)))
library(phyloseq)

metadata=read.table("metadata.txt", header=T, row.names=1, sep="\t", comment.char="", stringsAsFactors=F)
otutab_rare=read.table("cf_KSW-vOTUs_abundance.txt", header=T, row.names=1, sep="\t", comment.char="", stringsAsFactors=F)


result=BetaDiv(otu=otutab_rare, map=metadata, group="total",
               dist="bray", method="PCoA", Micromet="adonis")




(p=result[[1]])
ggsave(paste0("p3.PCoA.bray.jpg"), p, width=89, height=56, units="mm")
ggsave(paste0("p3.PCoA.bray.pdf"), p, width=89, height=56, units="mm")



plotdata=result[[2]]
plotdata[1:3,1:3]


(p=result[[3]])
ggsave(paste0("p4.PCoA.bray.label.jpg"), p, width=89, height=56, units="mm")
ggsave(paste0("p4.PCoA.bray.label.pdf"), p, width=89, height=56, units="mm")



(pair=result[[4]])
write.table (result[4], file ="pair_difference.txt", sep ="\t", row.names =TRUE, col.names =TRUE, quote =TRUE)



(Mtest=result[[5]])
write.table (result[5], file ="all_difference.txt", sep ="\t", row.names =TRUE, col.names =TRUE, quote =TRUE)








