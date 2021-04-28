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


for(i in colnames(env.16S.soil[,5:9])) {
  print(i)
  print(summary(aov(env.16S.soil[,i] ~ factor(env.16S.soil$Rate))))
}

bargraph.CI(env.16S.soil$Rate, env.16S.soil$Sobs)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Chao1)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$PD)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Shan)
bargraph.CI(env.16S.soil$Rate, env.16S.soil$Simp)

for(i in colnames(env.16S.ecto[,5:9])) {
  print(i)
  print(summary(aov(env.16S.ecto[,i] ~ factor(env.16S.ecto$Rate))))
}

bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Sobs)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Chao1)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$PD)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Shan)
bargraph.CI(env.16S.ecto$Rate, env.16S.ecto$Simp)

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

for(i in colnames(env.ITS.soil[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.soil[,i] ~ factor(env.ITS.soil$Rate))))
}

bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Sobs)
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Chao1)
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Shan)
bargraph.CI(env.ITS.soil$Rate, env.ITS.soil$Simp)

for(i in colnames(env.ITS.ecto[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.ecto[,i] ~ factor(env.ITS.ecto$Rate))))
}

bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Sobs)
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Chao1)
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Shan)
bargraph.CI(env.ITS.ecto$Rate, env.ITS.ecto$Simp)

for(i in colnames(env.ITS.endo[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.endo[,i] ~ factor(env.ITS.endo$Rate))))
}

bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Sobs)
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Chao1)
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Shan)
bargraph.CI(env.ITS.endo$Rate, env.ITS.endo$Simp)
