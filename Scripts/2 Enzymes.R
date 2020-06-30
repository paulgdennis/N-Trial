### Enzymes

source('Functions/Functions.R')

for(i in colnames(enzymes)) {
  print(i)
  print(summary(aov(enzymes[,i] ~ data.all$Rate)))
  }

for(i in colnames(enzymes)) {
  print(i)
  print(TukeyHSD(aov(enzymes[,i] ~ factor(data.all$Rate))))
}


library(mvabund)
for(i in colnames(enzymes)) {
  print(i)
  mvobj<-mvabund(enzymes[,i])
  manyglmobj<-manyglm(mvobj
                    ~ factor(data.all$Rate))

  plot.manyglm(manyglmobj)
  print(summary(manyglmobj))
}

library(sciplot)
svg("C:/Users/cfors/Dropbox/Alpha/Field experiment/R/N-Trial/Plots/Enzme_barplots.svg")
par(mfrow=c(3,2))
bargraph.CI(data.all$Rate, enzymes$a.gluc)
bargraph.CI(data.all$Rate, enzymes$B.gluc)
bargraph.CI(data.all$Rate, enzymes$Phos)
bargraph.CI(data.all$Rate, enzymes$Sulf)
bargraph.CI(data.all$Rate, enzymes$Chit)
bargraph.CI(data.all$Rate, enzymes$Xyl)
dev.off()
