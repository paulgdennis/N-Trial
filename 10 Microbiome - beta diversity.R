# 9 Microbiome - Beta diversity analyses
#4 ordinations of beta diversity as a figure - all and then each of the 3 
#### 16S

# All
adonis(sqrt(otu.16S) ~ Compartment * factor(Rate), data = env.16S.all, method='euc')

otu.16S.pca <- rda(sqrt(otu.16S))
custom.plot.pca(otu.16S.pca, factor(env.16S.all$Rate), "", "n")
custom.plot.pca(otu.16S.pca, factor(env.16S.all$Compartment), "", "n")

otu.16S.rda <- rda(sqrt(otu.16S) ~ Compartment + factor(Rate), data=env.16S.all)
#use this one:
custom.plot.rda(otu.16S.rda, factor(env.16S.all$Compartment), "", "n", 30, 3)

svg("../Data/Figures/rda_compartment_16S_otu.svg")
belle.plot.rda(otu.16S.rda, factor(env.16S.all$Compartment), "", "n", 30, 3)
dev.off()

adonis(w.unifrac.16s.all ~ Compartment * factor(Rate), data = env.16S.all, method='euc')

# Soil
adonis(sqrt(otu.16S.soil) ~ factor(Rate), data = env.16S.soil, method='euc')

otu.16S.soil.pca <- rda(sqrt(otu.16S.soil))
custom.plot.pca(otu.16S.soil.pca, factor(env.16S.soil$Rate), "", "n")

otu.16S.soil.rda <- rda(sqrt(otu.16S.soil) ~ factor(Rate), data=env.16S.soil)
custom.plot.rda(otu.16S.soil.rda, factor(env.16S.soil$Rate), "", "n", 30, 3)

svg("../Data/Figures/rda_soil_rates.svg")
belle.plot.rda(otu.16S.soil.rda, factor(env.16S.soil$Rate), "", "n", 30, 3)
dev.off()

# Ecto
adonis(sqrt(otu.16S.ecto) ~ factor(Rate), data = env.16S.ecto, method='euc')

otu.16S.ecto.pca <- rda(sqrt(otu.16S.ecto))
custom.plot.pca(otu.16S.ecto.pca, factor(env.16S.ecto$Rate), "", "n")

svg("../Data/Figures/pca_ecto_rates.svg")
belle.plot.pca(otu.16S.ecto.pca, factor(env.16S.ecto$Rate), "", "n")
dev.off()

# Endo
adonis(sqrt(otu.16S.endo) ~ factor(Rate), data = env.16S.endo, method='euc')

otu.16S.endo.pca <- rda(sqrt(otu.16S.endo))
custom.plot.pca(otu.16S.endo.pca, factor(env.16S.endo$Rate), "", "n")

otu.16S.endo.rda <- rda(sqrt(otu.16S.endo) ~ factor(Rate), data=env.16S.endo)
custom.plot.rda(otu.16S.endo.rda, factor(env.16S.endo$Rate), "", "n", 30, 3)

svg("../Data/Figures/rda_endo_rates.svg")
belle.plot.rda(otu.16S.endo.rda, factor(env.16S.endo$Rate), "", "n", 30, 3)
dev.off()

### ITS

# All
adonis(sqrt(otu.ITS) ~ Compartment * factor(Rate), data = env.ITS.all, method='euc')

otu.ITS.pca <- rda(sqrt(otu.ITS))
custom.plot.pca(otu.ITS.pca, factor(env.ITS.all$Rate), "", "n")
custom.plot.pca(otu.ITS.pca, env.ITS.all$Compartment, "", "n")

otu.ITS.rda <- rda(sqrt(otu.ITS) ~ Compartment + factor(Rate), data=env.ITS.all)

custom.plot.rda(otu.ITS.rda, factor(env.ITS.all$Rate), "", "n", 30, 3)
custom.plot.rda(otu.ITS.rda, factor(env.ITS.all$Compartment), "", "n", 30, 3)

svg("../Data/Figures/rda_compartment_ITS.svg")
belle.plot.rda(otu.ITS.rda, factor(env.ITS.all$Compartment), "", "n", 30, 3)
dev.off()

# Soil
adonis(sqrt(otu.ITS.soil) ~ factor(Rate), data = env.ITS.soil, method='euc')

otu.ITS.soil.pca <- rda(sqrt(otu.ITS.soil))
custom.plot.pca(otu.ITS.soil.pca, factor(env.ITS.soil$Rate), "", "n")

otu.ITS.soil.rda <- rda(sqrt(otu.ITS.soil) ~ factor(Rate), data=env.ITS.soil)
custom.plot.rda(otu.ITS.soil.rda, factor(env.ITS.soil$Rate), "", "n", 30, 3)

svg("../Data/Figures/rda_Soil_ITS.svg")
belle.plot.rda(otu.ITS.soil.rda, factor(env.ITS.soil$Rate), "", "n", 30, 3)
dev.off()


# Ecto
adonis(sqrt(otu.ITS.ecto) ~ factor(Rate), data = env.ITS.ecto, method='euc')

otu.ITS.ecto.pca <- rda(sqrt(otu.ITS.ecto))
custom.plot.pca(otu.ITS.ecto.pca, factor(env.ITS.ecto$Rate), "", "n")

svg("../Data/Figures/pca_Ecto_ITS.svg")
belle.plot.pca(otu.ITS.ecto.pca, factor(env.ITS.ecto$Rate), "", "n")
dev.off()

otu.ITS.ecto.rda <- rda(sqrt(otu.ITS.ecto) ~ factor(Rate), data=env.ITS.ecto)
custom.plot.rda(otu.ITS.ecto.rda, factor(env.ITS.ecto$Rate), "", "n", 30, 3)

svg("../Data/Figures/rda_Ecto_ITS.svg")
belle.plot.rda(otu.ITS.ecto.rda, factor(env.ITS.ecto$Rate), "", "n", 30, 3)
dev.off()

# Endo
adonis(sqrt(otu.ITS.endo) ~ factor(Rate), data = env.ITS.endo, method='euc')

otu.ITS.endo.pca <- rda(sqrt(otu.ITS.endo))
custom.plot.pca(otu.ITS.endo.pca, factor(env.ITS.endo$Rate), "", "n")

otu.ITS.endo.rda <- rda(sqrt(otu.ITS.endo) ~ factor(Rate), data=env.ITS.endo)
custom.plot.rda(otu.ITS.endo.rda, factor(env.ITS.endo$Rate), "", "n", 30, 3)

svg("../Data/Figures/rda_endo_ITS.svg")
belle.plot.rda(otu.ITS.endo.rda, factor(env.ITS.endo$Rate), "", "n", 30, 3)
dev.off()


###mvabund
library(mvabund)

##16S
otu.16S.mvabund <- otu.16S[,which(apply(otu.16S*10000,2,max)>=5)]*10000
mod.16S <- manyglm(otu.16S.mvabund ~ env.16S.all$Compartment * factor(env.16S.all$Rate), family = "negative_binomial")
plot(mod.16S)

mod.16S.out <- anova(mod.16S, p.uni = "adjusted")
write.csv(mod.16S.out$table,"../Data/16S/16S.mvabund.table.csv")
write.csv(mod.16S.out$uni.test,"../Data/16S/16S.mvabund.uni.test.csv")
write.csv(mod.16S.out$uni.p,"../Data/16S/16S.mvabund.uni.p.csv")

##16S Soil
otu.16S.soil.mvabund <- otu.16S.soil[,which(apply(otu.16S.soil*10000,2,max)>=5)]*10000
mod.16S.soil <- manyglm(otu.16S.soil.mvabund ~ factor(env.16S.soil$Rate), family = "negative_binomial")
plot(mod.16S.soil)

mod.16S.soil.out <- anova(mod.16S.soil, p.uni = "adjusted")
write.csv(mod.16S.soil.out$table,"../Data/16S/16S.soil.mvabund.table.csv")
write.csv(mod.16S.soil.out$uni.test,"../Data/16S/16S.soil.mvabund.uni.test.csv")
write.csv(mod.16S.soil.out$uni.p,"../Data/16S/16S.soil.mvabund.uni.p.csv")

##16S Ecto
otu.16S.ecto.mvabund <- otu.16S.ecto[,which(apply(otu.16S.ecto*10000,2,max)>=5)]*10000
mod.16S.ecto <- manyglm(otu.16S.ecto.mvabund ~ factor(env.16S.ecto$Rate), family = "negative_binomial")
plot(mod.16S.ecto)

mod.16S.ecto.out <- anova(mod.16S.ecto, p.uni = "adjusted")
write.csv(mod.16S.ecto.out$table,"../Data/16S/16S.ecto.mvabund.table.csv")
write.csv(mod.16S.ecto.out$uni.test,"../Data/16S/16S.ecto.mvabund.uni.test.csv")
write.csv(mod.16S.ecto.out$uni.p,"../Data/16S/16S.ecto.mvabund.uni.p.csv")

##16S Endo
otu.16S.endo.mvabund <- otu.16S.endo[,which(apply(otu.16S.endo*10000,2,max)>=5)]*10000
mod.16S.endo <- manyglm(otu.16S.endo.mvabund ~ factor(env.16S.endo$Rate), family = "negative_binomial")
plot(mod.16S.endo)

mod.16S.endo.out <- anova(mod.16S.endo, p.uni = "adjusted")
write.csv(mod.16S.endo.out$table,"../Data/16S/16S.endo.mvabund.table.csv")
write.csv(mod.16S.endo.out$uni.test,"../Data/16S/16S.endo.mvabund.uni.test.csv")
write.csv(mod.16S.endo.out$uni.p,"../Data/16S/16S.endo.mvabund.uni.p.csv")


##ITS

otu.ITS.mvabund <- otu.ITS[,which(apply(otu.ITS*6700,2,max)>=5)]*6700
mod.ITS <- manyglm(otu.ITS.mvabund ~ env.ITS.all$Compartment * factor(env.ITS.all$Rate), family = "negative_binomial")
plot(mod.ITS)

mod.ITS.out <- anova(mod.ITS, p.uni = "adjusted")
write.csv(mod.ITS.out$table,"../Data/ITS/ITS.mvabund.table.csv")
write.csv(mod.ITS.out$uni.test,"../Data/ITS/ITS.mvabund.uni.test.csv")
write.csv(mod.ITS.out$uni.p,"../Data/ITS/ITS.mvabund.uni.p.csv")

##ITS Soil
otu.ITS.soil.mvabund <- otu.ITS.soil[,which(apply(otu.ITS.soil*6700,2,max)>=5)]*6700
mod.ITS.soil <- manyglm(otu.ITS.soil.mvabund ~ factor(env.ITS.soil$Rate), family = "negative_binomial")
plot(mod.ITS.soil)

mod.ITS.soil.out <- anova(mod.ITS.soil, p.uni = "adjusted")
write.csv(mod.ITS.soil.out$table,"../Data/ITS/ITS.soil.mvabund.table.csv")
write.csv(mod.ITS.soil.out$uni.test,"../Data/ITS/ITS.soil.mvabund.uni.test.csv")
write.csv(mod.ITS.soil.out$uni.p,"../Data/ITS/ITS.soil.mvabund.uni.p.csv")

##ITS Ecto
otu.ITS.ecto.mvabund <- otu.ITS.ecto[,which(apply(otu.ITS.ecto*6700,2,max)>=5)]*6700
mod.ITS.ecto <- manyglm(otu.ITS.ecto.mvabund ~ factor(env.ITS.ecto$Rate), family = "negative_binomial")
plot(mod.ITS.ecto)

mod.ITS.ecto.out <- anova(mod.ITS.ecto, p.uni = "adjusted")
write.csv(mod.ITS.ecto.out$table,"../Data/ITS/ITS.ecto.mvabund.table.csv")
write.csv(mod.ITS.ecto.out$uni.test,"../Data/ITS/ITS.ecto.mvabund.uni.test.csv")
write.csv(mod.ITS.ecto.out$uni.p,"../Data/ITS/ITS.ecto.mvabund.uni.p.csv")

##ITS Endo
otu.ITS.endo.mvabund <- otu.ITS.endo[,which(apply(otu.ITS.endo*6700,2,max)>=5)]*6700
mod.ITS.endo <- manyglm(otu.ITS.endo.mvabund ~ factor(env.ITS.endo$Rate), family = "negative_binomial")
plot(mod.ITS.endo)

mod.OTS.endo.out <- anova(mod.ITS.endo, p.uni = "adjusted")
write.csv(mod.OTS.endo.out$table,"../Data/ITS/ITS.endo.mvabund.table.csv")
write.csv(mod.OTS.endo.out$uni.test,"../Data/ITS/ITS.endo.mvabund.uni.test.csv")
write.csv(mod.OTS.endo.out$uni.p,"../Data/ITS/ITS.endo.mvabund.uni.p.csv")

### Heatmap

mypal <- colorRampPalette(c("White","Black"))
svg("../Data/ITS_heatmap.svg")
heatmap(sqrt(ITS.hm), col = mypal(256), Rowv = NA, Colv = NA, revC = TRUE, scale = "none")
dev.off()

pal <- colorRampPalette(c("White", "Black"))
svg("../Data/16S_heatmap2.svg")
heatmap(sqrt(hm.16S), Colv = NA, Rowv = NA, revC = TRUE, scale = "none", col = pal(256))
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

