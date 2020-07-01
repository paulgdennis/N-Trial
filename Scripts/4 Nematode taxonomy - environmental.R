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

adonis(sqrt(nem.taxa)~data.all$Rate, method='euc')

for(i in colnames(soil.chem[-9,])) {
  print(i)
  print(adonis(sqrt(nem.taxa[-9,]) ~ Rate + soil.chem[-9,i], data = data.all[-9,], method='euc'))
}
plot(data.all$Rate, data.all$CEC)


anova.cca(nem.taxa[-9,]~RateM[-9]+(soil.chem[-9,1]))

library(mvabund)
mvobj<-mvabund(nem.taxa[-9,])
manyglmobj<-manyglm(mvobj
                    ~ factor(soil.chem[-9,2]),composition=TRUE)
plot.manyglm(manyglmobj)
print(summary.manyglm(manyglmobj))

manyglmobj<-manyglm(mvobj
                    ~ factor(soil.chem[-9,2]))
anova.manyglm(manyglmobj)

for(i in colnames(soil.chem)) {
  print(i)
  mvobj<-mvabund(nem.taxa[-9,])
  manyglmobj<-manyglm(mvobj
                      ~ factor(soil.chem[-9,i]*RateM[-9,]))
  plot.manyglm(manyglmobj)
  #print(summary(manyglmobj))
  print(anova.manyglm(manyglmobj))
}



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
