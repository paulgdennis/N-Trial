
SoilChem <- read.table("Data/N_trial_data.csv", header = TRUE, sep=',')

names(SoilChem)

for(i in colnames(SoilChem[,56:93])){
  print(i)
  print(anova(lm(SoilChem[,i]~SoilChem$Rate)))
}

for(i in colnames(SoilChem[,56:93])) {
  print(i)
  print(cld(lsmeans(aov(SoilChem[,i] ~ factor(Rate), data= SoilChem), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}





