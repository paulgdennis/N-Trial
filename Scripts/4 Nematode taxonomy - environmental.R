### 4 Nematode taxa - environmental drivers

source('Functions/Functions.R')

## individual populations

for(i in colnames(nem.taxa)) {
  print(i)
  print(summary(aov(nem.taxa[,i] ~ data.all$Rate)))
}


## Nematode diversity

# Alpha diversity

summary(aov(data.all$taxa ~ data.all$Rate))


# Beta diversity - row 9 has NA's so remove


for(i in colnames(soil.chem[-9,])) {
  print(i)
  print(adonis(sqrt(nem.taxa[-9,]) ~ soil.chem[-9,i], method = 'euc')[[1]][1,6])
  }

for(i in colnames(soil.chem[-9,])) {
  print(i)
  print(adonis(sqrt(nem.taxa[-9,]) ~ Rate + soil.chem[-9,i], data = data.all[-9,], method='euc'))
}
plot(data.all$Rate, data.all$CEC)


for(i in colnames(soil.chem)) {
  print(i)
  print(summary(aov(soil.chem[-9,i] ~ RateM[-9,])))
}

#variance partitioning
Rate<-as.data.frame(data.all$Rate)
RateM<-as.matrix(Rate)

for(i in colnames(soil.chem[-9,])) {
  print(i)
  varp<-varpart(sqrt(nem.taxa[-9,]), ~ RateM[-9], soil.chem[-9,i])
  print(varp)
  rda1<-rda(sqrt(nem.taxa[-9,]) ~ soil.chem[-9,i] + Condition (RateM[-9]))
  print(anova(rda1))
  plot(varp)
  }


# Visualise differences in community composition

nem.taxa.rda <- rda(sqrt(nem.taxa) ~ data.all$Rate) # RDA
custom.plot.rda(nem.taxa.rda, group = factor(data.all$Rate), title = "", plottype = "n", sd.val = 3, scaling.val = 2)

nem.taxa.rda <- rda(sqrt(nem.taxa[-9,]) ~ soil.chem[-9,21] + Condition (RateM[-9])) # RDA
custom.plot.rda(nem.taxa.rda, group = factor(soil.chem[-9,21]), title = "", plottype = "n", sd.val = 3, scaling.val = 2)


nem.taxa.pcoa <- pcoa(sqrt(nem.taxa)) # PCoA
custom.plot.pcoa(ord = nem.taxa.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.taxa.pca <- rda(sqrt(nem.taxa)) # PCA
custom.plot.pca(ord = nem.taxa.pca, group = factor(data.all$Rate), title = "", plottype = "n")


#nem.fun1

for(i in colnames(soil.chem[-9,])) {
  print(i)
  print(adonis(sqrt(nem.fun1[-9,]) ~ soil.chem[-9,i], method = 'euc')[[1]][1,6])
}


#nem.troph

for(i in colnames(soil.chem[-9,])) {
  print(i)
  print(adonis(sqrt(nem.troph[-9,]) ~ soil.chem[-9,i], method = 'euc')[[1]][1,6])
}


#Indecies

for(i in colnames(nem.indices)) {
  print(i)
  print(summary(aov(nem.indices[,i] ~ data.all$Rate)))
}

for(i in colnames(nem.indices)) {
  print(i)
  print(TukeyHSD(aov(nem.indices[,i] ~ factor(data.all$Rate))))
}
