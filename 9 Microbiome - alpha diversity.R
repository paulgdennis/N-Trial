# 9 Microbiome - Alpha diversity analyses

source('Functions.R')

# Alpha diversity

# 16S

bargraph.CI(env.16S.all$Compartment, env.16S.all$Sobs, env.16S.all$Rate, legend = TRUE)
bargraph.CI(env.16S.all$Compartment, env.16S.all$Chao1, env.16S.all$Rate, legend = TRUE)
bargraph.CI(env.16S.all$Compartment, env.16S.all$PD, env.16S.all$Rate, legend = TRUE)
bargraph.CI(env.16S.all$Compartment, env.16S.all$Shan, env.16S.all$Rate, legend = TRUE)
bargraph.CI(env.16S.all$Compartment, env.16S.all$Simp, env.16S.all$Rate, legend = TRUE)

for(i in colnames(env.16S.all[,5:9])) {
  print(i)
  print(summary(aov(env.16S.all[,i] ~ env.16S.all$Compartment * factor(env.16S.all$Rate))))
}

##Soil

for(i in colnames(env.16S.soil[,5:9])) {
  print(i)
  print(summary(aov(env.16S.soil[,i] ~ factor(env.16S.soil$Rate))))
}


bargraph.CI(env.16S.soil$Rate, env.16S.soil$Sobs)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Chao1)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$PD)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Shan)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Simp)


##Ecto

for(i in colnames(env.16S.ecto[,5:9])) {
  print(i)
  print(summary(aov(env.16S.ecto[,i] ~ factor(env.16S.ecto$Rate))))
}

bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Sobs)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Chao1)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$PD)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Shan)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Simp)

##Endo

for(i in colnames(env.16S.endo[,5:9])) {
  print(i)
  print(summary(aov(env.16S.endo[,i] ~ factor(env.16S.endo$Rate))))
}

bargraph.CI(env.16S.endo$Rate, env.16S.endo$Sobs)
bargraph.CI(env.16S.endo$Rate, env.16S.endo$Chao1)
bargraph.CI(env.16S.endo$Rate, env.16S.endo$PD)
bargraph.CI(env.16S.endo$Rate, env.16S.endo$Shan)
bargraph.CI(env.16S.endo$Rate, env.16S.endo$Simp)


# for(i in colnames(env.16S.all[,5:9])) {
#  print(i)
#  print(cld(lsmeans(aov(env.16S.all[,i] ~ factor(Rate), data= env.16S.all), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
# }


# ITS

bargraph.CI(env.ITS.all$Compartment, env.ITS.all$Sobs, env.ITS.all$Rate, legend = TRUE)
bargraph.CI(env.ITS.all$Compartment, env.ITS.all$Chao1, env.ITS.all$Rate, legend = TRUE)
bargraph.CI(env.ITS.all$Compartment, env.ITS.all$Shan, env.ITS.all$Rate, legend = TRUE)
bargraph.CI(env.ITS.all$Compartment, env.ITS.all$Simp, env.ITS.all$Rate, legend = TRUE)

for(i in colnames(env.ITS.all[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.all[,i] ~ env.ITS.all$Compartment * factor(env.ITS.all$Rate))))
}

for(i in colnames(env.ITS.all[,5:8])) {
  print(i)
  print(cld(lsmeans(aov(env.ITS.all[,i] ~ factor(Rate), data= env.ITS.all), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}

##Soil

for(i in colnames(env.ITS.soil[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.soil[,i] ~ factor(env.ITS.soil$Rate))))
}

bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Sobs)
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Chao1)
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Shan)
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Simp)

##Ecto

for(i in colnames(env.ITS.ecto[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.ecto[,i] ~ factor(env.ITS.ecto$Rate))))
}

bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Sobs)
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Chao1)
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Shan)
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Simp)

#Endo

for(i in colnames(env.ITS.endo[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.endo[,i] ~ factor(env.ITS.endo$Rate))))
}

bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Sobs)
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Chao1)
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Shan)
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Simp)


##Code for saving (as above but with extra steps)##

# 16S

##Soil

svg("../Data/Figures/16S.soil.sobs.svg")
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Sobs)
dev.off()
cld(lsmeans(aov(env.16S.soil$Sobs ~ factor(Rate), data= env.16S.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.soil.chao1.svg")
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Chao1)
dev.off()
cld(lsmeans(aov(env.16S.soil$Chao1 ~ factor(Rate), data= env.16S.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.soil.pd.svg")
bargraph.CI(env.16S.soil$Rate, env.16S.soil$PD)
dev.off()
cld(lsmeans(aov(env.16S.soil$PD ~ factor(Rate), data= env.16S.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.soil.shan.svg")
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Shan)
dev.off()
cld(lsmeans(aov(env.16S.soil$Shan ~ factor(Rate), data= env.16S.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.soil.simp.svg")
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Simp)
dev.off()
cld(lsmeans(aov(env.16S.soil$Simp ~ factor(Rate), data= env.16S.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

##Ecto

svg("../Data/Figures/16S.ecto.sobs.svg")
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Sobs)
dev.off()
cld(lsmeans(aov(env.16S.ecto$Sobs ~ factor(Rate), data= env.16S.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.ecto.chao1.svg")
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Chao1)
dev.off()
cld(lsmeans(aov(env.16S.ecto$Chao1 ~ factor(Rate), data= env.16S.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.ecto.pd.svg")
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$PD)
dev.off()
cld(lsmeans(aov(env.16S.ecto$PD ~ factor(Rate), data= env.16S.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.ecto.shan.svg")
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Shan)
dev.off()
cld(lsmeans(aov(env.16S.ecto$Shan ~ factor(Rate), data= env.16S.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.ecto.simp.svg")
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Simp)
dev.off()
cld(lsmeans(aov(env.16S.ecto$Simp ~ factor(Rate), data= env.16S.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

##Endo

svg("../Data/Figures/16S.endo.sobs.svg")
bargraph.CI(env.16S.endo$Rate, env.16S.endo$Sobs)
dev.off()
cld(lsmeans(aov(env.16S.endo$Sobs ~ factor(Rate), data= env.16S.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.endo.chao1.svg")
bargraph.CI(env.16S.endo$Rate, env.16S.endo$Chao1)
dev.off()
cld(lsmeans(aov(env.16S.endo$Chao1 ~ factor(Rate), data= env.16S.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.endo.pd.svg")
bargraph.CI(env.16S.endo$Rate, env.16S.endo$PD)
dev.off()
cld(lsmeans(aov(env.16S.endo$PD ~ factor(Rate), data= env.16S.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.endo.shan.svg")
bargraph.CI(env.16S.endo$Rate, env.16S.endo$Shan)
dev.off()
cld(lsmeans(aov(env.16S.endo$Shan ~ factor(Rate), data= env.16S.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/16S.endo.simp.svg")
bargraph.CI(env.16S.endo$Rate, env.16S.endo$Simp)
dev.off()
cld(lsmeans(aov(env.16S.endo$Simp ~ factor(Rate), data= env.16S.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

# ITS

##Soil

svg("../Data/Figures/ITS.soil.sobs.svg")
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Sobs)
dev.off()
cld(lsmeans(aov(env.ITS.soil$Sobs ~ factor(Rate), data= env.ITS.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.soil.chao1.svg")
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Chao1)
dev.off()
cld(lsmeans(aov(env.ITS.soil$Chao1 ~ factor(Rate), data= env.ITS.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.soil.shan.svg")
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Shan)
dev.off()
cld(lsmeans(aov(env.ITS.soil$Shan ~ factor(Rate), data= env.ITS.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.soil.simp.svg")
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Simp)
dev.off()
cld(lsmeans(aov(env.ITS.soil$Simp ~ factor(Rate), data= env.ITS.soil), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

##Ecto

svg("../Data/Figures/ITS.ecto.sobs.svg")
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Sobs)
dev.off()
cld(lsmeans(aov(env.ITS.ecto$Sobs ~ factor(Rate), data= env.ITS.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.ecto.chao1.svg")
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Chao1)
dev.off()
cld(lsmeans(aov(env.ITS.ecto$Chao1 ~ factor(Rate), data= env.ITS.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.ecto.shan.svg")
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Shan)
dev.off()
cld(lsmeans(aov(env.ITS.ecto$Shan ~ factor(Rate), data= env.ITS.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.ecto.simp.svg")
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Simp)
dev.off()
cld(lsmeans(aov(env.ITS.ecto$Simp ~ factor(Rate), data= env.ITS.ecto), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

##Endo

svg("../Data/Figures/ITS.endo.sobs.svg")
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Sobs)
dev.off()
cld(lsmeans(aov(env.ITS.endo$Sobs ~ factor(Rate), data= env.ITS.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.endo.chao1.svg")
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Chao1)
dev.off()
cld(lsmeans(aov(env.ITS.endo$Chao1 ~ factor(Rate), data= env.ITS.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.endo.shan.svg")
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Shan)
dev.off()
cld(lsmeans(aov(env.ITS.endo$Shan ~ factor(Rate), data= env.ITS.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

svg("../Data/Figures/ITS.endo.simp.svg")
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Simp)
dev.off()
cld(lsmeans(aov(env.ITS.endo$Simp ~ factor(Rate), data= env.ITS.endo), ~ factor(Rate), Letters = letters, adjust = "Tukey"))

