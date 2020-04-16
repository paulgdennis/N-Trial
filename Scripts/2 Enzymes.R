### Enzymes

for(i in colnames(enzymes)) {
  print(i)
  print(summary(aov(enzymes[,i] ~ data.all$Rate)))
  }

for(i in colnames(enzymes)) {
  print(i)
  print(TukeyHSD(aov(enzymes[,i] ~ factor(data.all$Rate))))
}


library(sciplot)
bargraph.CI(data.all$Rate, enzymes$a.gluc)
