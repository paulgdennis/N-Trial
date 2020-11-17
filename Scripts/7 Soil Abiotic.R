
SoilChem <- read.table("Data/N_trial_data.csv", header = TRUE, sep=',')

names(SoilChem)


for(i in colnames(SoilChem[,56:92])){
  print(i)
  print(anova(lm(SoilChem[,i]~SoilChem$Rate)))
}

library(multcomp) 

for(i in colnames(SoilChem[,56:92])) {
  print(i)
  print(cld(lsmeans(aov(SoilChem[,i] ~ factor(Rate), data= SoilChem), ~ factor(Rate), Letters = letters, adjust = "Tukey")))
}


library(sciplot)

# significant means (decreasing with N dose)
bargraph.CI(SoilChem$Rate, SoilChem$EC,main="Electrical Conductivity")
bargraph.CI(SoilChem$Rate, SoilChem$pH.cacl2,main="pH CaCl2")
bargraph.CI(SoilChem$Rate, SoilChem$pH.h2o,main="pH Water")
bargraph.CI(SoilChem$Rate, SoilChem$CEC,main="CEC")
bargraph.CI(SoilChem$Rate, SoilChem$Ca.amm.ace,main="Calcium (Amm.acet.)Meq.100g")
bargraph.CI(SoilChem$Rate, SoilChem$K.avail,main="Available Potassium")
bargraph.CI(SoilChem$Rate, SoilChem$K.amm.ace,main="Potassium (Amm.acet.)Meq.100g")
bargraph.CI(SoilChem$Rate, SoilChem$K.amm.ace.1,main="Potassium (Amm.acet.) %")

# significant means (increasing with N dose)
bargraph.CI(SoilChem$Rate, SoilChem$Al.ppm,main="Aluminum KCL (mg/kg)")
bargraph.CI(SoilChem$Rate, SoilChem$Al.KCl,main="Al KCl (Meq.100g")
bargraph.CI(SoilChem$Rate, SoilChem$Al.sat,main="Al % Saturattion")
bargraph.CI(SoilChem$Rate, SoilChem$Fe,main="Iron")


# significant but needs to check further with Tukey (also with the other significant paramenters)
bargraph.CI(SoilChem$Rate, SoilChem$Grass.index,main="Grass index")
bargraph.CI(SoilChem$Rate, SoilChem$S,main="Sulphur")

# both are significant but % Mg is low at 0 N and higher with Meq.100g vs other N dose
bargraph.CI(SoilChem$Rate, SoilChem$Mg.amm.ace,main="Mg (Amm.acet.) Meq.100g")
bargraph.CI(SoilChem$Rate, SoilChem$Mg.amm.ace.1,main="Mg (Amm.acet.) %")

# not significant means with increasing N dose)
bargraph.CI(SoilChem$Rate, SoilChem$CN,main="C:N Ratio")
bargraph.CI(SoilChem$Rate, SoilChem$ESP,main="Sodium % of Cations")
bargraph.CI(SoilChem$Rate, SoilChem$OM,main="Organic Matter (%) ")
bargraph.CI(SoilChem$Rate, SoilChem$OrgC,main="Organic Carbon (%)")
bargraph.CI(SoilChem$Rate, SoilChem$TC,main="Total Carbon (combustion)(%)")
bargraph.CI(SoilChem$Rate, SoilChem$TN,main="Total Nitrogen (Combustion)(%)")
bargraph.CI(SoilChem$Rate, SoilChem$Cl,main="Chloridev (mg.kg)")

bargraph.CI(SoilChem$Rate, SoilChem$PBI,main="Phosphorus Buffer Index")
bargraph.CI(SoilChem$Rate, SoilChem$P.colwell,main="Phosphorus")

bargraph.CI(SoilChem$Rate, SoilChem$Cu,main="Copper")
bargraph.CI(SoilChem$Rate, SoilChem$Mn,main="Manganese")
bargraph.CI(SoilChem$Rate, SoilChem$Zn,main="Zinc")

bargraph.CI(SoilChem$Rate, SoilChem$Clay.pc,main="Clay %")
bargraph.CI(SoilChem$Rate, SoilChem$Sand.pc,main="Sand %")
bargraph.CI(SoilChem$Rate, SoilChem$Silt.pc,main="Silt %")

# verify nitrogen level
bargraph.CI(SoilChem$Rate, SoilChem$NO3.N,main="Nitrate Nitrogen")
