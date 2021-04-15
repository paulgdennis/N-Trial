# 7 Abiotic properties

# Run an ANOVA on each parameter with rate as a factor
for(i in colnames(soil.chem)){
  print(i)
  print(anova(lm(soil.chem[,i] ~ factor(Rate), data=data.all[-9,])))
  }

# Run posthoc analyses to determine which rates differ
for(i in colnames(soil.chem)) {
  print(i)
  print(cld(lsmeans(aov(soil.chem[,i] ~ factor(Rate), data= data.all[-9,]), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
  }

# Barcharts
bargraph.CI(data.all[-9,]$Rate, soil.chem$pH.h2o, main="pH")

for(i in colnames(soil.chem)){
  bargraph.CI(data.all[-9,]$Rate, soil.chem[,i], main=i)
  }

# Correlation matrix
abiotic.pval <- round(cor.mtest(cor(soil.chem)),3) # P values
abiotic.rval <- round((cor(soil.chem)),3) # R values

corrplot(cor(soil.chem), method="circle", type='upper', diag = FALSE,
         p.mat = abiotic.pval, insig = "blank") # Correlogram -- to show x for NS:: pch.cex = 1, pch.col = "gray"

# Multivariate analysis
soil.chem.z <- decostand(soil.chem, method='standardize')
adonis(soil.chem.z ~ factor(Rate), data = data.all[-9,], method='euc')

soil.chem.z.rda <- rda(soil.chem.z ~ factor(Rate), data = data.all[-9,])
custom.plot.rda(soil.chem.z.rda, factor(data.all[-9,]$Rate),"","n",3, 3)
#plot(soil.chem.z.rda, type='t', scaling = 3)
#points(soil.chem.z.rda, dis = 'sites', pch=21, bg=factor(data.all[-9,]$Rate), cex=2, scaling = 3)