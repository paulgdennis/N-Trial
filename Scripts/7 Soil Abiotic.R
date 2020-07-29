
SoilChem <- read.table("Data/N_trial_data.csv", header = TRUE, sep=',')

names(SoilChem)

for(i in colnames(SoilChem[,56:93])){
  print(i)
  print(anova(lm(SoilChem[,i]~SoilChem$Rate)))
}



# Bar Graph for visualization
bargraph.CI(Soil$Rate,Soil Chem$ ,main="Electrical Conductivity")
bargraph.CI(Soil$Rate,Soil$Organic.Matter..W.B...1.72...,main="Organic Matter")
bargraph.CI(Soil$Rate,Soil$Lab.C,main="Labile C")






