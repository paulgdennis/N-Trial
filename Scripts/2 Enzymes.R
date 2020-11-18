### Enzymes

for(i in colnames(enzymes)) {
  print(i)
  print(summary(aov(enzymes[,i] ~ factor(data.all$Rate))))
  }

for(i in colnames(enzymes)) {
  print(i)
  print(cld(lsmeans(aov(enzymes[,i] ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}

#svg("C:/Users/cfors/Dropbox/Alpha/Field experiment/R/N-Trial/Plots/Enzyme_barplots.svg")
#par(mfrow=c(3,2))
bargraph.CI(data.all$Rate, enzymes$a.gluc)
bargraph.CI(data.all$Rate, enzymes$B.gluc)
bargraph.CI(data.all$Rate, enzymes$Phos)
bargraph.CI(data.all$Rate, enzymes$Sulf)
bargraph.CI(data.all$Rate, enzymes$Chit)
bargraph.CI(data.all$Rate, enzymes$Xyl)
#dev.off()
