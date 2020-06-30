#check for normality and apply transformations
library(ggplot2)
library(ggpubr)

for(i in colnames(nem.taxa)) {
  print(i)
ggdensity(enzymes[,i], 
          main = i,
}


for(i in colnames(nem.taxa)) {
  print(i)
  print(ggdensity(nem.taxa[,i],
                  main = i))
}
