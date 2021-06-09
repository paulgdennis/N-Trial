### Enzymes

adonis(enzymes ~ factor(Rate), data=data.all, method='euc')

enzymes.rda <- rda(enzymes ~ factor(Rate), data=data.all)
custom.plot.rda(enzymes.rda, factor(data.all$Rate), "","n", 3, 3)
plot(enzymes.rda, type='t', scaling=3)
points(enzymes.rda, dis="sites", pch=21, bg = factor(data.all$Rate), cex=2, scaling=3)

for(i in colnames(enzymes)) {
  print(i)
  print(summary(aov(enzymes[,i] ~ factor(data.all$Rate))))
  }

for(i in colnames(enzymes)) {
  print(i)
  print(cld(lsmeans(aov(enzymes[,i] ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}

svg("../Data/Figures/Enzyme_barplot_a.gluc.svg")
bargraph.CI(data.all$Rate, enzymes$a.gluc)
dev.off()

cld(lsmeans(aov(enzymes$a.gluc ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/Enzyme_barplot_b.gluc.svg")
bargraph.CI(data.all$Rate, enzymes$B.gluc)
dev.off()

cld(lsmeans(aov(enzymes$B.gluc ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/Enzyme_barplot_phos.svg")
bargraph.CI(data.all$Rate, enzymes$Phos)
dev.off()

cld(lsmeans(aov(enzymes$Phos ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/Enzyme_barplot_sulf.svg")
bargraph.CI(data.all$Rate, enzymes$Sulf)
dev.off()

cld(lsmeans(aov(enzymes$Sulf ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/Enzyme_barplot_chit.svg")
bargraph.CI(data.all$Rate, enzymes$Chit)
dev.off()

cld(lsmeans(aov(enzymes$Chit ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/Enzyme_barplot_xyl.svg")
bargraph.CI(data.all$Rate, enzymes$Xyl)
dev.off()

cld(lsmeans(aov(enzymes$Xyl ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey"))
