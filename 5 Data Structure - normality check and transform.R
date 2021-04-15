#check for normality and apply transformations
library(ggplot2)
library(ggpubr)


#Change the below to the appropriate data and transformation desired

for(i in colnames(nem.troph)) {
  print(i)
  print(ggdensity(sqrt(nem.troph[,i]),
                  main = i))
}
