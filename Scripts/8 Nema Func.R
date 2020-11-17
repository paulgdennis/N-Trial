#Nematode composition 
# Functional Guilds

Nemfunc <- read.table("Data/N_trial_data.csv", header = TRUE, sep=',')

names(Nemfunc)

for(i in colnames(Nemfunc[,33:41])){
  print(i)
  print(anova(lm(Nemfunc[,i]~Nemfunc$Rate)))
}

library(sciplot) 
bargraph.CI(Nemfunc$Rate, Nemfunc$Fu2,main="Fungal-feeders Fu2")
bargraph.CI(Nemfunc$Rate, Nemfunc$Ba1,main="Baterial-feeders Ba1")
bargraph.CI(Nemfunc$Rate, Nemfunc$Ba2,main="Bacterial Scavengers/Cephalobidae Ba2")
bargraph.CI(Nemfunc$Rate, Nemfunc$Ba3,main="Prismatolaimidae Ba3")
bargraph.CI(Nemfunc$Rate, Nemfunc$Ca3,main="Tripylidae Ca3")
bargraph.CI(Nemfunc$Rate, Nemfunc$Ca4,main="Mononchidae / Carnivores Ca4")
bargraph.CI(Nemfunc$Rate, Nemfunc$Om4,main="Dorylaimidae (small dorylaimids) Om4")
bargraph.CI(Nemfunc$Rate, Nemfunc$Ecto,main="Ectoparasites")
bargraph.CI(Nemfunc$Rate, Nemfunc$Endo,main="Endoparasites")

# Trophic level
bargraph.CI(Nemfunc$Rate, Nemfunc$Para,main="Parasitic Nematodes")
bargraph.CI(Nemfunc$Rate, Nemfunc$Fung,main="Fungivores")
bargraph.CI(Nemfunc$Rate, Nemfunc$Bact,main="Bacterivores")
bargraph.CI(Nemfunc$Rate, Nemfunc$Pred,main="Predators")
bargraph.CI(Nemfunc$Rate, Nemfunc$Omn,main="Omnivores")
bargraph.CI(Nemfunc$Rate, Nemfunc$Pred.Omn,main="Predatory Omnivores")

# Post hoc for Nem Functional Guilds
for(i in colnames(Nemfunc[,33:41])) {
  print(i)
  print(cld(lsmeans(aov(Nemfunc[,i] ~ factor(Rate), data= Nemfunc), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}

# ANOVA for Nem Trophic level
for(i in colnames(Nemfunc[,12:17])){
  print(i)
  print(anova(lm(Nemfunc[,i]~Nemfunc$Rate)))
}

# Post hoc for Nem Trophic level
for(i in colnames(Nemfunc[,12:17])) {
  print(i)
  print(cld(lsmeans(aov(Nemfunc[,i] ~ factor(Rate), data= Nemfunc), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}





