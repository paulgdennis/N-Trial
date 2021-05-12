# 9 Microbiome - Beta diversity analyses

#### 16S

# All
adonis(sqrt(otu.16S) ~ Compartment * factor(Rate), data = env.16S.all, method='euc')

otu.16S.pca <- rda(sqrt(otu.16S))
custom.plot.pca(otu.16S.pca, factor(env.16S.all$Rate), "", "n")
custom.plot.pca(otu.16S.pca, env.16S.all$Compartment, "", "n")

otu.16S.rda <- rda(sqrt(otu.16S) ~ Compartment + factor(Rate), data=env.16S.all)

custom.plot.rda(otu.16S.rda, factor(env.16S.all$Rate), "", "n", 30, 3)

# Soil
adonis(sqrt(otu.16S.soil) ~ factor(Rate), data = env.16S.soil, method='euc')

otu.16S.soil.pca <- rda(sqrt(otu.16S.soil))
custom.plot.pca(otu.16S.soil.pca, factor(env.16S.soil$Rate), "", "n")

otu.16S.soil.rda <- rda(sqrt(otu.16S.soil) ~ factor(Rate), data=env.16S.soil)
custom.plot.rda(otu.16S.soil.rda, factor(env.16S.soil$Rate), "", "n", 30, 3)

# Ecto
adonis(sqrt(otu.16S.ecto) ~ factor(Rate), data = env.16S.ecto, method='euc')

otu.16S.ecto.pca <- rda(sqrt(otu.16S.ecto))
custom.plot.pca(otu.16S.ecto.pca, factor(env.16S.ecto$Rate), "", "n")

# Endo
adonis(sqrt(otu.16S.endo) ~ factor(Rate), data = env.16S.endo, method='euc')

otu.16S.endo.pca <- rda(sqrt(otu.16S.endo))
custom.plot.pca(otu.16S.endo.pca, factor(env.16S.endo$Rate), "", "n")

otu.16S.endo.rda <- rda(sqrt(otu.16S.endo) ~ factor(Rate), data=env.16S.endo)
custom.plot.rda(otu.16S.endo.rda, factor(env.16S.endo$Rate), "", "n", 30, 3)



### ITS

# All
adonis(sqrt(otu.ITS) ~ Compartment * factor(Rate), data = env.ITS.all, method='euc')

otu.ITS.pca <- rda(sqrt(otu.ITS))
custom.plot.pca(otu.ITS.pca, factor(env.ITS.all$Rate), "", "n")
custom.plot.pca(otu.ITS.pca, env.ITS.all$Compartment, "", "n")

otu.ITS.rda <- rda(sqrt(otu.ITS) ~ Compartment + factor(Rate), data=env.ITS.all)

custom.plot.rda(otu.ITS.rda, factor(env.ITS.all$Rate), "", "n", 30, 3)
custom.plot.rda(otu.ITS.rda, env.ITS.all$Compartment, "", "n", 30, 3)

# Soil
adonis(sqrt(otu.ITS.soil) ~ factor(Rate), data = env.ITS.soil, method='euc')

otu.ITS.soil.pca <- rda(sqrt(otu.ITS.soil))
custom.plot.pca(otu.ITS.soil.pca, factor(env.ITS.soil$Rate), "", "n")

otu.ITS.soil.rda <- rda(sqrt(otu.ITS.soil) ~ factor(Rate), data=env.ITS.soil)
custom.plot.rda(otu.ITS.soil.rda, factor(env.ITS.soil$Rate), "", "n", 30, 3)

# Ecto
adonis(sqrt(otu.ITS.ecto) ~ factor(Rate), data = env.ITS.ecto, method='euc')

otu.ITS.ecto.pca <- rda(sqrt(otu.ITS.ecto))
custom.plot.pca(otu.ITS.ecto.pca, factor(env.ITS.ecto$Rate), "", "n")

# Endo
adonis(sqrt(otu.ITS.endo) ~ factor(Rate), data = env.ITS.endo, method='euc')

otu.ITS.endo.pca <- rda(sqrt(otu.ITS.endo))
custom.plot.pca(otu.ITS.endo.pca, factor(env.ITS.endo$Rate), "", "n")

otu.ITS.endo.rda <- rda(sqrt(otu.ITS.endo) ~ factor(Rate), data=env.ITS.endo)
custom.plot.rda(otu.ITS.endo.rda, factor(env.ITS.endo$Rate), "", "n", 30, 3)

#Heatmap

pal <- colorRampPalette(c("White", "Black"))
jpeg("../Data/16S/Heatmap.jpeg")
heatmap(sqrt(otu.16S.hm), Colv = NA, Rowv = NA, trace = "none", scale = "none", col = pal(250))
dev.off()
      
# Fusarium oxysporum
adonis(sqrt(otu.ITS.soil[,"Otu3"]) ~ factor(Rate), data = env.ITS.soil, method='euc')
adonis(sqrt(otu.ITS.ecto[,"Otu3"]) ~ factor(Rate), data = env.ITS.ecto, method='euc')
adonis(sqrt(otu.ITS.endo[,"Otu3"]) ~ factor(Rate), data = env.ITS.endo, method='euc')

bargraph.CI(factor(env.ITS.soil$Rate), sqrt(otu.ITS.soil[,"Otu3"]), main="OTU3 F. oxysporum - Soil")
bargraph.CI(factor(env.ITS.ecto$Rate), sqrt(otu.ITS.ecto[,"Otu3"]), main="OTU3 F. oxysporum - Ecto")
bargraph.CI(factor(env.ITS.endo$Rate), sqrt(otu.ITS.endo[,"Otu3"]), main="OTU3 F. oxysporum - Endo")

# Fusarium 
adonis(sqrt(otu.ITS.soil[,"Otu25"]) ~ factor(Rate), data = env.ITS.soil, method='euc')
adonis(sqrt(otu.ITS.ecto[,"Otu25"]) ~ factor(Rate), data = env.ITS.ecto, method='euc')
adonis(sqrt(otu.ITS.endo[,"Otu25"]) ~ factor(Rate), data = env.ITS.endo, method='euc')

bargraph.CI(factor(env.ITS.soil$Rate), sqrt(otu.ITS.soil[,"Otu3"]), main="OTU3 F. oxysporum - Soil")
bargraph.CI(factor(env.ITS.ecto$Rate), sqrt(otu.ITS.ecto[,"Otu3"]), main="OTU3 F. oxysporum - Ecto")
bargraph.CI(factor(env.ITS.endo$Rate), sqrt(otu.ITS.endo[,"Otu3"]), main="OTU3 F. oxysporum - Endo")



bargraph.CI(factor(env.ITS.soil$Rate), sqrt(otu.ITS.soil[,"Otu84"]), main="OTU84 Fusarium unc. - Soil")
bargraph.CI(factor(env.ITS.ecto$Rate), sqrt(otu.ITS.ecto[,"Otu84"]), main="OTU84 Fusarium unc. - Ecto")
bargraph.CI(factor(env.ITS.endo$Rate), sqrt(otu.ITS.endo[,"Otu84"]), main="OTU84 Fusarium unc. - Endo")

dotu <- c("Otu3","Otu136","Otu200","Otu135","Otu166","Otu6","Otu8","Otu25","Otu63","Otu84")

summary(aov(sqrt(otu.ITS.soil[,"Otu3"]) ~ factor(env.ITS.soil$Rate)))
summary(aov(sqrt(otu.ITS.ecto[,"Otu3"]) ~ factor(env.ITS.ecto$Rate)))
summary(aov(sqrt(otu.ITS.endo[,"Otu3"]) ~ factor(env.ITS.endo$Rate)))

for(i in dotu) {
  print(i)
  print(summary(aov(sqrt(otu.ITS.soil[,i]) ~ factor(env.ITS.soil$Rate))))
}

for(i in dotu) {
  print(i)
  print(summary(aov(sqrt(otu.ITS.ecto[,i]) ~ factor(env.ITS.ecto$Rate))))
}

for(i in dotu) {
  print(i)
  print(summary(aov(sqrt(otu.ITS.endo[,i]) ~ factor(env.ITS.endo$Rate))))
}

