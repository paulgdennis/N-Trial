### 3 Nematode taxa

source('Functions/Functions.R')

## individual populations

for(i in colnames(nem.taxa)) {
  print(i)
  print(summary(aov(nem.taxa[,i] ~ data.all$Rate)))
}


## Nematode diversity

# Alpha diversity

summary(aov(data.all$taxa ~ data.all$Rate))



# Beta diversity

adonis(sqrt(nem.taxa) ~ data.all$Rate, method = 'euc')

summary(aov(data.all$Tot.Nem ~ data.all$Rate))
TukeyHSD(aov(data.all$Tot.Nem ~ factor(data.all$Rate)))

for(i in colnames(nem.taxa)) {
  print(i)
  print(summary(aov(sqrt(nem.taxa[,i]) ~ data.all$Rate)))
}

for(i in colnames(nem.taxa)) {
  print(i)
  print(TukeyHSD(aov(sqrt(nem.taxa[,i]) ~ factor(data.all$Rate))))
}


# Visualise differences in community composition

nem.taxa.rda <- rda(sqrt(nem.taxa) ~ data.all$Rate) # RDA
custom.plot.rda(nem.taxa.rda, group = factor(data.all$Rate), title = "", plottype = "n", sd.val = 3, scaling.val = 2)

nem.taxa.pcoa <- pcoa(sqrt(nem.taxa)) # PCoA
custom.plot.pcoa(ord = nem.taxa.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.taxa.pca <- rda(sqrt(nem.taxa)) # PCA
custom.plot.pca(ord = nem.taxa.pca, group = factor(data.all$Rate), title = "", plottype = "n")

#nem.fun1

adonis(sqrt(nem.fun1) ~ data.all$Rate, method = 'euc')

for(i in colnames(nem.fun1)) {
  print(i)
  print(summary(aov(sqrt(nem.fun1[,i]) ~ data.all$Rate)))
}

for(i in colnames(nem.fun1)) {
  print(i)
  print(TukeyHSD(aov(sqrt(nem.fun1[,i]) ~ factor(data.all$Rate))))
}

nem.fun1.rda <- rda(sqrt(nem.fun1) ~ data.all$Rate) # RDA
custom.plot.rda(nem.fun1.rda, group = factor(data.all$Rate), title = "", plottype = "n", sd.val = 3, scaling.val = 2)

nem.fun1.pcoa <- pcoa(sqrt(nem.fun1)) # PCoA
custom.plot.pcoa(ord = nem.fun1.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.fun1.pca <- rda(sqrt(nem.fun1)) # PCA
custom.plot.pca(ord = nem.fun1.pca, group = factor(data.all$Rate), title = "", plottype = "n")


#nem.troph

adonis(sqrt(nem.troph) ~ data.all$Rate, method = 'euc')

for(i in colnames(nem.troph)) {
  print(i)
  print(summary(aov(sqrt(nem.troph[,i]) ~ data.all$Rate)))
}

for(i in colnames(nem.troph)) {
  print(i)
  print(TukeyHSD(aov(sqrt(nem.troph[,i]) ~ factor(data.all$Rate))))
}

nem.troph.rda <- rda(sqrt(nem.troph) ~ data.all$Rate) # RDA
custom.plot.rda(nem.troph.rda, group = factor(data.all$Rate), title = "", plottype = "n", sd.val = 3, scaling.val = 2)

nem.troph.pcoa <- pcoa(sqrt(nem.troph)) # PCoA
custom.plot.pcoa(ord = nem.troph.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.troph.pca <- rda(sqrt(nem.troph)) # PCA
custom.plot.pca(ord = nem.troph.pca, group = factor(data.all$Rate), title = "", plottype = "n")

#indecies

for(i in colnames(nem.indices)) {
  print(i)
  print(summary(aov(nem.indices[,i] ~ data.all$Rate)))
}

for(i in colnames(nem.indices)) {
  print(i)
  print(TukeyHSD(aov(nem.indices[,i] ~ factor(data.all$Rate))))
}
