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
Rate<-as.data.frame(data.all$Rate)
rows<-c(1:6,7:12)

adonis(sqrt(nem.taxa[rows,]) ~ Rate[rows,], method = 'euc')


for(i in colnames(nem.taxa)) {
  print(i)
  print(summary(aov(sqrt(nem.taxa[,i]) ~ data.all$Rate)))
}

for(i in colnames(nem.taxa)) {
  print(i)
  print(TukeyHSD(aov(sqrt(nem.taxa[,i]) ~ factor(data.all$Rate))))
}


library(mvabund)
mvobj<-mvabund(nem.taxa)
manyglmobj<-manyglm(mvobj
                    ~ factor(data.all$Rate))
plot.manyglm(manyglmobj)
print(summary(manyglmobj))

for(i in colnames(nem.taxa)) {
  print(i)
  mvobj<-mvabund(nem.taxa[,i])
  manyglmobj<-manyglm(mvobj
                      ~ factor(data.all$Rate))
  plot.manyglm(manyglmobj)
  print(summary(manyglmobj))
}

# Visualise differences in community composition

nem.taxa.rda <- rda(sqrt(nem.taxa) ~ data.all$Rate) # RDA
custom.plot.rda(nem.taxa.rda, group = factor(data.all$Rate), title = "", plottype = "n", sd.val = 3, scaling.val = 2)

nem.taxa.pcoa <- pcoa(sqrt(nem.taxa)) # PCoA
custom.plot.pcoa(ord = nem.taxa.pcoa, group = factor(data.all$Rate), title = "", plottype = "n")

nem.taxa.pca <- rda(sqrt(nem.taxa)) # PCA
custom.plot.pca(ord = nem.taxa.pca, group = factor(data.all$Rate), title = "", plottype = "n")
