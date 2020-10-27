#Nematode composition

Nemfunc <- read.table("Data/N_trial_data.csv", header = TRUE, sep=',')

names(Nemfunc)

for(i in colnames(Nemfunc[,33:39])){
  print(i)
  print(anova(lm(Nemfunc[,i]~Nemfunc$Rate)))
}

library(sciplot) 
bargraph.CI(Nemfunc$Rate, Nemfunc$Fu2,main="Fu2")
bargraph.CI(Nemfunc$Rate, Nemfunc$Ca4,main="Ca4")
