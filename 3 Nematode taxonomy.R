### 3 Nematode taxa

# 1) Total nematodes

summary(aov(data.all$Tot.Nem ~ factor(data.all$Rate)))
TukeyHSD(aov(data.all$Tot.Nem ~ factor(data.all$Rate)))
cld(lsmeans(aov(data.all$Tot.Nem ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

#svg('../Data/Plots/Total_nematodes.svg')
bargraph.CI(data.all$Rate, data.all$Tot.Nem)
#dev.off()


# 2) Nematode trophic groups

for(i in names(nem.troph)){
  print(i)
  print(summary(aov(nem.troph[,i] ~ factor(data.all$Rate))))
}

for(i in names(nem.troph)){
  print(i)
  print(cld(lsmeans(aov(nem.troph[,i] ~ factor(Rate), data= data.all), 
                    ~ factor(Rate), Letters = letters, adjust = "Tukey")))
  }

svg('../Data/Plots/Plant_parasitic_nematodes.svg')
bargraph.CI(data.all$Rate, nem.troph$Para)
dev.off()

svg('../Data/Plots/Fungivorous_nematodes.svg')
bargraph.CI(data.all$Rate, nem.troph$Fung)
dev.off()

svg('../Data/Plots/Bacterivorous_nematodes.svg')
bargraph.CI(data.all$Rate, nem.troph$Bact)
dev.off()

svg('../Data/Plots/Predatory_nematodes.svg')
bargraph.CI(data.all$Rate, nem.troph$Pred)
dev.off()

svg('../Data/Plots/Omnivorous_nematodes.svg')
bargraph.CI(data.all$Rate, nem.troph$Omn)
dev.off()


# 3) Nematode community composition (Hellinger transformed taxonomic groups)

adonis(decostand(nem.taxa,method = "hellinger") ~ factor(data.all$Rate), method='euc')

nem.taxa.rda <- rda(decostand(nem.taxa,method = "hellinger") ~ factor(data.all$Rate)) # RDA
custom.plot.rda(nem.taxa.rda, group = factor(data.all$Rate), title = "", plottype = "t", sd.val = 3, scaling.val = 2)

nem.taxa.pcoa <- pcoa(decostand(nem.taxa,method = "hellinger")) # PCoA
custom.plot.pcoa(ord = nem.taxa.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.taxa.pca <- rda(decostand(nem.taxa,method = "hellinger")) # PCA

svg('../Data/Plots/Nematode_PCA.svg')
custom.plot.pca(ord = nem.taxa.pca, group = factor(data.all$Rate), title = "", plottype = "t")
dev.off()

for(i in colnames(nem.taxa)) {
  print(i)
  print(summary(aov(nem.taxa[,i] ~ data.all$Rate)))
}

for(i in colnames(nem.taxa)) {
  print(i)
  print(cld(lsmeans(aov(nem.taxa[,i] ~ factor(Rate), data= data.all), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}


# 4) Alpha diversity

summary(aov(data.all$taxa ~ factor(data.all$Rate)))

#Nematode function

#Composition

adonis(sqrt(nem.fun1) ~ data.all$Rate, method = 'euc')

#Individual Species & Pairwise

for(i in colnames(nem.fun1)) {
  print(i)
  print(summary(aov(sqrt(nem.fun1[,i]) ~ data.all$Rate)))
}

for(i in colnames(nem.fun1)) {
  print(i)
  print(TukeyHSD(aov(sqrt(nem.fun1[,i]) ~ factor(data.all$Rate))))
}

#Visualisations

nem.fun1.rda <- rda(sqrt(nem.fun1) ~ data.all$Rate) # RDA
custom.plot.rda(nem.fun1.rda, group = factor(data.all$Rate), title = "", plottype = "n", sd.val = 3, scaling.val = 2)

nem.fun1.pcoa <- pcoa(sqrt(nem.fun1)) # PCoA
custom.plot.pcoa(ord = nem.fun1.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.fun1.pca <- rda(sqrt(nem.fun1)) # PCA
custom.plot.pca(ord = nem.fun1.pca, group = factor(data.all$Rate), title = "", plottype = "n")


#Nematode Troph

#Composition

adonis(sqrt(nem.troph) ~ data.all$Rate, method = 'euc')


#Individual Species & Pairwise

for(i in colnames(nem.troph)) {
  print(i)
  print(summary(aov(sqrt(nem.troph[,i]) ~ data.all$Rate)))
}

for(i in colnames(nem.troph)) {
  print(i)
  print(TukeyHSD(aov(sqrt(nem.troph[,i]) ~ factor(data.all$Rate))))
}


#Visualisations

nem.troph.rda <- rda(sqrt(nem.troph) ~ data.all$Rate) # RDA
custom.plot.rda(nem.troph.rda, group = factor(data.all$Rate), title = "", plottype = "n", sd.val = 3, scaling.val = 2)

nem.troph.pcoa <- pcoa(sqrt(nem.troph)) # PCoA
custom.plot.pcoa(ord = nem.troph.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.troph.pca <- rda(sqrt(nem.troph)) # PCA
custom.plot.pca(ord = nem.troph.pca, group = factor(data.all$Rate), title = "", plottype = "n")

#Indecies

for(i in colnames(nem.indices)) {
  print(i)
  print(summary(aov(nem.indices[,i] ~ data.all$Rate)))
}

for(i in colnames(nem.indices)) {
  print(i)
  print(TukeyHSD(aov(nem.indices[,i] ~ factor(data.all$Rate))))
}
