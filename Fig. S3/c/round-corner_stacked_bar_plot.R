# install.packages("ggchicklet",repos = "https://cinc.rud.is")                 # Install & load ggchicklet package
# ：https://statisticsglobe.com/draw-ggplot2-barplot-round-corners-r
                 
library("ggchicklet")
library("ggplot2")

df <- read.table("input.txt", header = T)

ggplot(df, aes(group, value, fill = sub)) +    # Stacked barplot with round corners
  geom_chicklet(radius = grid::unit(3, "mm"))
