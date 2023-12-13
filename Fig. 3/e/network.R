library("igraph")
network <- read.table("Flavobacteriaceae_network.txt", header=T, sep="\t", comment.char="", stringsAsFactors=F)
nodes <- read.table("Flavobacteriaceae_annotation.txt", header=T, sep="\t", comment.char="", stringsAsFactors=F)

g <- graph_from_data_frame(network, directed=T, vertices=nodes)


g <- simplify(g, remove.multiple = T, remove.loops = T) 

plot(g,  layout = layout_with_fr(g, niter = 10000), 
     vertex.shape='circle',                     
     vertex.size = nodes$size * 5,                   
     vertex.color= nodes$color,                      
     vertex.label = nodes$genus,                    
     vertex.label.cex=0.8,                          
     vertex.label.color='black',                     
     vertex.label.dist=0.4,                         
     edge.arrow.size=0,                              
     edge.width = 2,                              
     edge.curved = 0.2,                             
     edge.color="gray",                           
     )
