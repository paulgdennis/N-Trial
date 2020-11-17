# 9 Microbiome - Alpha diversity analyses

source('Functions/Functions.R')

# Alpha diversity

# 16S

bargraph.CI(env.16S.all$Rate, env.16S.all$Sobs, env.16S.all$Compartment, legend = TRUE)
bargraph.CI(env.16S.all$Rate, env.16S.all$Chao1, env.16S.all$Compartment, legend = TRUE)
bargraph.CI(env.16S.all$Rate, env.16S.all$PD, env.16S.all$Compartment, legend = TRUE)
bargraph.CI(env.16S.all$Rate, env.16S.all$Shan, env.16S.all$Compartment, legend = TRUE)
bargraph.CI(env.16S.all$Rate, env.16S.all$Simp, env.16S.all$Compartment, legend = TRUE)

for(i in colnames(env.16S.all[,5:9])) {
  print(i)
  print(summary(aov(env.16S.all[,i] ~ env.16S.all$Compartment * factor(env.16S.all$Rate))))
}

# for(i in colnames(env.16S.all[,5:9])) {
#  print(i)
#  print(cld(lsmeans(aov(env.16S.all[,i] ~ factor(Rate), data= env.16S.all), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
# }


# ITS

bargraph.CI(env.ITS.all$Rate, env.ITS.all$Sobs, env.ITS.all$Compartment, legend = TRUE)
bargraph.CI(env.ITS.all$Rate, env.ITS.all$Chao1, env.ITS.all$Compartment, legend = TRUE)
bargraph.CI(env.ITS.all$Rate, env.ITS.all$Shan, env.ITS.all$Compartment, legend = TRUE)
bargraph.CI(env.ITS.all$Rate, env.ITS.all$Simp, env.ITS.all$Compartment, legend = TRUE)

for(i in colnames(env.ITS.all[,5:8])) {
  print(i)
  print(summary(aov(env.ITS.all[,i] ~ env.ITS.all$Compartment * factor(env.ITS.all$Rate))))
}

#for(i in colnames(env.ITS.all[,5:8])) {
#  print(i)
#  print(cld(lsmeans(aov(env.ITS.all[,i] ~ factor(Rate), data= env.ITS.all), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
#}