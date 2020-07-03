#check for normality and apply transformations
library(ggplot2)
library(ggpubr)

for(i in colnames(nem.troph)) {
  print(i)
  print(ggdensity(sqrt(nem.troph[,i]),
                  main = i))
}
