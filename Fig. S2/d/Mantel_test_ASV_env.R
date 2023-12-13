library(linkET)
library(ggplot2)
library(dplyr)


micro <- read.delim('microbe_abundance.txt', row.names = 1)
micro <- t(micro)
env <- read.delim('env.txt', row.names = 1)

# Mantel test
mantel <- mantel_test(spec = micro, env = env, spec_select = list(Prokaryotes = 1:1124, Cell_enriched_viruses = 1125:9308, Virus_enriched_viruses = 9308:15493), mantel_fun = 'mantel')
mantel <- mutate(mantel, 
                 rd = cut(r, breaks = c(-Inf, 0.2, 0.4, Inf), labels = c('< 0.2', '0.2 - 0.4', '>= 0.4')),
                 pd = cut(p, breaks = c(-Inf, 0.01, 0.05, Inf), labels = c('< 0.01', '0.01 - 0.05', '>= 0.05'))
)
mantel


p <- qcorrplot(correlate(env, method = 'spearman'), type = 'upper', diag = FALSE) + 
  geom_square() + 
  geom_mark(sep = '\n', size = 2.5, sig.thres = 0.05) + 
  geom_couple(aes(color = pd, size = rd), data = mantel, curvature = nice_curvature()) +  
  scale_fill_gradientn(colors = c('#053061', '#68A8CF', 'white', '#F7B394', '#67001F'), limits = c(-1, 1)) +  
  scale_size_manual(values = c(0.5, 1, 2)) +  
  scale_color_manual(values = c('#D73027', '#FCAD6E', '#E0E0E0')) + 
  guides(color = guide_legend(title = "Mantel's p", order = 1), 
         size = guide_legend(title = "Mantel's r", order = 2), 
         fill = guide_colorbar(title = "Spearman's r", order = 3)) +
  theme(legend.key = element_blank())

p

ggsave(paste("./", "Mantel_test.pdf", sep=""), p, width = 12, height = 10)



